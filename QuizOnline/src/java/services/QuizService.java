/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.AnswerDao;
import dao.QuestionDao;
import dao.QuizDao;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Vector;
import model.Answer;
import model.Page;
import model.Question;
import model.Quiz;
import model.Result;
import org.apache.log4j.Logger;

/**
 *
 * @author ADMIN
 */
public class QuizService {

    static Logger log = Logger.getLogger(QuizService.class.getName());
    private QuizDao quizDao = null;
    private QuestionDao quesDao = null;
    private AnswerDao ansDao = null;

    public QuizService() {
        quizDao = new QuizDao();
    }

    public Result saveQuiz(Quiz quiz) {
        Result result = null;
        try {
            Integer correctNumQuestion = 0;
            Vector<Question> questionQuiz = quiz.getQuestionList();
            HashMap<Integer, Answer> quizResult = quiz.getResultOfQuiz();
            BigDecimal totalScore = new BigDecimal(0);
            String userId = quiz.getUserId();
            String subjectId = quiz.getSubjectId();
            totalScore = getTotalScore(quizResult, questionQuiz.size());
            Integer saveQuizId = new Integer(0);
            saveQuizId = quizDao.saveQuiz(userId, subjectId, totalScore);
            int numOfquestion = quizResult.size();

            if (saveQuizId > 0) {
                if (result == null) {
                    result = new Result();
                }
                for (Integer questionId : quizResult.keySet()) {
                    Answer ans = quizResult.get(questionId);
                    if (ans.isIsCorrect()) {
                        double detailScoreD = 10 / numOfquestion;
                        BigDecimal detailScore = new BigDecimal(detailScoreD);
                        quizDao.saveQuizDetail(saveQuizId, questionId, ans.getAnswerId(), ans.isIsCorrect(), detailScore);
                        correctNumQuestion++;
                        result.setCorrectAnswer(correctNumQuestion);

                    } else {
                        quizDao.saveQuizDetail(saveQuizId, questionId, ans.getAnswerId(), ans.isIsCorrect(), new BigDecimal(0));
                    }

                }

            }
            result.setTotalScore(totalScore);
            result.setTotalQuestion(numOfquestion);
        } catch (Exception e) {
            //
            log.info(e.toString());
            return null;
        }

        return result;
    }

    private BigDecimal getTotalScore(HashMap<Integer, Answer> quizResult, int numOfQuestion) {
        int numOfquestion = numOfQuestion;
        try {
            double detailScoreD = 10.0 / numOfquestion;
            BigDecimal detailScore = new BigDecimal(detailScoreD);
            BigDecimal totalScore = new BigDecimal(0);
            for (Integer key : quizResult.keySet()) {
                Answer answer = quizResult.get(key);
                if (answer.isIsCorrect()) {
                    totalScore = totalScore.add(detailScore);
                }
            }
            if (totalScore.compareTo(new BigDecimal(10.0)) == 1) {
                totalScore = new BigDecimal(10.0);
            }

            totalScore = totalScore.setScale(2, BigDecimal.ROUND_HALF_EVEN);
            return totalScore;
        } catch (Exception e) {
            log.info(e.toString());
        }
        return null;
    }

    public Vector<Quiz> getQuizHistory(String userId, Page page) {
        Vector<Quiz> quizList = null;
        page = quizDao.getAllQuizByUserId(page, userId);
        Integer end = page.getNumObjectInPage();
        Integer start = (page.getIndexPage() * page.getNumObjectInPage()) - page.getNumObjectInPage();
        quizList = quizDao.getQuizByUserId(userId, start, end);
        if (quizList == null) {
            quizList = new Vector<Quiz>();
        }
        return quizList;
    }

    public Quiz getDetailQuestion(int quizId) {
        quesDao = new QuestionDao();
        ansDao = new AnswerDao();
        Quiz quiz = new Quiz();
        Vector<Question> questionList = quesDao.getQuestionByQuizId(quizId);
        Vector<Answer> answerList = ansDao.getAnswerByQuizId(quizId);
        HashMap<Integer, Answer> resultOfQuiz = new HashMap<Integer, Answer>();
        for (Question question : questionList) {
            int questionIdQ = question.getQuestionId();
            for (Answer answer : answerList) {
                int questionIdA = answer.getQuestionId();
                if (questionIdA == questionIdQ) {
                    resultOfQuiz.put(questionIdQ, answer);
                }
            }
        }
        quiz.setQuestionList(questionList);
        quiz.setQuizId(quizId);
        quiz.setResultOfQuiz(resultOfQuiz);
        return quiz;
    }
    
    public Vector<Quiz> getQuizSearched(String userId, String subjectId, Page pageOb) {
        Vector<Quiz> quizList = null;
        pageOb = quizDao.getAllQuizBySubjectAndUserId(pageOb, userId, subjectId);
        Integer end = pageOb.getNumObjectInPage();
        Integer start = (pageOb.getIndexPage() * pageOb.getNumObjectInPage()) - pageOb.getNumObjectInPage();
        quizList = quizDao.getQuizBySubjectAndUserId(userId, subjectId, start, end);
        if (quizList == null) {
            quizList = new Vector<Quiz>();
        }
        return quizList;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dao.AnswerDao;
import dao.QuestionDao;
import dao.SubjectDao;
import java.util.Vector;
import model.Answer;
import model.Page;
import model.Question;

/**
 *
 * @author ADMIN
 */
public class QuestionService {

    private QuestionDao questionDao;
    private AnswerDao answerDao;
    private SubjectDao subjectDao;

    public QuestionService() {
        questionDao = new QuestionDao();
        answerDao = new AnswerDao();
        subjectDao = new SubjectDao();
    }

    public Vector<Question> getQuestionBySubject(Page pageOb, String subjectId) {
        pageOb = questionDao.getAllNumBySubject(pageOb, subjectId);
        Integer end = pageOb.getNumObjectInPage();
        Integer start = (pageOb.getIndexPage() * pageOb.getNumObjectInPage()) - pageOb.getNumObjectInPage();
        Vector<Question> questions = questionDao.getQuestionBySubject(subjectId, start, end);
        for (Question ques : questions) {
            int quesId = ques.getQuestionId();
            Vector<Answer> answer = answerDao.getAnswerOfQuestion(quesId);
            if (!answer.isEmpty()) {
                ques.setAnswers(answer);
            }
        }
        return questions;
    }

    public Vector<Question> getQuestionByName(Page pageOb, String name, String subjectId) {
        pageOb = questionDao.getAllNumByName(pageOb, name, subjectId);
        Integer end = pageOb.getNumObjectInPage();
        Integer start = (pageOb.getIndexPage() * pageOb.getNumObjectInPage()) - pageOb.getNumObjectInPage();
        Vector<Question> questions = questionDao.getQuestionByName(name, subjectId, start, end);
        for (Question ques : questions) {
            int quesId = ques.getQuestionId();
            Vector<Answer> answer = answerDao.getAnswerOfQuestion(quesId);
            if (!answer.isEmpty()) {
                ques.setAnswers(answer);
            }
        }
        return questions;
    }

    public Vector<Question> getQuestionByState(Page pageOb, boolean state, String subjectId) {
        pageOb = questionDao.getAllNumByState(pageOb, state, subjectId);
        Integer end = pageOb.getNumObjectInPage();
        Integer start = (pageOb.getIndexPage() * pageOb.getNumObjectInPage()) - pageOb.getNumObjectInPage();
        Vector<Question> questions = questionDao.getQuestionByState(state, subjectId, start, end);
        for (Question ques : questions) {
            int quesId = ques.getQuestionId();
            Vector<Answer> answer = answerDao.getAnswerOfQuestion(quesId);
            if (!answer.isEmpty()) {
                ques.setAnswers(answer);
            }
        }
        return questions;
    }

    public boolean createQuestion(Question question) {
        boolean result = false;
        Integer questionId = null;
        Vector<Answer> answers = question.getAnswers();
        String subjectId = question.getSubjectId();
        String questionName = question.getQuestionContent();
        questionId = questionDao.createQuestion(questionName, subjectId);
        if (questionId != null) {
            for (Answer answer : answers) {
                result = answerDao.addAnswer(answer.getAnswerContent(), answer.isIsCorrect(), questionId);
                if (result == false) {
                    break;
                }
            }
        }
        return result;
    }

    public boolean updateQuestion(Question question) {
       
        boolean result = false;
        Integer questionId = null;
        Vector<Answer> answers = question.getAnswers();

        questionId = question.getQuestionId();
        String subjectId = question.getSubjectId();
        String questionName = question.getQuestionContent();
        result = questionDao.updateQuestion(questionId, questionName, subjectId);
        if (result == true) {
            for (Answer answer : answers) {
                result = answerDao.updateAnswer(answer.getAnswerContent(), answer.isIsCorrect(), questionId, answer.getAnswerId());
                if (result == false) {
                    break;
                }
            }
        }
        return result;
    }

    public Question getQuestionById(int questionId) {
        Question question = null;
        question = questionDao.getQuestionById(questionId);
        Vector<Answer> answers = answerDao.getAnswerOfQuestion(questionId);
        question.setAnswers(answers);
        return question;
    }

    public boolean deleteQuestion(int questionId) {
        boolean result = false;
        result = questionDao.deleteQuestion(questionId);
        return result;
    }

    public Vector<Question> getQuestionForQuiz(String subjectId) {
        Vector<Question> questionListForQuiz = null;
        questionListForQuiz = questionDao.getQuestionForQuiz(subjectId);
        if (questionListForQuiz != null) {
            for(Question question:questionListForQuiz){
                Vector<Answer> anwers = answerDao.getAnswerOfQuestion(question.getQuestionId());
                question.setAnswers(anwers);   
            }
        }
        return questionListForQuiz;
    }

}

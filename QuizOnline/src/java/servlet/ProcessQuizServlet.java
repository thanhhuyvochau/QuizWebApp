/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Answer;
import model.Question;
import model.Quiz;
import model.Result;
import org.apache.log4j.Logger;
import services.QuizService;

/**
 *
 * @author ADMIN
 */
public class ProcessQuizServlet extends HttpServlet {

    static Logger log = Logger.getLogger(ProcessQuizServlet.class.getName());

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        Quiz quiz = (Quiz) session.getAttribute("quiz");
        if (quiz == null) {
            response.sendError(404);
        }
        String timeSave = request.getParameter("timeSave");
        String indexString = request.getParameter("indexSave");
        String answerId = request.getParameter("radio");
        String action = request.getParameter("btnAction");
        String questionId = request.getParameter("questionSave");
        int questionIdInt = 0;
        int answerIdInt = 0;
        int index = 0;
        int minuest = 0;
        int second = 0;
        int totalSecond = 0;
        //time handle
        try {
            String[] time = timeSave.split(":");
            if (time.length == 2) {
                minuest = Integer.parseInt(time[0]) * 60;
                second = Integer.parseInt(time[1]);
                totalSecond = minuest + second;
            } else {
                second = Integer.parseInt(time[0]);
            }
            //---
            if (answerId != null) {
                answerIdInt = Integer.parseInt(answerId);
            }
            questionIdInt = Integer.parseInt(questionId);

            index = Integer.parseInt(indexString);
        } catch (Exception e) {
            response.sendError(404);
        }
        Answer answerOb = null;
        Vector<Question> questionList = quiz.getQuestionList();
        if (answerId != null) {
            //get Answer List of question was identifyed
            Vector<Answer> answers = null;
            for (Question question : questionList) {
                if (question.getQuestionId() == questionIdInt) {
                    answers = question.getAnswers();
                    break;
                }
            }

            if (answers == null) {
                response.sendError(404);
            }

            //get the answer object we just have answered.
            for (Answer answer : answers) {
                if (answer.getAnswerId() == answerIdInt) {
                    answerOb = answer;
                    break;
                }
            }

            if (answerOb == null) {
                response.sendError(404);
            }
        }

        if (action.equalsIgnoreCase("next")) {
            index = index + 1;
            quiz.setTime(totalSecond);
            HashMap<Integer, Answer> questionResults = quiz.getResultOfQuiz();
            Integer key = new Integer(questionId);
            try {
                questionResults.put(key, answerOb);
            } catch (Exception e) {
                //log
            }
            Question questionNext = questionList.get(index);
            Answer seledted = questionResults.get(questionNext.getQuestionId());
            if (seledted != null) {
                request.setAttribute("select", seledted.getAnswerId());
            }
            session.setAttribute("quiz", quiz);
            session.setAttribute("question", quiz.getQuestionList().get(index));
            session.setAttribute("index", index);
            session.setAttribute("quiz", quiz);

            session.setAttribute("questionNum", (index + 1) + "/" + quiz.getQuestionList().size());

        } else if (action.equalsIgnoreCase("previous")) {
            index = index - 1;
            if (index < 0) {
                index = 0;
            }
            quiz.setTime(totalSecond);
            HashMap<Integer, Answer> questionResults = quiz.getResultOfQuiz();

            Integer key = new Integer(questionId);
            try {
                questionResults.put(key, answerOb);
            } catch (Exception e) {
                e.toString();
            }
            Question questionPrevious = questionList.get(index);
            Answer seledted = questionResults.get(questionPrevious.getQuestionId());
            if (seledted != null) {
                request.setAttribute("select", seledted.getAnswerId());
            }
            session.setAttribute("quiz", quiz);
            session.setAttribute("question", quiz.getQuestionList().get(index));
            session.setAttribute("index", index);
            session.setAttribute("quiz", quiz);

            session.setAttribute("questionNum", (index + 1) + "/" + quiz.getQuestionList().size());
        } else if (action.equalsIgnoreCase("finish")) {
            HashMap<Integer, Answer> questionResults = quiz.getResultOfQuiz();
            Integer key = new Integer(questionId);
            try {
                questionResults.put(key, answerOb);
            } catch (Exception e) {
                log.info(e.toString());
            }
            for (Question question : questionList) {
                Answer s = questionResults.get(question.getQuestionId());
                if (s == null) {
                    s = new Answer();
                    s.setAnswerContent("");
                    questionResults.put(question.getQuestionId(), s);
                }
            }
            QuizService quizService = new QuizService();
            Result quizConclude = null;
            quizConclude = quizService.saveQuiz(quiz);
            if (quizConclude != null) {
                session.removeAttribute("quiz");
                session.removeAttribute("index");
                session.removeAttribute("question");
                request.setAttribute("totalQuestion", quizConclude.getTotalQuestion());
                request.setAttribute("correctQuestion", quizConclude.getCorrectAnswer());
                request.setAttribute("totalScore", quizConclude.getTotalScore());
                request.getRequestDispatcher("/view/result.jsp").forward(request, response);

            } else {
                response.sendError(0);
            }
        }
        request.getRequestDispatcher("/view/quiz.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

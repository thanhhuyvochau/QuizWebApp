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
import services.QuizService;

/**
 *
 * @author ADMIN
 */
public class TimerFinishQuizServlet extends HttpServlet {

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
        String action = request.getParameter("btnAction");
        Quiz quiz = (Quiz) session.getAttribute("quiz");
        HashMap<Integer, Answer> resultOfQuiz = null;
        if (action.trim().equals("timerFinish") && quiz != null) {

            Vector<Question> questionList = quiz.getQuestionList();
            //get Answer List of question was identifyed
            Vector<Answer> answers = null;
            String questionSave = request.getParameter("questionSave");
            int questionIdInt = Integer.parseInt(questionSave);
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
            String answerId = request.getParameter("radio");
            Answer answerOb = null;
            if (answerId != null) {
                int answerIdInt = Integer.parseInt(answerId);

                for (Answer answer : answers) {
                    if (answer.getAnswerId() == answerIdInt) {
                        answerOb = answer;
                        break;
                    }
                }
            }
            resultOfQuiz = quiz.getResultOfQuiz();            
            resultOfQuiz.put(questionIdInt, answerOb);
            //prevent null answer.
            for (Question question : questionList) {
                Answer s = resultOfQuiz.get(question.getQuestionId());
                if (s == null) {
                    s = new Answer();
                    s.setAnswerContent("");
                    resultOfQuiz.put(question.getQuestionId(), s);
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
        } else {
            //lead to error page.  
        }
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

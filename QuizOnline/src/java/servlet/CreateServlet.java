/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import error.QuestionError;
import java.io.IOException;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Answer;
import model.Question;
import model.Subject;
import services.QuestionService;
import services.SubjectService;
import validation.QuestionValidator;

/**
 *
 * @author ADMIN
 */
public class CreateServlet extends HttpServlet {

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
        //check it need to create or just forward to create
        String action = request.getParameter("action");
        SubjectService subjectService = new SubjectService();
        Vector<Subject> subjectList = new Vector<Subject>();
        subjectList = subjectService.getAllSubject();
        request.setAttribute("subjectList", subjectList);
        if (action == null) { //it mean we just need to forawrd to the page if it not null it mean me submit the form

            request.getRequestDispatcher("/view/createPage.jsp").forward(request, response);
        }
        //
        QuestionValidator quesValid = new QuestionValidator();
        QuestionService quesS = new QuestionService();
        QuestionError state = new QuestionError();
        String questionName = request.getParameter("questionContent");
        request.setAttribute("questionNameC", questionName);
        String subjectId = request.getParameter("subjectId");
        request.setAttribute("subjectIdC",subjectId);
        String correctAnswer = request.getParameter("correctA");
        request.setAttribute("correctAC", correctAnswer);
        String answer1 = request.getParameter("a1");
        request.setAttribute("answer1C", answer1);
        String answer2 = request.getParameter("a2");
        request.setAttribute("answer2C", answer2);
        String answer3 = request.getParameter("a3");
        request.setAttribute("answer3C", answer3);
        state = quesValid.checkQuestion(questionName, correctAnswer, answer1, answer2, answer3);
        Question question = new Question();
        question.setQuestionContent(questionName);
        question.setSubjectId(subjectId);
        Answer correctA = new Answer();
        correctA.setAnswerContent(correctAnswer);
        correctA.setIsCorrect(true);
        Answer a1 = new Answer();
        a1.setAnswerContent(answer1);
        Answer a2 = new Answer();
        a2.setAnswerContent(answer2);
        Answer a3 = new Answer();
        a3.setAnswerContent(answer3);
        Vector<Answer> answer = new Vector<Answer>();
        answer.add(a1);
        answer.add(a2);
        answer.add(a3);
        answer.add(correctA);
        question.setAnswers(answer);
        if (state.getMessage().equals(QuestionError.VALID_SUCCESS)) {
            boolean result = quesS.createQuestion(question);
            if (result) {
                request.getRequestDispatcher("LoadAdminPage").forward(request, response);
            } else {
                request.setAttribute("message", "Create Fail, Try Again!");
            }
        } else {
            request.setAttribute("message", state.getMessage());
            //set attribute tra ve
        }

        request.getRequestDispatcher("/view/createPage.jsp").forward(request, response);
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

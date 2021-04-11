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
import org.apache.log4j.Logger;
import services.QuestionService;
import services.SubjectService;
import validation.QuestionValidator;

/**
 *
 * @author ADMIN
 */
public class UpdateServlet extends HttpServlet {
 static Logger log = Logger.getLogger(UpdateServlet.class.getName());
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
        String questionId = request.getParameter("questionId");
        SubjectService subS = new SubjectService();
        Vector<Subject> subjectList = subS.getAllSubject();
        QuestionService quesS = new QuestionService();
        QuestionValidator quesValid = new QuestionValidator();

        if (questionId == null || !questionId.matches("[0-9]+")) {
            //log break;
        } else {
            int quesId = Integer.parseInt(questionId);
            String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
            if (action.equalsIgnoreCase("update")) {
                QuestionError state = new QuestionError();
                String questionName = request.getParameter("questionContent");
                String subjectId = request.getParameter("subjectId");
                String correctAnswer = request.getParameter("correctA");
                String correctId = request.getParameter("correctAId");
                String answer1 = request.getParameter("a1");
                String answer1Id = request.getParameter("a1Id");
                String answer2 = request.getParameter("a2");
                String answer2Id = request.getParameter("a2Id");
                String answer3 = request.getParameter("a3");
                String answer3Id = request.getParameter("a3Id");
                Integer cr1Int = null;
                Integer a1Id = null;
                Integer a2Id = null;
                Integer a3Id = null;
                try {
                    cr1Int = Integer.parseInt(correctId);
                    a1Id = Integer.parseInt(answer1Id);
                    a2Id = Integer.parseInt(answer2Id);
                    a3Id = Integer.parseInt(answer3Id);

                } catch (Exception e) {
                    //error lead
                    log.info(e.toString());
                }

                Question question = new Question();
                question.setQuestionId(quesId);
                question.setQuestionContent(questionName);
                question.setSubjectId(subjectId);
                Answer correctA = new Answer();
                correctA.setAnswerContent(correctAnswer);
                correctA.setAnswerId(cr1Int);
                correctA.setIsCorrect(true);
                Answer a1 = new Answer();
                a1.setAnswerId(a1Id);
                a1.setAnswerContent(answer1);
                Answer a2 = new Answer();
                a2.setAnswerId(a2Id);
                a2.setAnswerContent(answer2);
                Answer a3 = new Answer();
                a3.setAnswerId(a3Id);
                a3.setAnswerContent(answer3);
                Vector<Answer> answer = new Vector<Answer>();
                answer.add(a1);
                answer.add(a2);
                answer.add(a3);
                answer.add(correctA);
                question.setAnswers(answer);

                state = quesValid.checkQuestion(questionName,correctAnswer ,answer1, answer2, answer3);
                if (state.getMessage().equals(QuestionError.VALID_SUCCESS)) {
                    boolean result = quesS.updateQuestion(question);
                    if (result == true) {
                        request.getRequestDispatcher("LoadAdminPage").forward(request, response);
                    } else {
                        request.setAttribute("questionUpdated", question);
                        request.setAttribute("message", "Update Fail, Try Again!");

                    }
                } else {
                    request.setAttribute("questionUpdated", question);
                    request.setAttribute("message", state.getMessage());

                    //set attribute tra ve
                }

            } else if (action == null || action.trim().length() == 0) {
                try {
                    int questionIdInt = Integer.parseInt(questionId);
                    Question question = quesS.getQuestionById(questionIdInt);
                    request.setAttribute("questionUpdated", question);
                } catch (Exception e) {
                    log.info(e.toString());
                }

            } else {
                //error page 
            }
        }

        request.setAttribute("subjectList", subjectList);
        request.getRequestDispatcher("/view/updatePage.jsp").forward(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Page;
import model.Question;
import model.Subject;
import services.QuestionService;
import services.SubjectService;

/**
 *
 * @author ADMIN
 */
public class LoadAdminPage extends HttpServlet {

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
        SubjectService subjectS = new SubjectService();
        QuestionService quesS = new QuestionService();
        Vector<Subject> subjectList = subjectS.getAllSubject();
        Page pagePRJ311 = new Page();
        Page pagePRJ321 = new Page();
        String indexPRJ311 = request.getParameter("indexPRJ311");
        String indexPRJ321 = request.getParameter("indexPRJ321");
        Vector<Question> PRJ311 = null;
        Vector<Question> PRJ321 = null;
        if (indexPRJ311 != null) {
            try {
                int index = Integer.parseInt(indexPRJ311);
                pagePRJ311.setIndexPage(index);
                PRJ311 = quesS.getQuestionBySubject(pagePRJ311, subjectList.get(0).getSubjectId());
                PRJ321 = quesS.getQuestionBySubject(pagePRJ321, subjectList.get(1).getSubjectId());
                request.setAttribute("tabSelected", "PRJ311");
            } catch (Exception e) {
                //log
            }

        } else if (indexPRJ321 != null) {
            try {
                int index = Integer.parseInt(indexPRJ321);
                pagePRJ321.setIndexPage(index);
                PRJ321 = quesS.getQuestionBySubject(pagePRJ321, subjectList.get(1).getSubjectId());
                PRJ311 = quesS.getQuestionBySubject(pagePRJ311, subjectList.get(0).getSubjectId());
                request.setAttribute("tabSelected", "PRJ321");
            } catch (Exception e) {
                //log
            }

        } else if (indexPRJ311 == null && indexPRJ321 == null) {
            PRJ311 = quesS.getQuestionBySubject(pagePRJ311, subjectList.get(0).getSubjectId());
            PRJ321 = quesS.getQuestionBySubject(pagePRJ321, subjectList.get(1).getSubjectId());
            request.setAttribute("tabSelected", "PRJ311");
        }
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("PRJ311", PRJ311);
        request.setAttribute("PRJ321", PRJ321);
        request.setAttribute("pagePRJ311", pagePRJ311);
        request.setAttribute("pagePRJ321", pagePRJ321);
        request.setAttribute("servlet","LoadAdminPage");
        request.setAttribute("numOfQues",pagePRJ311.getTotalRecordNum() + pagePRJ321.getTotalRecordNum());
        request.getRequestDispatcher("/view/adminPage.jsp").forward(request, response);
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

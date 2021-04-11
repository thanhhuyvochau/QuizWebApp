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
import javax.servlet.http.HttpSession;
import model.Page;
import model.Quiz;
import model.Subject;
import model.User;
import services.QuizService;
import services.SubjectService;

/**
 *
 * @author ADMIN
 */
public class HistorySearchServlet extends HttpServlet {

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
        User user = (User) session.getAttribute("identify");
        String subjectId = request.getParameter("subjectId");
        String pageNum = request.getParameter("pageNum");
        QuizService quizs = new QuizService();
        SubjectService subS = new SubjectService();
        Page page = new Page();
        if (pageNum != null) {
            page.setIndexPage(Integer.parseInt(pageNum));
        }

        if (subjectId == null) {
            response.sendError(404);
        } else if (subjectId.length() == 0) {
            response.sendError(404);
        } else {
            Vector<Quiz> quizList = quizs.getQuizSearched(user.getEmail().trim(), subjectId, page);
            Vector<Subject> subjectList = subS.getAllSubject();
            request.setAttribute("page", page);
            request.setAttribute("history", quizList);
            request.setAttribute("subjectList", subjectList);
            request.setAttribute("subjectIdSearched", subjectId);
            request.setAttribute("servlet", "HistorySearchServlet");
             request.setAttribute("searched","subjectId="+subjectId+"&");
            request.getRequestDispatcher("/view/history.jsp").forward(request, response);

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

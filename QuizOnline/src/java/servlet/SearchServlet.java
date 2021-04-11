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
public class SearchServlet extends HttpServlet {

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
        QuestionService quesS = new QuestionService();
        SubjectService subjectS = new SubjectService();
        String searchOption = request.getParameter("searchOption");
        Vector<Subject> subjectList = subjectS.getAllSubject();

        Page pagePRJ311 = new Page();
        Page pagePRJ321 = new Page();
        String indexPRJ311 = request.getParameter("indexPRJ311");
        String indexPRJ321 = request.getParameter("indexPRJ321");
        Vector<Question> PRJ311 = null;
        Vector<Question> PRJ321 = null;
        if (indexPRJ311 != null) {
            pagePRJ311.setIndexPage(Integer.parseInt(indexPRJ311));
            request.setAttribute("tabSelected", "PRJ311");
        } else if (indexPRJ321 != null) {
            pagePRJ321.setIndexPage(Integer.parseInt(indexPRJ321));
            request.setAttribute("tabSelected", "PRJ321");
        }
        if (searchOption.equals("searchName")) {
            String name = request.getParameter("questionName").trim();
            PRJ311 = quesS.getQuestionByName(pagePRJ311, name, subjectList.get(0).getSubjectId());
            PRJ321 = quesS.getQuestionByName(pagePRJ321, name, subjectList.get(1).getSubjectId());
            request.setAttribute("searchData", "&questionName=" + name);
            request.setAttribute("searchMethod", "&searchOption=" + searchOption);
            request.setAttribute(searchOption, searchOption);
        } else if (searchOption.equals("searchStatus")) {

            String stateString = request.getParameter("questionStatus");
            try {
                boolean state = Boolean.parseBoolean(stateString);

                PRJ311 = quesS.getQuestionByState(pagePRJ311, state, subjectList.get(0).getSubjectId());
                PRJ321 = quesS.getQuestionByState(pagePRJ321, state, subjectList.get(1).getSubjectId());
                Question ques = new Question();
                ques.setStatus(state);
                request.setAttribute("searchData", "&questionStatus=" + state);
                request.setAttribute("searchMethod", "&searchOption=" + searchOption);
                request.setAttribute("searchStatus", ques.getStatusInString().trim());

            } catch (Exception e) {
                //log
            }

        } else if (searchOption.equals("searchSubject")) {

            String subjectId = request.getParameter("questionSubject");
            if (subjectId.equals("PRJ311")) {
                PRJ311 = quesS.getQuestionBySubject(pagePRJ311, subjectId);

            } else {
                PRJ321 = quesS.getQuestionBySubject(pagePRJ321, subjectId);

            }
            request.setAttribute("searchData", "&questionSubject=" + subjectId);
            request.setAttribute("searchMethod", "&searchOption=" + searchOption);
            request.setAttribute("searchSubject", subjectId);
        } else {
            request.getRequestDispatcher("LoadAdminPage").forward(request, response);
        }
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("PRJ311", PRJ311);
        request.setAttribute("PRJ321", PRJ321);
        request.setAttribute("pagePRJ311", pagePRJ311);
        request.setAttribute("pagePRJ321", pagePRJ321);
        request.setAttribute("servlet", "SearchServlet");
        request.setAttribute("numOfQues", pagePRJ311.getTotalRecordNum() + pagePRJ321.getTotalRecordNum());
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

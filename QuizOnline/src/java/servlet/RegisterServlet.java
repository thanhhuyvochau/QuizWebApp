/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import error.UserError;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;
import services.UserService;
import validation.UserValidator;

/**
 *
 * @author ADMIN
 */
public class RegisterServlet extends HttpServlet {

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
        String userId = request.getParameter("emailR");
        String userName = request.getParameter("nameR");
        String password = request.getParameter("passwordR");
        String repeat = request.getParameter("rePasswordR");
        if (userId == null || password == null || userName == null || repeat == null) {
            request.setAttribute("messageRegister","Can't Be Null All Field");
            request.getRequestDispatcher("/view/signInUp.jsp").forward(request, response);
        } else {
            UserService userS = new UserService();
            UserValidator validtor = new UserValidator();
            UserError state = null;
            state = validtor.checkUserForSignUp(userId,userName,password,repeat);
            if (state.getMessage().equals(UserError.VALID_SUCCESS)) {
                User user = new User(userId, userName, password,false);
                boolean registerResult = userS.register(user);
                if (registerResult == true) {
                    session.setAttribute("identify", user);
                    request.getRequestDispatcher("QuizServlet").forward(request, response);
                } else {
                    String message = state.getMessage();
                    
                    request.getRequestDispatcher("/view/signInUp.jsp").forward(request, response);
                }
            } else {
                String message = state.getMessage();
                request.setAttribute("messageRegister", message);
                request.setAttribute("userIdR", userId);
                request.setAttribute("userName", userName);
                request.setAttribute("userPassword",password);
                request.setAttribute("userRePassword",repeat);
                request.getRequestDispatcher("/view/signInUp.jsp").forward(request, response);
            }
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.util.Date;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Question;
import model.Quiz;
import model.Subject;
import model.User;
import org.apache.log4j.Logger;
import services.QuestionService;
import services.SubjectService;

/**
 *
 * @author ADMIN
 */
public class QuizServlet extends HttpServlet {

   static Logger log = Logger.getLogger(QuizServlet.class.getName());

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
        QuestionService quesS = new QuestionService();
      
        Quiz quiz = (Quiz) session.getAttribute("quiz");
        User user = (User) session.getAttribute("identify");
        SubjectService subS = new SubjectService();
        Vector<Subject> subjectList = subS.getAllSubject();
        request.setAttribute("subjectList", subjectList);

        String subjectId = request.getParameter("subjectId");
        String comfirm = request.getParameter("confirm");
        if (quiz == null) {
            if (subjectId != null) {
                try {
                    quiz = new Quiz();
                    Vector<Question> questionList = quesS.getQuestionForQuiz(subjectId.trim());
                    quiz.setQuestionList(questionList);
                    quiz.setQuizDate(new Date());
                    quiz.setSubjectId(subjectId);
                    quiz.setUserId(user.getEmail());
                    Subject subject = subS.getSubjectById(subjectId.trim());
                    quiz.setTime(subject.getTimeTest()*60);
                    int index = 0;
                    session.setAttribute("question", quiz.getQuestionList().get(0));
                    session.setAttribute("index", index);
                    session.setAttribute("quiz", quiz);
                    session.setAttribute("range", quiz.getQuestionList().size());
                    session.setAttribute("questionNum", (index + 1) + "/" + quiz.getQuestionList().size());
                    request.getRequestDispatcher("/view/quiz.jsp").forward(request, response);
                } catch (Exception e) {
                    //log
                    log.info(e.toString());
                    response.sendRedirect(request.getContextPath() + "/view/error.jsp");
                }

            }
        } else if ((quiz != null && subjectId != null) || comfirm != null) {

            if (comfirm == null) {
                request.setAttribute("subjectOldQuiz", quiz.getSubjectId());
                request.setAttribute("subjectNewQuiz", subjectId);
                request.getRequestDispatcher("/view/confirm.jsp").forward(request, response);

            }
            String newSubjectQuiz = request.getParameter("subjectQuiz");
            if (comfirm.trim().equalsIgnoreCase("continues")) {
                request.getRequestDispatcher("/view/quiz.jsp").forward(request, response);
            } else if (comfirm.trim().equalsIgnoreCase("new")) {

                session.removeAttribute("quiz");
                session.removeAttribute("index");
                session.removeAttribute("questionNum");
                request.getRequestDispatcher("QuizServlet?subjectId=" + newSubjectQuiz).forward(request, response);

            }
        }
        request.getRequestDispatcher("/view/welcome.jsp").forward(request, response);
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

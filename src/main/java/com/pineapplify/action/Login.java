/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pineapplify.action;

import com.pineapplify.modal.LoginModal;
import com.pineapplify.services.UserServices;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class Login extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();
        if (session.getAttribute("userName") != null) {
            String role = session.getAttribute("userRole").toString();
            String destPage = "./";
            if (null != role) {
                switch (role) {
                    case "1":
                        destPage = "Owner/OwnerHome.jsp";
                        break;
                    case "2":
                        destPage = "Users/DealerHome.jsp";
                        break;
                    case "0":
                        destPage = "Administrator/AdminHome.jsp";
                        break;
                }
            }
            RequestDispatcher disp = request.getRequestDispatcher(destPage);
            disp.forward(request, response);
        }
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
        try {
            String email = request.getParameter("userName");
            String pass = request.getParameter("password");
            String destPage = "./";
            UserServices us = new UserServices();
            LoginModal lm;
            lm = us.chklogin(email, pass);
            if (lm != null) {
                HttpSession session = request.getSession();
                session.setAttribute("userName", lm.getUsName());
                session.setAttribute("userRole", lm.getUsRole());
                session.setAttribute("userMail", lm.getUsMail());
                if (lm.getUsProfStatus().equals("1")) {
                    String message = "Account Temporarily locked";
                    request.setAttribute("err", message);
                    destPage = "./";
                } else {
                    switch (lm.getUsRole()) {
                        case "0":
                            destPage = "Administrator/AdminHome.jsp";
                            break;
                        case "1":
                            destPage = "Owner/OwnerHome.jsp";
                            break;
                        default:
                            destPage = "Users/DealerHome.jsp";
                            break;
                    }
                }
            } else {
                String message = "Invalid Usernam or Password";
                request.setAttribute("err", message);
            }
            us.closeConnection();
            RequestDispatcher disp = request.getRequestDispatcher(destPage);
            disp.forward(request, response);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Login.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
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

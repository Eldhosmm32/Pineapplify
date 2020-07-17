/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pineapplify.action;

import com.pineapplify.modal.RegisterModal;
import com.pineapplify.services.UserServices;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
@WebServlet(name = "UserRegister", urlPatterns = {"/UserRegister"})
public class UserRegister extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserRegister</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserRegister at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            RegisterModal rm = new RegisterModal();

            String name = request.getParameter("name");
            String role = request.getParameter("role");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String place = request.getParameter("place");
            String mail = request.getParameter("mail_id");
            String pass2 = request.getParameter("password_2");

            String destPage = "UserRegister.jsp";
            UserServices us = new UserServices();
            rm.setUserMail(mail);
            rm.setUserName(name);
            rm.setUserAddress(address);
            rm.setUserPassword(pass2);
            rm.setUserPhone(phone);
            rm.setUserPlace(place);
            rm.setUserRole(role);

            if (us.chkMail(rm) == true) {
                HttpSession session = request.getSession();
                session.setAttribute("user", name);
                String message = "Mailid alredy registered.!";
                request.setAttribute("err", message);
                RequestDispatcher disp = request.getRequestDispatcher(destPage);
                disp.forward(request, response);
            } else {
                if (us.regUser(rm)) {
                    destPage = "./";
                    String message = "Login Here";
                    request.setAttribute("suc", message);
                } else {
                    String message = "Something went wrong, Please try after some timne.!";
                    request.setAttribute("err", message);
                }
                us.closeConnection();
                RequestDispatcher disp = request.getRequestDispatcher(destPage);
                disp.forward(request, response);
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserRegister.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

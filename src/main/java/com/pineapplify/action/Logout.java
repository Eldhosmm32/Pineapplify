/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pineapplify.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.pineapplify.services.CultivationServices;
import com.pineapplify.services.ManageCRUD;
import com.pineapplify.services.ManageServices;
import com.pineapplify.services.OwnerHomeServices;
import com.pineapplify.services.PlantationServices;
import com.pineapplify.services.UserServices;

/**
 *
 * @author user
 */
@WebServlet(name = "Logout", urlPatterns = {"/Logout"})
public class Logout extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LogoutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LogoutServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            CultivationServices cs = new CultivationServices();
            ManageCRUD mc = new ManageCRUD();
            ManageServices ms = new ManageServices();
            OwnerHomeServices ohs = new OwnerHomeServices();
            PlantationServices ps = new PlantationServices();
            UserServices us = new UserServices();

            mc.closeConnection();
            ms.closeConnection();
            ohs.closeConnection();
            ps.closeConnection();
            us.closeConnection();
            
            HttpSession session = request.getSession();
            session.invalidate();
            response.sendRedirect(request.getContextPath() + "/");
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Logout.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}

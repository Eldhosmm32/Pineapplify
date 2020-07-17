/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pineapplify.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.pineapplify.services.OwnerHomeServices;

/**
 *
 * @author user
 */
public class ViewNotificationList extends HttpServlet {

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
            out.println("<title>Servlet ViewNotificationList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewNotificationList at " + request.getContextPath() + "</h1>");
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
        if (request.getAttribute("noti") == null) {
            try {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                OwnerHomeServices ohs = new OwnerHomeServices();
                ResultSet rs1 = ohs.getUpdate(session.getAttribute("userMail").toString());
                Boolean f = true;
                out.print("<li style='padding-top:7px'><h6>&nbsp;&nbsp;&nbsp;&nbsp;NOTIFICATIONS</h6></li>");
                out.print("<li class='divider'></li>");
                if (rs1.first() == false) {
                    f = false;
                    out.print("<li><a href='ViewNotification'><i class='material-icons'>filter_vintage</i>No New Notifications</a></li>");
                } else {
                    rs1.first();
                }
                do {
                    if (f == true) {
                        out.print("<li><a href='ViewNotification'><i class='material-icons " + rs1.getString("col_name") + "-text'>filter_vintage</i><span class='pcol-text'>" + rs1.getString("dat_cat") + " " + rs1.getString("plt_name") + "</span></a></li>");
                    }
                } while (rs1.next());
                rs1.close();
                ohs.closeConnection();

            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ManagePlantation.class.getName()).log(Level.SEVERE, null, ex);
            }
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

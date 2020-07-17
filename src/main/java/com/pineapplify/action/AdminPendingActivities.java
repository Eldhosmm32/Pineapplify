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
import com.pineapplify.services.AdminServices;

/**
 *
 * @author user
 */
public class AdminPendingActivities extends HttpServlet {

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
            out.println("<title>Servlet AdminPendingActivities</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminPendingActivities at " + request.getContextPath() + "</h1>");
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
        AdminServices ads;
        ResultSet rs;
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            ads = new AdminServices();
            if (request.getParameter("plantation") != null) {
                rs = ads.loadPendingActivities(request.getParameter("plantation"));

            } else {
                rs = ads.loadPendingActivities(null);
            }
            out.print("<a class='collection-item'><h6 class='pcol-text'>Pending Today</h6></a>");
            Boolean f = true;
            if (rs.first() == false) {
                f = false;
                out.print("<li class='collection-item'>No Activities</li>");
            } else {
                rs.first();
            }
            do {
                if (f == true) {
                    out.print("<li class='collection-item avatar'>"
                            + "<img src='../Assets/img/farmer.png' alt='' class='circle'>"
                            + "<span class='title'><b>" + rs.getString("us_name") + "</b></span>"
                            + "<p>" + rs.getString("plt_name") + " - " + rs.getString("dat_cat") + "<br>"
                            + "@ " + rs.getString("plc_name") + ""
                            + "</p></li>");
                }
            } while (rs.next());
            ads.closeConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AdminPendingActivities.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

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

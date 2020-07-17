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
public class AdminDateCheck extends HttpServlet {

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
            out.println("<title>Servlet AdminDateCheck</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminDateCheck at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            ads = new AdminServices();
            if (request.getParameter("user") != null) {
                ResultSet rs = ads.loadUserPlantations(request.getParameter("user"));
                out.print("<option value='0'>Plantation Name</option>");
                while (rs.next()) {
                    out.print("<option value=" + rs.getString("plt_id") + "> " + rs.getString("plt_name") + "</option>");
                }
            }
            if (request.getParameter("plantation") != null && request.getParameter("year") == null && request.getParameter("month") == null) {

                String years = ads.loadUserPlantationsYear(request.getParameter("plantation"));
                String year[] = years.split("\\|");
                if (year[0].equals(year[1])) {
                    out.print("<option value=" + year[0] + "> " + year[0] + "</option>");
                } else {
                    out.print("<option value=" + year[0] + "> " + year[0] + "</option>");
                    out.print("<option value=" + year[1] + "> " + year[1] + "</option>");
                }
            }

            
            if (request.getParameter("month") != null && request.getParameter("year") != null && request.getParameter("plantation") != null) {

                ResultSet rs = ads.loadUserSpecificDates(request.getParameter("plantation"), request.getParameter("year"), request.getParameter("month"));
                out.print("<a class='collection-item'><h6 class='pcol-text'>Monthly Activities</h6></a>");
                Boolean f = true;
                if (rs.first() == false) {
                    f = false;
                    out.print("<li class='collection-item'>No works</li>");
                } else {
                    rs.first();
                }
                String color;
                out.print("<li class='collection-item'>");
                do {
                    if (f == true) {
                        if (rs.getString("dat_cat").equals("Manuring")) {
                            color = "brown";
                        } else if (rs.getString("dat_cat").equals("Checking")) {
                            color = "red";
                        } else if (rs.getString("dat_cat").equals("Cleaning")) {
                            color = "blue";
                        } else {
                            color = "";
                        }
                        out.print("<span class='new badge " + color + " left' style='margin:1px' data-badge-caption=" + rs.getString("dat_date") + ":" + rs.getString("dat_cat") + "></span>");
                         
                    }
                } while (rs.next());
                out.print("</li>");
                ads.closeConnection();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AdminDateCheck.class.getName()).log(Level.SEVERE, null, ex);
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

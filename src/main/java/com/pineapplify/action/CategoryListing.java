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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.pineapplify.services.PlantationServices;

/**
 *
 * @author user
 */
public class CategoryListing extends HttpServlet {

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
            out.println("<title>Servlet CategoryListing</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CategoryListing at " + request.getContextPath() + "</h1>");
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
        try {
            ResultSet rs = null;
            PlantationServices ps = new PlantationServices();
            String Category = request.getParameter("category");
            String[] cat = Category.split("\\|");

            if ("0".equals(cat[1])) {
                rs = null;
            }
            if ("1".equals(cat[1])) {
                rs = ps.loadUpManuring(cat[0]);
            }
            if ("2".equals(cat[1])) {
                rs = ps.loadUpCleaning(cat[0]);
            }
            if ("3".equals(cat[1])) {
                rs = ps.loadUpChecking(cat[0]);
            }
            if ("4".equals(cat[1])) {
                rs = ps.loadUpWatering(cat[0]);
            }

            if (rs != null) {
                request.setAttribute("dates", rs);
                RequestDispatcher disp = request.getRequestDispatcher("./Common/ViewPlantation.jsp");
                disp.forward(request, response);
                rs.close();
                ps.closeConnection();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ManagePlantation.class.getName()).log(Level.SEVERE, null, ex);
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

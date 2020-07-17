/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pineapplify.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.pineapplify.services.PlantationServices;

/**
 *
 * @author user
 */
public class ViewPlantation extends HttpServlet {

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
            out.println("<title>Servlet ViewPlantation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewPlantation at " + request.getContextPath() + "</h1>");
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
        String destPage = "";
        HttpSession session = request.getSession();
        if (session.getAttribute("userName") != null) {
            try {
                PlantationServices cs = new PlantationServices();
                cs.closeConnection();
                destPage = "./Common/ViewPlantation.jsp";
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ManagePlantation.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            destPage = "./";
        }
        RequestDispatcher disp = request.getRequestDispatcher(destPage);
        disp.forward(request, response);
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

        boolean success;
        try {
            PrintWriter out = response.getWriter();
            PlantationServices pc = new PlantationServices();
            if (request.getParameter("update") == null) {
                HttpSession session = request.getSession();
                session.setAttribute("id", request.getParameter("plantation"));
            } else {
                if (request.getParameter("update").equals("1")) {
                    pc.updateIntervals(request.getParameter("plantation"), request.getParameter("manuring"),
                            request.getParameter("cleaning"), request.getParameter("checking"), request.getParameter("watering"));
                    success = pc.updateStartDate(request.getParameter("email"), request.getParameter("plantation"), request.getParameter("startDate"));
                    if (success != true) {
                        out.println("<script src='./Assets/js/sweetalert2.all.js'></script>");
                        out.println("<script src='./Assets/js/jquery.min.js'></script>");
                        out.println("<script src='./Assets/js/sweetalert.min.js'></script>");
                        out.println("<script language=JavaScript>");
                        out.println("$(document).ready(function(){");
                        out.println("swal('Something went wrong','Pineapplify!','success');");
                        out.println("});");
                        out.println("</script>");
                    } else {
                        out.println("<script src='./Assets/js/sweetalert2.all.js'></script>");
                        out.println("<script src='./Assets/js/jquery.min.js'></script>");
                        out.println("<script src='./Assets/js/sweetalert.min.js'></script>");
                        out.println("<script language=JavaScript>");
                        out.println("$(document).ready(function(){");
                        out.println("swal('Interval(s) updated successfully','Pineapplify','success');");
                        out.println("});");
                        out.println("</script>");
                    }
                }
            }
            pc.closeConnection();
            request.setAttribute("id", request.getParameter("plantation"));
            RequestDispatcher disp = request.getRequestDispatcher("./Common/ViewPlantation.jsp");
            disp.include(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AddPlantation.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(ViewPlantation.class.getName()).log(Level.SEVERE, null, ex);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pineapplify.action;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.pineapplify.services.ManageCRUD;

/**
 *
 * @author user
 */
public class UpdatePlantation extends HttpServlet {

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
            out.println("<title>Servlet UpdatePlantation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdatePlantation at " + request.getContextPath() + "</h1>");
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
        out.println("<script src='./Assets/js/sweetalert2.all.js'></script>");
        out.println("<script src='./Assets/js/jquery.min.js'></script>");
        out.println("<script src='./Assets/js/sweetalert.min.js'></script>");
        out.println("<script language=JavaScript>");
        out.println("$(document).ready(function(){");
        out.println("swal('Something went wrong','Pineapplify!','success');");
        out.println("});");
        out.println("</script>");

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
            String place, verity, worker, id, col, delete;
            place = request.getParameter("place");
            col = request.getParameter("color");
            verity = request.getParameter("verity");
            worker = request.getParameter("worker");
            id = request.getParameter("id");
            delete = request.getParameter("delete");
            ManageCRUD mc = new ManageCRUD();
            HttpSession session = request.getSession();

            if (delete == null) {
                mc.updatePlantation(place, verity, worker, col, session.getAttribute("userMail").toString(), id);
            } else {
                mc.deletePlantation(id, session.getAttribute("userMail").toString());
            }
            mc.closeConnection();
            RequestDispatcher disp = request.getRequestDispatcher("./Owner/Manage.jsp");
            disp.include(request, response);

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AddPlantation.class.getName()).log(Level.SEVERE, null, ex);
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

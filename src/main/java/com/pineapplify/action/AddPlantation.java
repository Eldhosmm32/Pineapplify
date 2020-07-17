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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.pineapplify.services.ManageCRUD;
import com.pineapplify.services.ManageServices;

/**
 *
 * @author user
 */
public class AddPlantation extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddPlantation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPlantation at " + request.getContextPath() + "</h1>");
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
            String place, verity, worker, color;
            place = request.getParameter("place");
            verity = request.getParameter("verity");
            worker = request.getParameter("worker");
            color = request.getParameter("color");
            PrintWriter out = response.getWriter();
            ManageServices ms = new ManageServices();
            ManageCRUD mc = new ManageCRUD();
            HttpSession session = request.getSession();

            boolean success = mc.addPlantation(place, verity, worker, color, session.getAttribute("userMail").toString());
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
                out.println("swal('Plantation added Successfully','Pineapplify','success');");
                out.println("});");
                out.println("</script>");
            }
            ms.closeConnection();
            RequestDispatcher disp = request.getRequestDispatcher("./Owner/Manage.jsp");
            disp.include(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(AddPlantation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

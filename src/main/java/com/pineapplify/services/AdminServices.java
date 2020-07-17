/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pineapplify.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import com.pineapplify.utils.ConnectionManager;

/**
 *
 * @author user
 */
public class AdminServices {

    Connection conn;

    public AdminServices() throws ClassNotFoundException, SQLException {
        conn = new ConnectionManager().getSQLConneection();
    }

    public void finalize() throws Throwable {
        try {
            conn.close();
        } finally {
            super.finalize();
        }
    }

    //functions in cultivation services
    public ResultSet loadUsers() throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * FROM tbl_users WHERE us_role = '1'");
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet loadUserPlantations(String owner) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * FROM tbl_plantation WHERE plt_owner = '" + owner + "'");
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public String loadUserPlantationsYear(String plantation) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT MIN(dat_date), MAX(dat_date) FROM tbl_dates WHERE plt_id = '" + plantation + "'");
        ResultSet rs = ps.executeQuery();
        String max = "", min = "";
        if (rs.next()) {
            max = rs.getString("MIN(dat_date)");
            min = rs.getString("MAX(dat_date)");
        }
        return (max.substring(0, 4) + "|" + min.substring(0, 4));
    }

    public ResultSet loadUserSpecificDates(String plantation, String year, String month) throws SQLException {
        PreparedStatement ps;
        String start = year + "-" + month + "-" + "01";
        String end = year + "-" + month + "-" + "31";
        ps = conn.prepareStatement("SELECT * FROM tbl_dates WHERE plt_id = '" + plantation + "' AND dat_date Between '" + start + "' AND '" + end + "' ORDER BY dat_date");
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet ProcessList() throws SQLException {
        PreparedStatement ps = conn.prepareStatement("show full processlist");
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet loadPendingActivities(String plantation) throws SQLException {
        PreparedStatement ps;
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calobj = Calendar.getInstance();
        String Date = df.format(calobj.getTime());
        if (plantation == null) {
            ps = conn.prepareStatement("SELECT dat_cat, plc_name, plt_name, us_name from tbl_dates as a, tbl_plantation as b,tbl_place as c, tbl_users as d\n"
                    + "where b.plt_place=c.plc_id\n"
                    + "and a.plt_id=b.plt_id\n"
                    + "and b.plt_owner=d.us_mail\n"
                    + "and a.dat_status='0' \n"
                    + "and a.dat_date='" + Date + "'");
        } else {
            ps = conn.prepareStatement("SELECT dat_cat,plc_name,plt_name, us_name from tbl_dates as a, tbl_plantation as b,tbl_place as c, tbl_users as d\n"
                    + "where b.plt_place=c.plc_id\n"
                    + "and a.plt_id=b.plt_id\n"
                    + "and b.plt_owner=d.us_mail\n"
                    + "and a.dat_status='0' \n"
                    + "and a.plt_id='" + plantation + "' \n"
                    + "and a.dat_date='" + Date + "'");
        }
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public void killConnections(String Query) throws SQLException {
        PreparedStatement ps = conn.prepareStatement("KILL('" + Query + "')");
        ps.executeUpdate();
    }

    //close connection
    public void closeConnection() throws SQLException {
        conn.close();
    }
}

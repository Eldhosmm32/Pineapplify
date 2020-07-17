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
public class NotificationServices {

    Connection conn;
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    Calendar calobj = Calendar.getInstance();
    String Date = df.format(calobj.getTime());

    public NotificationServices() throws ClassNotFoundException, SQLException {
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

    public ResultSet loadLongPending(String Owner) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * from tbl_dates as a, tbl_plantation as b,tbl_place as c, tbl_users as d, tbl_color as e\n"
                + "where b.plt_place=c.plc_id\n"
                + "and a.plt_id=b.plt_id\n"
                + "and b.plt_col=e.col_id\n"
                + "and b.plt_owner=d.us_mail\n"
                + "and a.dat_status='0' \n"
                + "and b.plt_owner='" + Owner + "' \n"
                + "and a.dat_date<'" + Date + "'");

        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public boolean updateWork(String workid, Integer action) throws SQLException {
        PreparedStatement ps;
        int updateQuery;
        ps = conn.prepareStatement("UPDATE tbl_dates SET dat_status= '" + action + "',dat_completed= '" + Date + "' WHERE dat_id= '" + workid + "' ");
        updateQuery = ps.executeUpdate();

        if (updateQuery != 0) {
            return true;
        } else {
            return true;
        }
    }

    //close connection
    public void closeConnection() throws SQLException {
        conn.close();
    }
}

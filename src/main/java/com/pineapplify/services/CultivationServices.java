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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import com.pineapplify.utils.ConnectionManager;

/**
 *
 * @author user
 */
public class CultivationServices {

    Connection conn;

    public CultivationServices() throws ClassNotFoundException, SQLException {
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
    public int loadPlantationCount(String email) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT COUNT(*) FROM tbl_plantation WHERE plt_owner=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        rs.next();
        String count = rs.getString("COUNT(*)");
        return Integer.parseInt(count);
    }

    public ResultSet loadPlantationDetails(String email) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * FROM tbl_plantation as a,tbl_worker as b,tbl_verities as c, tbl_place as d, tbl_color as e, tbl_cultivation as f \n"
                + "WHERE plt_owner=? \n"
                + "AND a.plt_id = f.plt_id \n"
                + "AND a.plt_worker = b.wrk_id \n"
                + "AND a.plt_verity = c.ver_id \n"
                + "AND a.plt_place = d.plc_id \n"
                + "AND a.plt_col = e.col_id");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public String convertDate(String sqldate) throws ParseException {
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat format2 = new SimpleDateFormat("dd-MMMM-yyyy");
        Date date = format1.parse(sqldate);
        return (format2.format(date));
    }

    public ResultSet loadPlantationIntervals(String email, String plantation) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * FROM tbl_plantation as a, tbl_intervals as b \n"
                + "WHERE a.plt_owner = ? \n"
                + "AND a.plt_name = ? \n"
                + "AND a.plt_id = b.plt_id ");
        ps.setString(1, email);
        ps.setString(2, plantation);
        ResultSet rs = ps.executeQuery();
        rs.next();
        return rs;
    }

    public String loadUpcomingEvents(String event, String plantation) throws SQLException {
        PreparedStatement ps;
        LocalDate Date = LocalDate.now();
        ps = conn.prepareStatement("SELECT MIN(dat_date) FROM tbl_dates Where dat_cat='" + event + "' and plt_id='" + plantation + "' AND dat_status = '0' and dat_date >'" + Date + "'");
        ResultSet rs = ps.executeQuery();
        rs.next();
        return rs.getString("MIN(dat_date)");
    }

    public ResultSet loadLastEvents(String plantation) throws SQLException {
        PreparedStatement ps;
        LocalDate date = LocalDate.now();
        ps = conn.prepareStatement("SELECT * FROM tbl_dates \n"
                + "WHERE plt_id = ? AND dat_date < '" + date + "' AND dat_status != 0 ORDER BY dat_completed desc\n"
                + "LIMIT 4");
        ps.setString(1, plantation);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    //close connection
    public void closeConnection() throws SQLException {
        conn.close();
    }
}

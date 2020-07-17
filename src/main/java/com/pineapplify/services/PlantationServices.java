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
import java.time.format.DateTimeFormatter;
import java.util.Date;
import com.pineapplify.utils.ConnectionManager;

/**
 *
 * @author user
 */
public class PlantationServices {

    Connection conn;
    String loc_plt;

    public PlantationServices() throws ClassNotFoundException, SQLException {
        conn = new ConnectionManager().getSQLConneection();
    }

    @Override
    public void finalize() throws Throwable {
        try {
            conn.close();
        } finally {
            super.finalize();
        }
    }
    //functions in plantation services    

    public ResultSet loadPlantationAll(String email, String plantation) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * FROM tbl_plantation as a,tbl_worker as b,tbl_verities as c, tbl_place as d, tbl_color as e, tbl_cultivation as f,tbl_intervals as g \n"
                + "WHERE a.plt_owner=? \n"
                + "AND a.plt_id= ? \n"
                + "AND a.plt_id = f.plt_id \n"
                + "AND a.plt_id = g.plt_id \n"
                + "AND a.plt_worker = b.wrk_id \n"
                + "AND a.plt_verity = c.ver_id \n"
                + "AND a.plt_place = d.plc_id \n"
                + "AND a.plt_col = e.col_id");
        ps.setString(1, email);
        ps.setString(2, plantation);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet loadUpManuring(String plantation) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * FROM tbl_dates\n"
                + "WHERE plt_id=? \n"
                + "AND dat_cat='Manuring' ORDER BY dat_date");
        ps.setString(1, plantation);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet loadUpCleaning(String plantation) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * FROM tbl_dates\n"
                + "WHERE plt_id=? \n"
                + "AND dat_cat='Cleaning' ORDER BY dat_date");
        ps.setString(1, plantation);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet loadUpChecking(String plantation) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * FROM tbl_dates\n"
                + "WHERE plt_id=? \n"
                + "AND dat_cat='Checking' ORDER BY dat_date");
        ps.setString(1, plantation);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet loadUpWatering(String plantation) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * FROM tbl_dates\n"
                + "WHERE plt_id=? \n"
                + "AND dat_cat='Watering' ORDER BY dat_date");
        ps.setString(1, plantation);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet loadTimeLine(String plantation) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * FROM tbl_dates\n"
                + "WHERE plt_id=? \n"
                + "ORDER BY dat_date");
        ps.setString(1, plantation);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public String convertDate(String sqldate) throws ParseException {
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat format2 = new SimpleDateFormat("dd-MMM-yyyy");
        Date date = format1.parse(sqldate);
        return (format2.format(date));
    }

    public Boolean updateStartDate(String email, String plantation, String date) throws SQLException, ParseException {
        PreparedStatement ps;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate localDate = LocalDate.parse(date, formatter);
        String start = formatter2.format(localDate);
        localDate = localDate.plusMonths(11);
        String rot1 = formatter2.format(localDate);
        localDate = localDate.plusMonths(11);
        formatter.format(localDate);
        String rot2 = formatter2.format(localDate);
        localDate = localDate.plusMonths(11);
        formatter.format(localDate);
        String rot3 = formatter2.format(localDate);
        ps = conn.prepareStatement("UPDATE tbl_cultivation \n"
                + "SET cul_start =?, \n"
                + "cul_rot1 =?, \n"
                + "cul_rot2 =?, \n"
                + "cul_rot3 =? \n"
                + "WHERE plt_id =?");
        ps.setString(1, start);
        ps.setString(2, rot1);
        ps.setString(3, rot2);
        ps.setString(4, rot3);
        ps.setString(5, plantation);

        int updateQuery = ps.executeUpdate();
        if (updateQuery != 0) {
            ResultSet rs = loadPlantationAll(email, plantation);
            rs.next();
            calculateIntervals(plantation, rs.getString("int_manuring"), rs.getString("int_cleaning"),
                    rs.getString("int_checking"), rs.getString("int_watering"), rs.getString("cul_start"));
            return true;
        } else {
            return false;
        }
    }

    public Boolean updateIntervals(String plantation, String man, String cle, String che, String wat) throws SQLException, ParseException {
        PreparedStatement ps;
        ps = conn.prepareStatement("UPDATE tbl_intervals \n"
                + "SET int_manuring =?, \n"
                + "int_cleaning =?, \n"
                + "int_checking =?, \n"
                + "int_watering =? \n"
                + "WHERE plt_id =?");

        ps.setString(1, man);
        ps.setString(2, cle);
        ps.setString(3, che);
        ps.setString(4, wat);
        ps.setString(5, plantation);

        int updateQuery = ps.executeUpdate();
        if (updateQuery != 0) {
            return true;
        } else {
            return true;
        }
    }

    /**
     *
     * @param plantation
     * @param man
     * @param cle
     * @param che
     * @param date
     * @param wat
     * @return
     * @throws java.text.ParseException
     * @throws java.sql.SQLException
     */
    public ResultSet calculateIntervals(String plantation, String man, String cle, String che, String wat, String date) throws ParseException, SQLException {
        ResultSet rs = null;
        PreparedStatement ps;
        Integer iman, icle, iche, iwat;

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate localDate = LocalDate.parse(date, formatter);

        iman = Integer.parseInt(man);
        icle = Integer.parseInt(cle);
        iche = Integer.parseInt(che);
        iwat = Integer.parseInt(wat);

//        int a = 304 / iman;
//        int b = 304 / icle;
//        int c = 304 / iche;
//        int d = 304 / iwat;
//
        int a = 30 / iman;
        int b = 30 / icle;
        int c = 30 / iche;
        int d = 30 / iwat;

        ps = conn.prepareStatement("DELETE FROM tbl_dates WHERE plt_id= ?");
        ps.setString(1, plantation);
        ps.executeUpdate();

        for (int i = 1; i <= a; i++) {
            localDate = localDate.plusDays(iman);
            ps = conn.prepareStatement("INSERT INTO tbl_dates (plt_id, dat_turn, dat_cat, dat_date) VALUES(?,?,?,?)");
            ps.setString(1, plantation);
            ps.setString(2, i + "");
            ps.setString(3, "Manuring");
            ps.setString(4, localDate.toString());
            ps.executeUpdate();
        }

        localDate = LocalDate.parse(date, formatter);
        for (int i = 1; i <= b; i++) {
            localDate = localDate.plusDays(icle);
            ps = conn.prepareStatement("INSERT INTO tbl_dates (plt_id, dat_turn, dat_cat, dat_date) VALUES(?,?,?,?)");
            ps.setString(1, plantation);
            ps.setString(2, i + "");
            ps.setString(3, "Cleaning");
            ps.setString(4, localDate.toString());
            ps.executeUpdate();
        }

        localDate = LocalDate.parse(date, formatter);
        for (int i = 1; i <= c; i++) {
            localDate = localDate.plusDays(iche);
            ps = conn.prepareStatement("INSERT INTO tbl_dates (plt_id, dat_turn, dat_cat, dat_date) VALUES(?,?,?,?)");
            ps.setString(1, plantation);
            ps.setString(2, i + "");
            ps.setString(3, "Checking");
            ps.setString(4, localDate.toString());
            ps.executeUpdate();
        }

        localDate = LocalDate.parse(date, formatter);
        for (int i = 1; i <= d; i++) {
            localDate = localDate.plusDays(iwat);
            ps = conn.prepareStatement("INSERT INTO tbl_dates (plt_id, dat_turn, dat_cat, dat_date) VALUES(?,?,?,?)");
            ps.setString(1, plantation);
            ps.setString(2, i + "");
            ps.setString(3, "Watering");
            ps.setString(4, localDate.toString());
            ps.executeUpdate();
        }
        return rs;
    }

    //close connection
    public void closeConnection() throws SQLException {
        conn.close();
    }

}

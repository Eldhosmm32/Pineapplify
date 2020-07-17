/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pineapplify.services;

import java.io.IOException;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import com.pineapplify.utils.ConnectionManager;

/**
 *
 * @author user
 */
public class OwnerHomeServices {

    Connection conn;

    public OwnerHomeServices() throws ClassNotFoundException, SQLException {
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

    //functions in OwnerHome Services   
    public ResultSet loadOnGoing(String email) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * FROM tbl_plantation as a,tbl_cultivation as b,tbl_color as c \n"
                + "WHERE a.plt_owner = ? \n"
                + "AND a.plt_col = c.col_id \n"
                + "AND a.plt_id = b.plt_id");
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

    public String fromStartToNow(String sqldate) throws ParseException {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate start = LocalDate.parse(sqldate, formatter);
        LocalDate today = LocalDate.now();
        long days = ChronoUnit.DAYS.between(start, today);
        if (days < 0) {
            return "Not yet started";
        } else {
            return days + " day of growth";
        }
    }

    public ArrayList<String> getMarketPrice() throws IOException {
        ArrayList<String> market = new ArrayList<>();
        try {
            Document doc = Jsoup.connect("http://www.vfpck.org/vegprice.asp?ID=55").userAgent("mozilla/17.0").get();
            Elements tmp = doc.getElementsByTag("td");

            for (int i = 8; i <= 64;) {
                String name = tmp.set(i, doc).toString();
                String price = tmp.set(i + 1, doc).toString();
                market.add(name.subSequence(41, name.length() - 6) + " : <b>" + price.subSequence(36, price.length() - 6) + "</b> Rs/Kg");
                i = i + 5;
            }
        } catch (UnknownHostException e) {
            market.add("No internet connection!");
        } catch (IndexOutOfBoundsException e) {

        }
        return market;
    }

    public ResultSet getUpdate(String email) throws SQLException {
        PreparedStatement ps;
        LocalDate today = LocalDate.now();
        ps = conn.prepareStatement("SELECT * FROM tbl_dates as a,tbl_plantation as b,tbl_color as c\n"
                + "WHERE a.dat_date = ? \n"
                + "AND b.plt_owner = ? \n"
                + "AND a.plt_id=b.plt_id\n"
                + "AND a.dat_status='0'\n"
                + "AND b.plt_col=c.col_id");
        ps.setString(1, today.toString());
        ps.setString(2, email);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public int getUpdateCount(String email) throws SQLException {
        PreparedStatement ps;
        LocalDate today = LocalDate.now();
        ps = conn.prepareStatement("SELECT COUNT(plt_name) FROM tbl_dates as a,tbl_plantation as b\n"
                + "WHERE a.dat_date <= ? \n"
                + "AND a.plt_id=b.plt_id\n"
                + "AND a.dat_status='0'\n"
                + "AND b.plt_owner = ? ");
        ps.setString(1, today.toString());
        ps.setString(2, email);
        ResultSet rs = ps.executeQuery();
        rs.next();
        int cc;
        if (rs == null) {
            cc = 0;
        } else {
            cc = rs.getInt("COUNT(plt_name)");
        }
        return cc;
    }

    //close connection
    public void closeConnection() throws SQLException {
        conn.close();
    }

}

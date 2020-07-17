/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pineapplify.services;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.pineapplify.modal.LoginModal;
import com.pineapplify.modal.RegisterModal;
import com.pineapplify.utils.ConnectionManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;

/**
 *
 * @author user
 */
public class UserServices {

    Connection conn;

    public UserServices() throws ClassNotFoundException, SQLException {
        conn = (Connection) new ConnectionManager().getSQLConneection();
    }

    @Override
    public void finalize() throws Throwable {
        try {
            conn.close();
        } finally {
            super.finalize();
        }
    }

    public LoginModal chklogin(String email, String password) throws SQLException {
        PreparedStatement ps;
        ps = (PreparedStatement) conn.prepareStatement("SELECT * FROM tbl_users WHERE us_mail=? AND us_pass= ?");
        ps.setString(1, email);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();

        LoginModal lm = null;

        if (rs.next()) {
            lm = new LoginModal();
            lm.setUsName(rs.getString("us_name"));
            lm.setUsStatus(rs.getString("us_status"));
            lm.setUsRole(rs.getString("us_role"));
            lm.setUsProfStatus(rs.getString("us_profStatus"));
            lm.setUsMail(email);
        }
        return lm;
    }

    public boolean chkMail(RegisterModal rm) throws SQLException {
        PreparedStatement ps;
        ps = (PreparedStatement) conn.prepareStatement("SELECT US_MAIL FROM `tbl_users` WHERE US_MAIL = ?");
        ps.setString(1, rm.getUserMail());
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return true;
        } else {
            return false;
        }
    }

    public boolean regUser(RegisterModal rm) throws SQLException {
        PreparedStatement ps;
        int updateQuery = 0;
        DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
        Calendar calobj = Calendar.getInstance();
        String Date = df.format(calobj.getTime());

        ps = (PreparedStatement) conn.prepareStatement("INSERT INTO tbl_users (US_NAME,US_ROLE,US_ADDRESS,US_PHONE,US_MAIL,US_PLACE,US_JOINDATE,US_PASS) VALUES(?,?,?,?,?,?,?,?)");
        ps.setString(1, rm.getUserName());
        ps.setString(2, rm.getUserRole());
        ps.setString(3, rm.getUserAddress());
        ps.setString(4, rm.getUserPhone());
        ps.setString(5, rm.getUserMail());
        ps.setString(6, rm.getUserPlace());
        ps.setString(7, Date);
        ps.setString(8, rm.getUserPassword());

        updateQuery = ps.executeUpdate();

        if (updateQuery != 0) {
            return true;
        } else {
            return true;
        }
    }

    public LoginModal Profile(String email, String name) throws SQLException {
        PreparedStatement ps;
        ps = (PreparedStatement) conn.prepareStatement("SELECT * FROM tbl_users WHERE us_mail=? AND us_name= ?");
        ps.setString(1, email);
        ps.setString(2, name);
        ResultSet rs = ps.executeQuery();

        LoginModal lm = null;

        if (rs.next()) {
            lm = new LoginModal();
            lm.setUsName(rs.getString("us_name"));
            lm.setUsMail(rs.getString("us_mail"));
            lm.setUsJoinDate(rs.getString("us_joindate"));
            lm.setUsPhone(rs.getString("us_phone"));
            lm.setUsAddress(rs.getString("us_address"));
            lm.setUsPlace(rs.getString("us_place"));
            lm.setUsRole(rs.getString("us_role"));
        }
        return lm;
    }

    public void closeConnection() throws SQLException {
        conn.close();
    }

}

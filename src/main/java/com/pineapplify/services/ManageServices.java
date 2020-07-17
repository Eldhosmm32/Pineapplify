/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pineapplify.services;

import com.pineapplify.utils.ConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author user
 */
public class ManageServices {

    Connection conn;

    public ManageServices() throws ClassNotFoundException, SQLException {
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

    /**
     *
     * @param email
     * @return @throws SQLException
     */
    public ResultSet loadPlantation(String email) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * FROM tbl_plantation as a,tbl_worker as b,tbl_verities as c, tbl_place as d, tbl_color as e "
                + "WHERE plt_owner=? "
                + "AND a.plt_worker = b.wrk_id "
                + "AND a.plt_verity = c.ver_id "
                + "AND a.plt_place = d.plc_id "
                + "AND a.plt_col = e.col_id");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet loadSpecificPlantation(String email, String id) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * FROM tbl_plantation as a,tbl_worker as b,tbl_verities as c, "
                + "tbl_place as d, tbl_color as e "
                + "WHERE a.plt_worker = b.wrk_id "
                + "AND a.plt_verity = c.ver_id "
                + "AND a.plt_place = d.plc_id "
                + "AND a.plt_col = e.col_id "
                + "AND plt_owner = ? "
                + "AND plt_id = ?");
        ps.setString(1, email);
        ps.setString(2, id);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet loadSpecificWorker(String email, String id) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT wrk_id,wrk_name,wrk_phone FROM tbl_worker WHERE wrk_owner=? AND wrk_id=?");
        ps.setString(1, email);
        ps.setString(2, id);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet loadPlaceDop() throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * FROM tbl_place");
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet loadVerities() throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * FROM tbl_verities");
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet loadPlantDrop(String email) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT p.plt_id, p.plt_name, c.col_name FROM tbl_plantation as p, tbl_color as c WHERE p.plt_col=c.col_id AND plt_owner=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet loadWorker(String email) throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT wrk_id,wrk_name,wrk_phone FROM tbl_worker WHERE wrk_owner=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public ResultSet loadColor() throws SQLException {
        PreparedStatement ps;
        ps = conn.prepareStatement("SELECT * FROM tbl_color");
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public void closeConnection() throws SQLException {
        conn.close();
    }
}

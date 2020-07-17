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
public class ManageCRUD {

    Connection conn;

    public ManageCRUD() throws ClassNotFoundException, SQLException {
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

    public boolean addPlantation(String place, String verity, String worker, String color, String owner) throws SQLException {
        int updateQuery;
        PreparedStatement ps, ps1, ps2;
        try {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Calendar calobj = Calendar.getInstance();
            String Date = df.format(calobj.getTime());
            ResultSet rs, rs1;

            ps1 = conn.prepareStatement("SELECT MAX(plt_name) FROM tbl_plantation WHERE plt_owner = ?");
            ps1.setString(1, owner);
            String pltName = "Plantation";
            rs = ps1.executeQuery();
            rs.next();
            String pltName2 = rs.getString("MAX(plt_name)");
            if (rs.getString("MAX(plt_name)") == null) {
                pltName += "1";
            } else {
                pltName = "Plantation" + (Integer.parseInt(pltName2.substring(10, pltName2.length())) + 1);
            }

            ps = conn.prepareStatement("INSERT INTO tbl_plantation (plt_place, plt_verity, plt_worker, plt_date, plt_owner, plt_name, plt_col) VALUES(?,?,?,?,?,?,?)");
            ps.setString(1, place);
            ps.setString(2, verity);
            ps.setString(3, worker);
            ps.setString(4, Date);
            ps.setString(5, owner);
            ps.setString(6, pltName);
            ps.setString(7, color);
            updateQuery = ps.executeUpdate();
            if (updateQuery != 0) {
                ps1 = conn.prepareStatement("SELECT MAX(plt_id) FROM tbl_plantation WHERE plt_owner = ?");
                ps1.setString(1, owner);
                rs1 = ps1.executeQuery();
                rs1.next();
                String pltid = rs1.getString("MAX(plt_id)");

                ps2 = conn.prepareStatement("INSERT INTO tbl_intervals (plt_id) VALUES(?)");
                ps2.setString(1, pltid);
                ps2.executeUpdate();

                ps2 = conn.prepareStatement("INSERT INTO tbl_cultivation (plt_id) VALUES(?)");
                ps2.setString(1, pltid);
                ps2.executeUpdate();

                return true;
            } else {
                return true;
            }
        } finally {

        }
    }

    public boolean updatePlantation(String place, String verity, String worker, String col, String owner, String id) throws SQLException {
        try {
            PreparedStatement ps;
            int updateQuery;
            ps = conn.prepareStatement("UPDATE tbl_plantation SET plt_place= ?, plt_verity= ?, plt_worker= ?, plt_col= ? WHERE plt_owner= ? AND plt_id= ?");
            ps.setString(1, place);
            ps.setString(2, verity);
            ps.setString(3, worker);
            ps.setString(4, col);
            ps.setString(5, owner);
            ps.setString(6, id);
            updateQuery = ps.executeUpdate();

            if (updateQuery != 0) {
                return true;
            } else {
                return true;
            }
        } finally {

        }
    }

    public boolean deletePlantation(String id, String owner) throws SQLException {
        try {
            PreparedStatement ps;
            int updateQuery;

            ps = conn.prepareStatement("DELETE FROM tbl_plantation WHERE plt_id= ? AND plt_owner= ?");
            ps.setString(1, id);
            ps.setString(2, owner);
            updateQuery = ps.executeUpdate();

            if (updateQuery != 0) {
                ps = conn.prepareStatement("DELETE FROM tbl_intervals WHERE plt_id= ?");
                ps.setString(1, id);
                ps.executeUpdate();

                ps = conn.prepareStatement("DELETE FROM tbl_cultivation WHERE plt_id= ?");
                ps.setString(1, id);
                ps.executeUpdate();

                ps = conn.prepareStatement("DELETE FROM tbl_dates WHERE plt_id= ?");
                ps.setString(1, id);
                ps.executeUpdate();
                return true;
            } else {
                return true;
            }
        } finally {

        }
    }

    public boolean updateWorker(String name, String phone, String owner, String id) throws SQLException {
        try {
            PreparedStatement ps;
            int updateQuery;
            ps = conn.prepareStatement("UPDATE tbl_worker SET wrk_name= ?, wrk_phone= ? WHERE wrk_owner= ? AND wrk_id= ?");
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, owner);
            ps.setString(4, id);
            updateQuery = ps.executeUpdate();

            if (updateQuery != 0) {
                return true;
            } else {
                return true;
            }
        } finally {

        }
    }

    public boolean deleteWorker(String id, String owner) throws SQLException {
        try {
            PreparedStatement ps;
            int updateQuery;
            ps = conn.prepareStatement("DELETE FROM tbl_worker WHERE wrk_id= ? AND wrk_owner= ?");
            ps.setString(1, id);
            ps.setString(2, owner);
            updateQuery = ps.executeUpdate();

            if (updateQuery != 0) {
                return true;
            } else {
                return true;
            }
        } finally {

        }
    }

    public int chkWorker(String owner, String id) throws SQLException {
        try {
            PreparedStatement ps;
            ps = conn.prepareStatement("SELECT COUNT(plt_worker) FROM tbl_plantation WHERE plt_worker= ? AND plt_owner= ?");
            ps.setString(1, id);
            ps.setString(2, owner);
            ResultSet rs = ps.executeQuery();
            rs.next();
            Integer c = rs.getInt("COUNT(plt_worker)");
            return c;
        } finally {

        }
    }

    public boolean addPlace(String place, String district) throws SQLException {
        try {
            PreparedStatement ps;
            int updateQuery;
            ps = conn.prepareStatement("INSERT INTO tbl_place (plc_name, plc_dist) VALUES(?,?)");
            ps.setString(1, place);
            ps.setString(2, district);
            updateQuery = ps.executeUpdate();

            if (updateQuery != 0) {
                return true;
            } else {
                return true;
            }
        } finally {

        }
    }

    public boolean addWorker(String name, String phone, String owner) throws SQLException {
        try {
            PreparedStatement ps;
            int updateQuery;
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Calendar calobj = Calendar.getInstance();
            String Date = df.format(calobj.getTime());
            ps = conn.prepareStatement("INSERT INTO tbl_worker (wrk_name, wrk_phone, wrk_owner, wrk_doa) VALUES(?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, owner);
            ps.setString(4, Date);
            updateQuery = ps.executeUpdate();

            if (updateQuery != 0) {
                return true;
            } else {
                return true;
            }
        } finally {

        }
    }

    public void closeConnection() throws SQLException {
        conn.close();
    }
}

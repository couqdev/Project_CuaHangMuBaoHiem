package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.api.Transport;
import vn.edu.hcmuaf.fit.model.Contact;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TransportService {
    private static TransportService instance;
    public TransportService() {
    }
    public static TransportService getInstance() {
        if (instance == null) {
            instance = new TransportService();
        }
        return instance;
    }
    public void update(int district, int ward){
        try {
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement("UPDATE infor_transport set id_district = ?, id_ward =?");
            ps.setInt(1, district);
            ps.setInt(2, ward);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public int getDistrict(){
        int d = 0;
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps =dbConnect.getConnection().prepareStatement("select id_district from infor_transport");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
               d = rs.getInt("id_district");
            }

        } catch (SQLException e) {
        }
        return d;
    }
    public int getWard(){
        int w = 0;
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps =dbConnect.getConnection().prepareStatement("select id_ward from infor_transport");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                w = rs.getInt("id_ward");
            }

        } catch (SQLException e) {
        }
        return w;
    }
    public int getProvince(){
        int d = 0;
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps =dbConnect.getConnection().prepareStatement("select id_province from infor_transport");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                d = rs.getInt("id_province");
            }

        } catch (SQLException e) {
        }
        return d;
    }

}

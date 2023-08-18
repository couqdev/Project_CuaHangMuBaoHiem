package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.model.Log;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LogService {
    public static boolean log(Log log){
        String  query = "insert into logs(level, user, src, content, createAt, status) values (?,?,?,?,NOW(),?)";
        try{
            PreparedStatement ps = DBConnect.getInstance().getConnection().prepareStatement(query);
            ps.setInt(1, log.getLevel());
            ps.setString(2, log.getUser());
            ps.setString(3, log.getSrc());
            ps.setString(4, log.getContent());
            ps.setInt(5, log.getStatus());
            return ps.executeUpdate()>0;
        }catch (SQLException e){
            System.out.println(e);
        }

        return false;
    }

    public static void main(String[] args) {
        Log l = new Log(Log.INFO, "anh0212","", "ct", 0);
        System.out.println(log(l));
    }
}

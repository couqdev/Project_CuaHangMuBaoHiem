package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.model.Contact;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class ContactService {
    private static ContactService instance;
    public ContactService() {
    }
    public static ContactService getInstance() {
        if (instance == null) {
            instance = new ContactService();
        }
        return instance;
    }
    public void remove(int id)  {
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("delete from contacts where id_contact=?");
            ps.setInt(1,id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    public void insert(String name, String email, String subject, String content) {
        LocalDate localDate = LocalDate.now();
        int year = localDate.getYear();
        int mont = localDate.getMonthValue();
        int day = localDate.getDayOfMonth();

        String date  = year+"-"+mont+"-"+day;

        DBConnect dbConnect = DBConnect.getInstance();
        Statement statement = dbConnect.get();
            try {
                PreparedStatement ps = dbConnect.getConnection().prepareStatement("insert into contacts(name, email, subject,content,date) values (?,?,?,?,?)");
                ps.setString(1,name);
                ps.setString(2,email);
                ps.setString(3,subject);
                ps.setString(4,content);
                ps.setString(5,date);
                ps.executeUpdate();
            }catch (Exception e) {
            e.printStackTrace();
            }
    }
    public List<Contact> getAll(){
        List<Contact> list = new LinkedList<Contact>();
        DBConnect dbConnect = DBConnect.getInstance();

       Contact contact = new Contact();
        try {
            PreparedStatement ps =dbConnect.getConnection().prepareStatement("select id_contact, name, email,subject,content,date from contacts order by date desc");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            contact = new Contact(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));

                list.add(contact);
            }

        } catch (SQLException e) {
        }
        return list;
    }
    public int quantity(){
        int count =0;
        DBConnect dbConnect = DBConnect.getInstance();

        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_contact from contacts");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                count++;
            }
        } catch (SQLException e) {
        }
        return count;
    }

    public Contact getContact(int id){
        Contact contact = new Contact();
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_contact, name, email,subject,content,date from contacts where id_contact=?");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                contact = new Contact(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

        return contact;
    }
    public List<Contact> getContact(int a, int b){
        List<Contact> list = new LinkedList<Contact>();
        DBConnect dbConnect = DBConnect.getInstance();

        Contact contact = new Contact();
        try {

          PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_contact, name, email,subject,content,date from  contacts limit ?,?");
          ps.setInt(1,a);
            ps.setInt(2,b);
          ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                contact = new Contact(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));

                list.add(contact);
            }

        } catch (SQLException e) {
        }
        return list;
    }

    public List<Contact> pagination(int a, int b,List<Contact> list){
//        List<Contact> list = getAll();
        List<Contact> result = new ArrayList<Contact>();

        for(int i = a; i<b+a;i++){
            if(i<list.size()) {
                result.add(list.get(i));
            }
        }

        return result;
    }
    public boolean idContact(int id){
        boolean result=false;
        try {
            DBConnect dbConnect = DBConnect.getInstance();
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id_contact from contacts where id_contact=?");
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()){
                result=true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return result;
    }
    public static void main(String[] args) throws SQLException {
    }
}

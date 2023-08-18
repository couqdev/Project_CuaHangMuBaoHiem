package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.model.Log;
import vn.edu.hcmuaf.fit.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "DoProfile", value = "/DoProfile")
public class DoProfile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("tendangnhap");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        DBConnect dbConnect = DBConnect.getInstance();
        String sql = "select name, phone, address from customers where username = ?";
        try {
            PreparedStatement pre = dbConnect.getConnection().prepareStatement(sql);
            pre.setString(1, username);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                if (name.trim() == "" || phone.trim() == "" || address.trim() == "") {
                    request.setAttribute("error", "Người dùng không được để trống thông tin khi cập nhật.");
                    request.getRequestDispatcher("account.jsp").forward(request, response);

                } else {
                    String change = "update customer set name = '" + name + "', phone = '" + phone + "', address = '" + address + "' where username ='" + username + "';";
                    pre.executeUpdate(change);
                    request.setAttribute("success", "Thay đổi thông tin thành công");
                    request.getRequestDispatcher("edit-account.jsp").forward(request, response);

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

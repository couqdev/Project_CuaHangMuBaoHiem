package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Log;
import vn.edu.hcmuaf.fit.service.CustomerService;
import vn.edu.hcmuaf.fit.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DoResetPassword", value = "/DoResetPassword")
public class DoResetPassword extends HttpServlet {
    String name = "AUTH ";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email").trim();
        String username = (String) request.getSession().getAttribute("tendangnhap");
        try {
            Log log = new Log(Log.INFO, username, this.name, "", 0);
            if (CustomerService.checkEmail(email)==false){
                request.setAttribute("error", "Email chưa được sử dụng để đăng ký tài khoản.");
                request.getRequestDispatcher("forgot-password.jsp").forward(request,response);

                log.setSrc(this.name + "RESET PASSWORD FALSE");
                log.setContent("RESET PASSWORD FALSE: Username - " + username);
                log.setLevel(Log.ERROR);
            } else {
                request.setAttribute("success","Đặt lại mật khẩu hành công! Vui lòng kiểm tra email!");
                CustomerService.resetPassword(email);
                request.getRequestDispatcher("forgot-password.jsp").forward(request,response);

                log.setSrc(this.name + "RESET PASSWORD");
                log.setContent("RESET PASSWORD SUCCESS: Username - "  + username);
                log.setLevel(Log.WARNING);
            }
            LogService.log(log);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

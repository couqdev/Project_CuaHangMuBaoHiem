package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Customer;
import vn.edu.hcmuaf.fit.model.Log;
import vn.edu.hcmuaf.fit.service.CustomerService;
import vn.edu.hcmuaf.fit.service.LogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DoLogin", value = "/doLogin")
public class DoLogin extends HttpServlet {
    String name = "AUTH ";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").toLowerCase().trim();
        String password = request.getParameter("password").trim();
        HttpSession session = request.getSession();
        try {
            Log log = new Log(Log.INFO, username, this.name, "", 0);
            if (username == null || username == "" || password == null || password == "") {
                request.setAttribute("error", "Người dùng không được để trống Tên đăng nhập hoặc Mật khẩu.");
                request.getRequestDispatcher("login.jsp").forward(request, response);

                log.setSrc(this.name + "LOGIN FALSE");
                log.setContent("LOGIN FALSE: Username - " + username);
                log.setLevel(Log.ERROR);
            } else if(CustomerService.checkActive(username) == 0 && CustomerService.checkUsername(username)) {
                request.setAttribute("error", "Tài khoản đã bị khóa.");
                request.getRequestDispatcher("login.jsp").forward(request, response);

                log.setSrc(this.name + "LOGIN FALSE");
                log.setContent("LOGIN FALSE: Username - " + username);
                log.setLevel(Log.ERROR);
            } else if (CustomerService.checkLogin(username, CustomerService.toMD5(password)) == true) {
                CustomerService.resetLock(username);
                session.setAttribute("tendangnhap", username);
                Customer customer = CustomerService.customer(username);
                response.sendRedirect("/Project_CuaHangMuBaoHiem_war/Home");

                log.setSrc(this.name + "LOGIN");
                log.setContent("LOGIN SUCCESS: Username - "  + username);
            }else{
                if(!CustomerService.checkLogin(username, CustomerService.toMD5(password)) && CustomerService.checkUsername(username)){
                    CustomerService.checkLock(username);
                    CustomerService.plusLock(username);
                    request.setAttribute("error", "Người dùng nhập không đúng Tên đăng nhập hoặc Mật khẩu.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);

                    log.setSrc(this.name + "LOGIN FALSE");
                    log.setContent("LOGIN FALSE: Username - " + username);
                    log.setLevel(Log.ERROR);
                }
                if(!CustomerService.checkLogin(username, CustomerService.toMD5(password)) && !CustomerService.checkUsername(username)){
                    CustomerService.checkLock(username);
                    CustomerService.plusLock(username);
                    request.setAttribute("error", "Người dùng nhập không đúng Tên đăng nhập hoặc Mật khẩu.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);

                    log.setSrc(this.name + "LOGIN FALSE");
                    log.setContent("LOGIN FALSE: Username - " + username);
                    log.setLevel(Log.ERROR);
                }
            }
            LogService.log(log);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}

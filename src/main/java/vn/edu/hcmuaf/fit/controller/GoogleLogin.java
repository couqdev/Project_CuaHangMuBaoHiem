package vn.edu.hcmuaf.fit.controller;
import vn.edu.hcmuaf.fit.model.Customer;
import vn.edu.hcmuaf.fit.model.Log;
import vn.edu.hcmuaf.fit.model.UserGoogle;
import vn.edu.hcmuaf.fit.google.GoogleUtils;
import vn.edu.hcmuaf.fit.service.CustomerService;
import vn.edu.hcmuaf.fit.service.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "GoogleLogin", value = "/GoogleLogin")
public class GoogleLogin extends HttpServlet {
    String name = "AUTH ";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String accessToken = GoogleUtils.getToken(code);
        UserGoogle userGoogle = GoogleUtils.getUserInfo(accessToken);
        Log log = new Log(Log.INFO, userGoogle.getName(), this.name, "", 0);
        if (code == null || code.isEmpty()) {
            request.setAttribute("error", "Đăng nhập thất bại!");
            request.getRequestDispatcher("login.jsp").forward(request,response);

            log.setSrc(this.name + "GOOGLE LOGIN FALSE");
            log.setContent("LOGIN FALSE AT: " + userGoogle.getName());
            log.setLevel(Log.ERROR);
        } else {
            try {
                if(!CustomerService.checkLogin(userGoogle.getId(), CustomerService.toMD5(userGoogle.getId()))) {
                    CustomerService.addCustomer(userGoogle.getId(), CustomerService.toMD5(userGoogle.getId()), userGoogle.getName(), userGoogle.getEmail(), 2);
                    session.setAttribute("tendangnhap", userGoogle.getId());
                    response.sendRedirect("/Project_CuaHangMuBaoHiem_war/Home");

                    log.setSrc(this.name + " GOOGLE LOGIN");
                    log.setContent("LOGIN SUCCESS AT: " + userGoogle.getName());
                }
                else{
                    session.setAttribute("tendangnhap", userGoogle.getId());
                    response.sendRedirect("/Project_CuaHangMuBaoHiem_war/Home");

                    log.setSrc(this.name + " GOOGLE LOGIN");
                    log.setContent("LOGIN SUCCESS AT: " + userGoogle.getName());
                }
                LogService.log(log);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

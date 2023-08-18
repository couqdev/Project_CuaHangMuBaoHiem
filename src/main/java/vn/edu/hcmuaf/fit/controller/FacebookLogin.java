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

@WebServlet(name = "FacebookLogin", value = "/facebook-login")
public class FacebookLogin extends HttpServlet {
    String name = "AUTH ";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email").toLowerCase().trim();
        String password = request.getParameter("password").trim();
        String name = request.getParameter("name").trim();
        try {
            Log log = new Log(Log.INFO, name, this.name, "", 0);
            if(!CustomerService.checkLogin(email, CustomerService.toMD5(password))) {
                CustomerService.addCustomer(email, CustomerService.toMD5(password), name, email, 1);
                response.sendRedirect("/Project_CuaHangMuBaoHiem_war/doLogin?username="+email+"&password=" +password);

                log.setSrc(this.name + " FACEBOOK LOGIN");
                log.setContent("LOGIN SUCCESS AT: " + name);
            }
            else{
                response.sendRedirect("/Project_CuaHangMuBaoHiem_war/doLogin?username="+email+"&password=" +password);

                log.setSrc(this.name + " GOOGLE LOGIN");
                log.setContent("LOGIN SUCCESS AT: " + name);
            }
            LogService.log(log);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

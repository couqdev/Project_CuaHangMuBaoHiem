package vn.edu.hcmuaf.fit.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CheckCart", value = "/CheckCart")
public class CheckCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("tendangnhap");
        if (username == null || username == "") {
            request.setAttribute("error", "Vui lòng đăng nhập để thanh toán!");
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("address.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

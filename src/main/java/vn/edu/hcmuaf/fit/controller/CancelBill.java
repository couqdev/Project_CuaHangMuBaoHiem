package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "cancel_bill", value = "/cancel_bill")
public class CancelBill extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_bill = Integer.parseInt(request.getParameter("id"));
        ProductService.cancel_bill(id_bill);
        response.sendRedirect("/Project_CuaHangMuBaoHiem_war/Home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

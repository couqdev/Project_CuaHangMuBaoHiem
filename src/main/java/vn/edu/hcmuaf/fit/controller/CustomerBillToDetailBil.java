package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CustomerBillToDetailBil", value = "/CustomerBillToDetailBil")
public class CustomerBillToDetailBil extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_bill = Integer.parseInt(request.getParameter("id"));
        try {
            request.setAttribute("detail_bill", ProductService.getBill(id_bill));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("bill_detail_customer.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

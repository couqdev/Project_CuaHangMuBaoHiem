package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "recive-product", value = "/recive-product")
public class ReciveProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_bill = Integer.parseInt(request.getParameter("id_bill"));
        ProductService.updateStatus(id_bill,"Đã nhận");
        request.setAttribute("id_bill",id_bill);
        request.getRequestDispatcher("notification.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

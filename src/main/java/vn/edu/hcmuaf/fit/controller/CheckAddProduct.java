package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.DetailProduct;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "Check", value = "/CheckAddProduct")
public class CheckAddProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        String quantity = request.getParameter("quantity");
        String quantityDB = request.getParameter("quantityDB");
        PrintWriter out = response.getWriter();
        Product p = null;
        try {
            p = ProductService.getProduct(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        String x = "";
        for(DetailProduct d : p.getDetail()){
            if((""+d.getId()).equals(color)){
            x = d.getColor();
            }
        }
        request.setAttribute("id", id);
        request.setAttribute("size", size);
        request.setAttribute("color", x);
        request.setAttribute("quantity", quantity);
        request.setAttribute("quantityDB", quantityDB);

        request.getRequestDispatcher("check.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

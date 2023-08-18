package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Cart;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Add", value = "/Add")
public class Add extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product p = null;
        try {
            p = ProductService.getDetailProduct(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        p.setQuantity(1);
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        cart.put(p);
        request.getSession().setAttribute("cart",cart);
        response.sendRedirect("/Project_CuaHangMuBaoHiem_war/list-product");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

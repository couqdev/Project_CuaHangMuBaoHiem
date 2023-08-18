package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Cart;
import vn.edu.hcmuaf.fit.model.Log;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.LogService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "AddDetail", value = "/AddDetail")
public class AddDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String proName = request.getParameter("proName");
        String username = (String) session.getAttribute("tendangnhap");

        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        PrintWriter out = response.getWriter();
        int id = Integer.parseInt(request.getParameter("id"));
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        String quan = request.getParameter("quantity");
        int quantity = Integer.parseInt(quan);
        Product p = null;
        try {
            p = ProductService.getDetailProduct(id, size, color);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        int key = 0;

        if (p.getDetail().isEmpty()) {
            response.sendRedirect("/Project_CuaHangMuBaoHiem_war/CheckAddProduct?id="+id+"&size="+size+"&color="+key+"&quantity="+quantity+"&quantityDB=0");

        }else {
            if (!p.getDetail().isEmpty()) {

                if (quantity <= 0) {
                    key = p.getDetail().get(0).getId();
                    response.sendRedirect("/Project_CuaHangMuBaoHiem_war/CheckAddProduct?id=" + id + "&size=" + size + "&color=" + key + "&quantity=" + quantity + "&quantityDB=" + p.getDetail().get(0).getQuantity());

                } else {
                    if (cart.getQuantityProduct(p.getKey()) == 0) {
                        if (quantity > p.getDetail().get(0).getQuantity()) {
                            key = p.getDetail().get(0).getId();
                            response.sendRedirect("/Project_CuaHangMuBaoHiem_war/CheckAddProduct?id=" + id + "&size=" + size + "&color=" + key + "&quantity=" + quantity + "&quantityDB=" + p.getDetail().get(0).getQuantity());
                        } else {
                            if (quantity <= p.getDetail().get(0).getQuantity()) {
                                p.setQuantity(quantity);
                                cart.putQuantity(p);
                                request.getSession().setAttribute("cart", cart);
                                response.sendRedirect("/Project_CuaHangMuBaoHiem_war/detail?id=" + id);

                            }
                        }
                    } else {
                        if (cart.getQuantityProduct(p.getKey()) != 0) {
                            if ((quantity + cart.getQuantityProduct(p.getKey())) > p.getDetail().get(0).getQuantity()) {
                                key = p.getDetail().get(0).getId();
                                response.sendRedirect("/Project_CuaHangMuBaoHiem_war/CheckAddProduct?id=" + id + "&size=" + size + "&color=" + key + "&quantity=" + quantity + "&quantityDB=" + (p.getDetail().get(0).getQuantity()-cart.getQuantityProduct(p.getKey())));
//                            out.write("no");

                            } else {
                                if ((quantity + cart.getQuantityProduct(p.getKey())) <= p.getDetail().get(0).getQuantity()) {
                                    p.setQuantity(quantity);
                                    cart.putQuantity(p);
                                    request.getSession().setAttribute("cart", cart);
                                    response.sendRedirect("/Project_CuaHangMuBaoHiem_war/detail?id=" + id);

                                }
                            }

                        }
                    }
                }
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

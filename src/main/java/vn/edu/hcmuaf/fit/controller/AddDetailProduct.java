package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Customer;
import vn.edu.hcmuaf.fit.model.Log;
import vn.edu.hcmuaf.fit.service.CustomerService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddDetailProduct", value = "/AddDetailProduct")
public class AddDetailProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("tendangnhap");
        Customer customer = null;
        try {
            customer = CustomerService.customer(username);
            if (customer == null || customer.getPermission() != 0&&!CustomerService.allow_service(CustomerService.id_access("quản lý sản phẩm",customer.getPermission(),"CREATE"))) {
                if(customer.getPermission()==3){
                    String message = "Bạn không đủ quyền để truy cập";
                    session.setAttribute("message",message);
                    response.sendRedirect("/Project_CuaHangMuBaoHiem_war/Home");
                    return;
                }else{
                    String previousURL = request.getHeader("referer");
                    if(!CustomerService.allow_service(CustomerService.id_access_link(previousURL,customer.getPermission(),"VIEW"))){
                        String message = "Bạn không đủ quyền để truy cập";
                        session.setAttribute("message",message);
                        response.sendRedirect("/Project_CuaHangMuBaoHiem_war/Home");
                        return;
                    }else{
                        session.setAttribute("previousURL", previousURL);
                        String message = "Bạn không đủ quyền để truy cập";
                        session.setAttribute("message",message);
                        response.sendRedirect(previousURL);
                        return;
                    }
                }
            }
            int id = Integer.parseInt(request.getParameter("id"));
            String size = request.getParameter("size");
            String color = request.getParameter("color");
            String quantity = request.getParameter("quantity");
            String price = request.getParameter("price");
            int pages = Integer.parseInt(request.getParameter("pages"));
            int iddp = 0;
            if (ProductService.checkDBContainSizeColor(id, size, color)) {
                iddp = ProductService.getIdDetailProductByCS(id, size, color);
                ProductService.insertImportProduct(id,size,color,quantity,price);
                ProductService.updateSizeColorById(iddp, quantity);
                ProductService.updatePriceMax((request.getParameter("id")));
            } else {
                ProductService.insertDetailProduct(id, size, color, quantity);
                ProductService.insertImportProduct(id,size,color,quantity,price);
                ProductService.updatePriceMax((request.getParameter("id")));
            }
            response.sendRedirect("/Project_CuaHangMuBaoHiem_war/DetailProduct?id=" + id+"&pages="+pages);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

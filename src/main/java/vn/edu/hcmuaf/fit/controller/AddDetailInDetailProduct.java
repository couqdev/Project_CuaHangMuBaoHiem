package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Customer;
import vn.edu.hcmuaf.fit.model.Log;
import vn.edu.hcmuaf.fit.service.CustomerService;
import vn.edu.hcmuaf.fit.service.LogService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddDetailInDetailProduct", value = "/AddDetailInDetailProduct")
public class AddDetailInDetailProduct extends HttpServlet {
    String name = "AUTH ";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("tendangnhap");
        Customer customer = null;
        try {
            Log log = new Log(Log.INFO, username, this.name, "", 0);
            customer = CustomerService.customer(username);
            if (customer == null || (customer.getPermission() != 0&&!CustomerService.allow_service(CustomerService.id_access("quản lý sản phẩm",customer.getPermission(),"CREATE")))) {
                if(customer.getPermission()==3){
                    String message = "Bạn không đủ quyền để truy cập";
                    session.setAttribute("message",message);
                    response.sendRedirect("/Project_CuaHangMuBaoHiem_war/Home");
                }else{
                    String previousURL = request.getHeader("referer");
                    if(!CustomerService.allow_service(CustomerService.id_access_link(previousURL,customer.getPermission(),"VIEW"))){
                        String message = "Bạn không đủ quyền để truy cập";
                        session.setAttribute("message",message);
                        response.sendRedirect("/Project_CuaHangMuBaoHiem_war/Home");
                    }else{
                        session.setAttribute("previousURL", previousURL);
                        String message = "Bạn không đủ quyền để truy cập";
                        session.setAttribute("message",message);
                        response.sendRedirect(previousURL);
                    }
                }

                log.setSrc(this.name + "ADD PRODUCT FALSE");
                log.setContent("ADD PRODUCT FALSE: Username - " + username);
                log.setLevel(Log.ERROR);
                return;
            }
            int id = Integer.parseInt(request.getParameter("id"));
            String size = request.getParameter("size");
            String color = request.getParameter("color");
            String quantity = request.getParameter("quantity");
            int iddp = 0;
            if (ProductService.checkDBContainSizeColor(id, size, color)) {
                iddp = ProductService.getIdDetailProductByCS(id, size, color);
                ProductService.updateSizeColorById(iddp, quantity);

                log.setSrc(this.name + " UPDATE PRODUCT");
                log.setContent("UPDATE PRODUCT SUCCESS" + id);
            } else {
                ProductService.insertDetailProduct(id, size, color, quantity);

                log.setSrc(this.name + " ADD DETAIL PRODUCT");
                log.setContent("ADD PRODUCT SUCCESS" + id);
                log.setLevel(Log.ALERT);
            }
            LogService.log(log);
            response.sendRedirect("/Project_CuaHangMuBaoHiem_war/DetailProduct?id=" + id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

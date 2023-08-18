package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Customer;
import vn.edu.hcmuaf.fit.model.Log;
import vn.edu.hcmuaf.fit.service.CustomerService;
import vn.edu.hcmuaf.fit.service.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "createProduct", value = "/createProduct")
public class CreateProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("tendangnhap");
        Customer customer = null;
        try {
            customer = CustomerService.customer(username);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if(customer==null||customer.getId_customer()!=0&&!CustomerService.allow_service(CustomerService.id_access("quản lý sản phẩm",customer.getPermission(),"CREATE"))){
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
        }else{
            response.sendRedirect("forms.jsp");

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

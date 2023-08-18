package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Bill;
import vn.edu.hcmuaf.fit.model.Customer;
import vn.edu.hcmuaf.fit.model.Log;
import vn.edu.hcmuaf.fit.service.CustomerService;
import vn.edu.hcmuaf.fit.service.LogService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "fix-bill", value = "/fix-bill")
public class FixBill extends HttpServlet {
    String name = "AUTH ";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("tendangnhap");
        Customer customer = null;
        try {
            Log log = new Log(Log.INFO, username, this.name, "", 0);
            customer = CustomerService.customer(username);
            if (customer == null || customer.getPermission() != 0&&!CustomerService.allow_service(CustomerService.id_access("quản lý hóa đơn",customer.getPermission(),"EDIT"))) {
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

                log.setSrc(this.name + "FIX BILL FALSE");
                log.setContent("FIX BILL FALSE: Username - " + username);
                log.setLevel(Log.ERROR);
                return;
            }
            int id = Integer.parseInt(request.getParameter("id"));
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String status = request.getParameter("status");
            ProductService.updateBill(id,address,phone,status);
            response.sendRedirect("list-bill");

            log.setSrc(this.name + "FIX BILL");
            log.setContent("FIX BILL: ID - " + id + " SUCCESS: Username - "  + username);
            log.setLevel(Log.WARNING);
            LogService.log(log);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

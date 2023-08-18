package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.api.Transport;
import vn.edu.hcmuaf.fit.model.Customer;
import vn.edu.hcmuaf.fit.service.CustomerService;
import vn.edu.hcmuaf.fit.service.TransportService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "UpdateInforTransport", value = "/UpdateInforTransport")
public class UpdateInforTransport extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("tendangnhap");
        Customer customer = null;
        try{
            customer = CustomerService.customer(username);
            if (customer == null || customer.getPermission() != 0 && !CustomerService.allow_service(CustomerService.id_access("quản lý hóa đơn", customer.getPermission(), "VIEW"))) {
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
            String province = request.getParameter("province");
            String district = request.getParameter("district");
            String ward = request.getParameter("ward");
            TransportService.getInstance().update(Integer.parseInt(district),Integer.parseInt(ward));
            response.sendRedirect("/Project_CuaHangMuBaoHiem_war/ManageTransport.jsp?province="+province+"&district="+district+"&ward="+ward);
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

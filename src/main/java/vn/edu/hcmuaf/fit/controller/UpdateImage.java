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

@WebServlet(name = "UpdateImage", value = "/UpdateImage")
public class UpdateImage extends HttpServlet {
    String namee = "AUTH ";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("tendangnhap");
        Customer customer = null;
        try {
            Log log = new Log(Log.INFO, username, this.namee, "", 0);
            customer = CustomerService.customer(username);
            if (customer == null || customer.getPermission() != 0&&!CustomerService.allow_service(CustomerService.id_access("quản lý trang chủ",customer.getPermission(),"EDIT"))) {
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

                log.setSrc(this.namee + "UPDATE IMAGE FALSE");
                log.setContent("UPDATE IMAGE FALSE: Username - " + username);
                log.setLevel(Log.ERROR);
                return;
            }
            int id_img = Integer.parseInt(request.getParameter("id_img"));
            int pages = Integer.parseInt(request.getParameter("pages"));
            String id_pd = request.getParameter("id");
            String allow = request.getParameter("allow");
            ProductService.updateImage(id_img, allow);
            response.sendRedirect("/Project_CuaHangMuBaoHiem_war/DetailProduct?id=" + id_pd+"&pages="+pages);

            log.setSrc(this.namee + "UPDATE IMAGE");
            log.setContent("UPDATE IMAGE SUCCESS: Username - "  + username);
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

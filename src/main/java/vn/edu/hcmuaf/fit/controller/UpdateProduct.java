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

@WebServlet(name = "UpdateProduct", value = "/UpdateProduct")
public class UpdateProduct extends HttpServlet {
    String namee = "AUTH ";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("tendangnhap");
        Customer customer = null;
        try {
            Log log = new Log(Log.INFO, username, this.namee, "", 0);
            customer = CustomerService.customer(username);
            if (customer == null || customer.getPermission() != 0 &&!CustomerService.allow_service(CustomerService.id_access("quản lý sản phẩm",customer.getPermission(),"EDIT"))) {
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

                log.setSrc(this.namee + "UPDATE PRODUCT FALSE");
                log.setContent("UPDATE PRODUCT FALSE: Username - " + username);
                log.setLevel(Log.ERROR);
                return;
            } else if (customer.getPermission() > 2) {
                request.setAttribute("error", "Bạn không có chức vụ trong trang web này. Vui lòng đăng nhập lại!");
                request.getRequestDispatcher("login.jsp").forward(request, response);

                log.setSrc(this.namee + "UPDATE PRODUCT FALSE");
                log.setContent("UPDATE PRODUCT FALSE: Username - " + username);
                log.setLevel(Log.ERROR);
                return;
            }
            int id = Integer.parseInt(request.getParameter("id"));
            int pages = Integer.parseInt(request.getParameter("pages"));
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String type = request.getParameter("type");
            String brand = request.getParameter("brand");
            String discount = request.getParameter("discount");
            String decrispe = request.getParameter("decrispe");
            ProductService.updateProduct(id,name,price,brand,type,discount,decrispe);
            response.sendRedirect("/Project_CuaHangMuBaoHiem_war/DetailProduct?id="+id+"&pages="+pages);

            log.setSrc(this.namee + "UPDATE PRODUCT");
            log.setContent("UPDATE PRODUCT " + name + " SUCCESS: Username - "  + username);
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

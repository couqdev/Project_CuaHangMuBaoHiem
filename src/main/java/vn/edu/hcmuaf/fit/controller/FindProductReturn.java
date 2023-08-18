package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Customer;
import vn.edu.hcmuaf.fit.model.Log;
import vn.edu.hcmuaf.fit.model.Product;
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

@WebServlet(name = "find_product_return", value = "/find_product_return")
public class FindProductReturn extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("tendangnhap");
        Customer customer = null;
        try {
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
            String indexPage = request.getParameter("index");
            String text = request.getParameter("text");
            request.setAttribute("text", text);
            if (indexPage == null) {
                indexPage = "1";
            }
            int index = Integer.parseInt(indexPage);
            int pre = index - 1;
            int next = index + 1;

            List<Product> list_pro = ProductService.findProductReturn(index,text);
            int n = list_pro.size();
            int endPage = n / 10;
            if (n % 10 != 0) {
                endPage++;
            }
            List<Product> list = new ArrayList<Product>();
            int begin = (index - 1) * 10;
            int end = Math.min(begin + 10, n);
            for (int i = begin; i < end; i++) {
                list.add(list_pro.get(i));
            }

            request.setAttribute("index", index);
            request.setAttribute("pre", pre);
            request.setAttribute("next", next);
            request.setAttribute("endP", endPage);

            request.setAttribute("list", list);
            request.getRequestDispatcher("product_return.jsp").forward(request, response);

        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Bill;
import vn.edu.hcmuaf.fit.model.Customer;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.CustomerService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.BitSet;
import java.util.List;

@WebServlet(name = "sales", value = "/sales")
public class Sales extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("tendangnhap");
        Customer customer = null;
        try {
            customer = CustomerService.customer(username);
            if (customer == null || customer.getPermission() != 0&&!CustomerService.allow_service(CustomerService.id_access("quản lý hóa đơn",customer.getPermission(),"VIEW"))) {
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
        String m = request.getParameter("month");
        String y = request.getParameter("year");
        List<Bill> list_bill = ProductService.getListBill();
        if(m=="" || y==""){
            request.setAttribute("error","error");
            request.setAttribute("list",list_bill);
            long sales = 0;
            int count = 0;
            request.setAttribute("sales",sales);
            request.setAttribute("count",count);
            request.getRequestDispatcher("bill_manager.jsp").forward(request,response);
        }else{

            int month = Integer.parseInt(m);
            int year = Integer.parseInt(y);
            List<Bill> listBill = ProductService.getBillByDate(month,year);
            List<Bill> list = ProductService.onePageFindBill(1,listBill);
            long sales = ProductService.totalPriceBill(month,year);
            int count = list.size();
            request.setAttribute("list",list);
            request.setAttribute("sales",sales);
            request.setAttribute("count",count);

            String indexPage = request.getParameter("index");
            if((indexPage==null)){
                indexPage="1";
            }
            int index = Integer.parseInt(indexPage);
            int pre = index - 1;
            int next = index + 1;
            if(list.size()==0){
                pre =0;
                next =0;
            }

            int n = count;
            int endPage = n/10;
            if(n % 10 != 0){
                endPage++;
            }
            request.setAttribute("index", index);
            request.setAttribute("pre", pre);
            request.setAttribute("next", next);
            request.setAttribute("endP", endPage);

            request.getRequestDispatcher("bill_manager.jsp").forward(request,response);
        }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

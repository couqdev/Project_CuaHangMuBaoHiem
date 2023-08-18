package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Customer;
import vn.edu.hcmuaf.fit.service.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "permission", value = "/permission")
public class Permission extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("tendangnhap");
        Customer customer = null;
        try {
            customer = CustomerService.customer(username);
            if (customer == null || customer.getPermission() != 0) {
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
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        String indexPage = request.getParameter("index");
        if(indexPage == null){
            indexPage = "1";
        }
        int index = Integer.parseInt(indexPage);
        int pre = index - 1;
        int next = index + 1;
        String name = request.getParameter("name");
        List<Integer> list_id = CustomerService.getListIdServiceByName(name);
        List<Integer> list = CustomerService.onePageLoadId(index,list_id);

        int n = list_id.size();
        int endPage = n/10;
        if(n % 10 != 0){
            endPage++;
        }

        request.setAttribute("index", index);
        request.setAttribute("pre", pre);
        request.setAttribute("next", next);
        request.setAttribute("endP", endPage);
        List<String> listService = new ArrayList<String>();
        listService.addAll(CustomerService.getListService());
        listService.remove(name);
        request.setAttribute("list",list);
        request.setAttribute("listService",listService);
        request.setAttribute("name",name);
        request.getRequestDispatcher("manager-permission.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
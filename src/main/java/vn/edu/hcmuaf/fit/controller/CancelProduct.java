package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "cancel-product", value = "/cancel-product")
public class CancelProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_bill = Integer.parseInt(request.getParameter("id_bill"));
        try {
            request.setAttribute("id_bill",id_bill);
            if(ProductService.getBill(id_bill).getStatus().equals("Đã Nhận")){
                request.getRequestDispatcher("notification2.jsp").forward(request,response);
            }else{
                ProductService.updateStatus(id_bill,"Đã hủy");
                request.getRequestDispatcher("notification1.jsp").forward(request,response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

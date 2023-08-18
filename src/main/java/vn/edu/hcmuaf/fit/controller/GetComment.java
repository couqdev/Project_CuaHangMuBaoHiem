package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "getComment", value = "/get-comment")
public class GetComment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idPro = Integer.parseInt(request.getParameter("id_Pro"));
        String mess = request.getParameter("mess");
        int star = Integer.parseInt(request.getParameter("star"));
        Customer customer = (Customer) request.getSession().getAttribute("tendangnhap");
//        ProductService.addComment(customer.getId_customer(),idPro,mess,star);
        response.sendRedirect("/Project_CuaHangMuBaoHiem_war/detail?id="+idPro);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

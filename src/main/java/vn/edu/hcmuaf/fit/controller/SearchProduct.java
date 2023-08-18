package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Log;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SearchProduct", value = "/SearchProduct")
public class SearchProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("tendangnhap");
        String text = request.getParameter("text");

        request.setAttribute("a", 1);
        request.setAttribute("t", text);
        request.getRequestDispatcher("ProductManagement.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

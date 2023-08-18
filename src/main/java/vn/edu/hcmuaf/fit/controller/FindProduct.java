package vn.edu.hcmuaf.fit.controller;
import vn.edu.hcmuaf.fit.model.Log;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FindProduct", value = "/find-product")
public class FindProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getSession().getAttribute("tendangnhap");
        String indexPage = request.getParameter("index");
        int index = Integer.parseInt(indexPage);
        int pre = index - 1;
        int next = index + 1;

        String text = request.getParameter("text");
        List<Product> list = ProductService.onePageFindProduct(index,ProductService.findProduct(text));

        int n = ProductService.getTotalProduct();
        int endPage = n/24;
        if(n % 24 != 0){
            endPage++;
        }

        request.setAttribute("index", index);
        request.setAttribute("pre", pre);
        request.setAttribute("next", next);
        request.setAttribute("endP", endPage);
        request.setAttribute("list",list);

        request.getRequestDispatcher("shop.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListNuaDau", value = "/ListNuaDau")
public class ListNuaDau extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> listNuaDau = ProductService.listNuaDau();
        String indexPage = request.getParameter("index");
        if(indexPage==null){
            indexPage="1";
        }
        int index = Integer.parseInt(indexPage);
        int pre = index - 1;
        int next = index + 1;

        List<Product> list = ProductService.onePageDisplayProduct(index,listNuaDau);

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

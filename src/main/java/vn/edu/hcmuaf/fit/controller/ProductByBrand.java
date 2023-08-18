package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "product-by-brand", value = "/product-by-brand")
public class ProductByBrand extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String brand = request.getParameter("brand");
        String indexPage = request.getParameter("index");
        if(indexPage==null){
            indexPage="1";
        }
        int index = Integer.parseInt(indexPage);
        int pre = index - 1;
        int next = index + 1;
        List<Product> list_pro_of_brand = ProductService.getProductByBrand(brand);
        List<Product> list = new ArrayList<Product>();
        int begin = (index-1)*10;
        int end = Math.min(begin+24, list_pro_of_brand.size());
        for(int i=begin;i<end;i++){
            list.add(list_pro_of_brand.get(i));
        }

        int n = list_pro_of_brand.size();
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

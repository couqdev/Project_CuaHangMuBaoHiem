package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.SlideShow;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.SlideShowService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Home", value = "/Home")
public class Home extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> list1 = ProductService.sort("new");
        request.setAttribute("list1",list1);
        List<Product> list2 = ProductService.listFullFace();
        request.setAttribute("list2",list2);
        List<Product> list3 = ProductService.list3_4();
        request.setAttribute("list3",list3);
        List<Product> list4 = ProductService.listNuaDau();
        request.setAttribute("list4",list4);
        List<Product> list5 = ProductService.listChildren();
        request.setAttribute("list5",list5);

        List<SlideShow> img1 = SlideShowService.getInstance().getImgSlideShow();
        request.setAttribute("img1",img1);

        List<SlideShow> img2 = SlideShowService.getInstance().getImgBanner();
        request.setAttribute("img2",img2);

        List<SlideShow> img3 = SlideShowService.getInstance().getImgLogo();
        request.setAttribute("img3",img3);

        request.getRequestDispatcher("index.jsp").forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

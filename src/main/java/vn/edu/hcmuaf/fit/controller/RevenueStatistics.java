package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RevenueStatistics", value = "/RevenueStatistics")
public class RevenueStatistics extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String m = request.getParameter("month");
        String y = request.getParameter("year");
        int month = Integer.parseInt(m);
        int year = Integer.parseInt(y);
        long sales = ProductService.getRevenueByMonthYear(month,year);
        request.setAttribute("sales",sales);
        request.getRequestDispatcher("revenue_statistics.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

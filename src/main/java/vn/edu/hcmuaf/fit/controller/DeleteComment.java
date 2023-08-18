package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.model.Log;
import vn.edu.hcmuaf.fit.service.LogService;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteComment", value = "/DeleteComment")
public class DeleteComment extends HttpServlet {
    String name = "AUTH ";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String)request.getSession().getAttribute("tendangnhap");
        Log log = new Log(Log.INFO, username, this.name, "", 0);
        int id_cus = Integer.parseInt(request.getParameter("idcus"));
        int id_pro = Integer.parseInt(request.getParameter("idp"));
        System.out.println(id_pro);
        int id_comt = Integer.parseInt(request.getParameter("idc"));
        System.out.println(id_comt);
        if (username == null) {
            request.setAttribute("error ", "Vui lòng đăng nhập để sử dụng chức năng này!");
            request.getRequestDispatcher("login.jsp").forward(request, response);

            log.setSrc(this.name + "DELETE COMMENT FALSE");
            log.setContent("DELETE COMMENT FALSE: Username - " + username);
            log.setLevel(Log.ERROR);
        } else {
            ProductService.deleteComment(id_comt);
            response.sendRedirect("/Project_CuaHangMuBaoHiem_war/detail?id=" + id_pro);

            log.setSrc(this.name + "DELETE COMMENT");
            log.setContent("DELETE COMMENT AT PRODUCT " + id_pro + " SUCCESS: Username - "  + username);
            log.setLevel(Log.DANGER);
            LogService.log(log);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

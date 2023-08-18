package vn.edu.hcmuaf.fit.controller;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.model.Comment;
import vn.edu.hcmuaf.fit.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet(name = "CommentServlet", value = "/CommentServlet")
public class CommentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String username = (String) session.getAttribute("tendangnhap");
        String idPro =request.getParameter("id");

        String stars =request.getParameter("star");
        String content = request.getParameter("mess");

        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);

        try {
            if (username != null) {
                int id_cus = ProductService.getIdCusByUserName(username);
                int star = Integer.parseInt(stars);
                int id_pro = Integer.parseInt(idPro);

                ProductService ps = new ProductService();
                ps.addComment(id_cus, id_pro, content, star, date, 1);

                List<Comment> comts =  ProductService.getAllComment();
                Comment comt = comts.get(comts.toArray().length-1);
                int idc = comt.getId();

                Gson gson = new Gson();
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                String dateStr = sdf.format(date);

                // Thêm tên người dùng vào đối tượng JSON được trả về
                String responseText = "{\"idcus\": " + id_cus + ",\"idp\": " + id_pro + ",\"idc\": " + idc + ", \"comment\": " + gson.toJson(comt) + ", \"date\": \"" + dateStr + "\", \"username\": \"" + username + "\" }";
                System.out.println(responseText);
                out.print(responseText);
                out.flush();
            } else{
                request.setAttribute("error", "Vui lòng đăng nhập để bình luận!.");
                request.getRequestDispatcher("login.jsp").forward(request,response);
                return;
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

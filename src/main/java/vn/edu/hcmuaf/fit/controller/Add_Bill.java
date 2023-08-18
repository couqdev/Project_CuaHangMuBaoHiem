package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.api.ApiLogistic;
import vn.edu.hcmuaf.fit.model.BillDetail;
import vn.edu.hcmuaf.fit.model.Cart;
import vn.edu.hcmuaf.fit.model.Log;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.service.LogService;
import vn.edu.hcmuaf.fit.service.MailService;
import vn.edu.hcmuaf.fit.service.ProductService;
import vn.edu.hcmuaf.fit.service.TransportService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "add_bill", value = "/add_bill")
public class Add_Bill extends HttpServlet {
    String namee = "AUTH ";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("tendangnhap");
        Log log = new Log(Log.INFO, username, this.namee, "", 0);

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String received_date = request.getParameter("received_date");
        String fee = request.getParameter("fee");
        String total_cost = request.getParameter("total_cost");
        String district = request.getParameter("district");
        String ward = request.getParameter("ward");
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        List<BillDetail> id_dp = new ArrayList<BillDetail>();
        BillDetail billDetail = new BillDetail();
        for (Product p : cart.getListProduct()) {
            billDetail = new BillDetail(p.getDetail().get(0).getId(), (long) p.getQuantity(), (long) (p.getPrice() - p.getPrice() * p.getDiscount()));
            billDetail.setName(p.getName());
            id_dp.add(billDetail);
        }
        if (name == "" || email == "" || phone == "" || address == "") {
            request.setAttribute("error", "error");
            request.getRequestDispatcher("checkout.jsp").forward(request, response);

            log.setSrc(this.namee + "CHECKOUT FALSE");
            log.setLevel(Log.ERROR);
            log.setContent("CHECKOUT FALSE: Username - " + username);
        } else {
            LocalDateTime date = LocalDateTime.now();
//            String username = (String) request.getSession().getAttribute("tendangnhap");
            int id_cus = 0;
            try {
                id_cus += ProductService.getCustomer(ProductService.getIdCusByUserName(username)).getId_customer();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            int from_district = TransportService.getInstance().getDistrict();
            int from_ward = TransportService.getInstance().getWard();
            ApiLogistic api = new ApiLogistic();
            String id_transport = api.registerTransport(25, 25, 25, 3000, from_district, from_ward, Integer.parseInt(district), Integer.parseInt(ward)).getId();

            try {
                int id_bill = ProductService.addBill(id_cus, "Đang gửi", id_dp, address, phone, id_transport, api.formatDateYMD(received_date), fee, total_cost);
//                PrintWriter out = response.getWriter();
//                out.println(api.formatDateYMD(api.formatDateYMD(received_date)+" "+ id_dp+" "+ address+" "+phone+" "+ id_transport+" "+fee+" "+ total_cost));
                cart.getCart().clear();
                cart.setTotal(0);
                cart.setQuantity(0);
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("address", address);
                request.setAttribute("id_bill", id_bill);
                request.setAttribute("list", id_dp);
                request.setAttribute("fee", fee);
                ProductService.removesQuantity(id_dp);
                String conttent_recive = "";
                conttent_recive += id_bill + "\n" + name + "\n" + email + "\n" + phone + "\n" + address + "\n" + "Tuy cập vào đây nếu giao hàng thành công" + "\n" + "http://localhost:8080/Project_CuaHangMuBaoHiem_war/ReciveProduct?id_bill=" + id_bill;
                MailService.sendMail("20130233@st.hcmuaf.edu.vn", "Giao hàng", conttent_recive);
                String conttent_cancel = "";
                conttent_cancel += id_bill + "\n" + name + "\n" + email + "\n" + phone + "\n" + address + "\n" + "Tuy cập vào đây nếu muốn hủy hàng" + "\n" + "http://localhost:8080/Project_CuaHangMuBaoHiem_war/CancelProduct?id_bill=" + id_bill;
                MailService.sendMail(email, "Helmetsshop", conttent_cancel);
                MailService.sendMail("20130233@st.hcmuaf.edu.vn", "Giao hàng", conttent_recive);
                request.getRequestDispatcher("detail_bill.jsp").forward(request, response);

                log.setSrc(this.namee + "CHECK OUT");
                log.setContent("CHECK OUT " + name + " SUCCESS: Username - " + username);
            } catch (Exception e) {
                e.printStackTrace();
            }
            LogService.log(log);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

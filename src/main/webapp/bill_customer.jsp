<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.*" %><%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 10/01/2023
  Time: 1:48 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>HelmetsShop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/account.css" rel="stylesheet">
</head>

<body>


<!-- Header Start -->
<%@include file="header.jsp" %>
<!-- Header End -->

<!-- Login Start -->
<section class="nav-vertical">
    <div class="row">
        <div class="col-3">
            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <%--                <a class="nav-link " id="v-pills-home-tab" data-toggle="pill" href="#v-pills-info" role="tab"--%>
                <%--                   aria-controls="v-pills-info" aria-selected="true">Thông tin cá nhân</a>--%>
                <%--                <a class="nav-link active" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-reset_pw" role="tab"--%>
                <%--                   aria-controls="#v-pills-reset_pw" aria-selected="false">Đổi mật khẩu</a>--%>
                <a class="nav-link " id="v-pills-home-tab" href=account.jsp role="tab"
                   aria-controls="v-pills-info" aria-selected="false">Thông tin cá nhân</a>
                <a class="nav-link" id="v-pills-profile-tab" href=change-password.jsp role="tab"
                   aria-controls="#v-pills-reset_pw" aria-selected="false">Đổi mật khẩu</a>
                <a class="nav-link active" id="v-pills-bill-tab" href="bill_customer.jsp" role="tab"
                   aria-controls="#v-pills-bill" aria-selected="true">Lịch sử mua hàng</a>
            </div>
        </div>
        <div class="col-9">
            <div class="tab-content" id="v-pills-tabContent">
                <div class="tab-pane fade" id="v-pills-info" role="tabpanel"
                     aria-labelledby="v-pills-info-tab">
                    <div class="form-account">
                        <form action="">
                            <div class="title">Thông tin cá nhân</div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-6">
                                        <label class="form-label">Họ và tên *</label>
                                        <input type="text"
                                               class="form-control"
                                               placeholder="Nhập Họ và tên"
                                               name="name"
                                               value="">
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label">Email *</label>
                                        <div class="form-control no_text">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <label class="form-label">Số điện thoại *</label>
                                        <input
                                                type="text"
                                                class="form-control"
                                                placeholder="Nhập Số điện thoại"
                                                name="phone"
                                                value="">
                                    </div>
                                    <div class="col-6">
                                        <label class="form-label">Địa chỉ *</label>
                                        <input
                                                type="text"
                                                class="form-control"
                                                placeholder="Nhập địa chỉ"
                                                name="address"
                                                value="">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="f-btn">
                                    <button type="submit"> Lưu</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="tab-pane fade" id="v-pills-reset_pw" role="tabpanel"
                     aria-labelledby="v-pills-reset_pw-tab">
                    <div class="form-account">
                        <form action="/Project_CuaHangMuBaoHiem_war/doChangePassword" method="post">
                            <div class="title">Đổi mật khẩu</div>

                            <div class="form-group-rp">
                                <input type="password" class="form-control" placeholder="Mật khẩu hiện tại"
                                       name="pass_old">
                                <input type="password" id="password" class="form-control" placeholder="Mật khẩu mới"
                                       name="password">
                                <p style="color: red">Mật khẩu phải chứa tối thiểu 6 ký tự.</p>
                                <input type="password" id="confirm_pw" class="form-control"
                                       placeholder="Nhập lại mật khẩu"
                                       name="confirm_pw">
                                <p style="color: red">Mật khẩu xác nhận phải trùng với mật khẩu mới.</p>
                            </div>

                            <div class="form-group">
                                <div class="f-btn">
                                    <button type="submit" id="submit"> Lưu</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <%
                    String username = (String) session.getAttribute("tendangnhap");
                    int id_cus = ProductService.getIdCusByUserName(username);
                    List<Bill> list = ProductService.getListBillByIdCustomer(id_cus);
                %>
                <div class="tab-pane fade show active" id="v-pills-bill" role="tabpanel"
                     aria-labelledby="v-pills-reset_pw-tab">

                    <table class="w-full whitespace-no-wrap">
                        <thead>
                        <tr
                                class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                        >
                            <th class="px-4 py-3">Id hóa đơn</th>
                            <th class="px-4 py-3">Đơn giá</th>
                            <th class="px-4 py-3">Địa chỉ</th>
                            <th class="px-4 py-3">Số điện thoại</th>
                            <th class="px-4 py-3">Ngày lập đơn</th>
                            <th class="px-4 py-3">Trạng thái</th>
                        </tr>
                        </thead>
                        <tbody
                                class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                        >
                        <%
                            for (Bill b : list) {
                        %>

                        <tr class="text-gray-700 dark:text-gray-400">
                            <td class="px-4 py-3">
                                <a href="/Project_CuaHangMuBaoHiem_war/CustomerBillToDetailBil?id=<%=b.getId()%>">
                                    <div class="flex items-center text-sm">
                                        <!-- Avatar with inset shadow -->

                                        <div>
                                            <%=b.getId()%>
                                        </div>
                                    </div>
                                </a>
                            </td>
                            <td class="px-4 py-3 text-sm">
                                <a href="/Project_CuaHangMuBaoHiem_war/CustomerBillToDetailBil?id=<%=b.getId()%>">
                                    <% long price = 0;
                                        for (int id_dp : b.getProductList()) {
                                            Product p = ProductService.getProduct(ProductService.getIdProduct(id_dp));
                                            price += p.getPrice() - p.getPrice() * p.getDiscount();
                                        }
                                        NumberFormat nf = new NumberFormat();%>
                                    <%=nf.numberFormat(price)%>đ
                                </a>
                            </td>
                            <td class="px-4 py-3 text-sm">
                                <a href="/Project_CuaHangMuBaoHiem_war/CustomerBillToDetailBil?id=<%=b.getId()%>">
                                    <%=b.getAddress()%>
                                </a>
                            </td>
                            <td class="px-4 py-3 text-sm">
                                <a href="/Project_CuaHangMuBaoHiem_war/CustomerBillToDetailBil?id=<%=b.getId()%>">
                                    <%=b.getPhone()%>
                                </a>
                            </td>
                            <td class="px-4 py-3 text-sm">
                                <a href="/Project_CuaHangMuBaoHiem_war/CustomerBillToDetailBil?id=<%=b.getId()%>">
                                    <%=b.getDate()%>
                                </a>
                            </td>
                            <td class="px-4 py-3 text-sm">
                                <a href="/Project_CuaHangMuBaoHiem_war/CustomerBillToDetailBil?id=<%=b.getId()%>">
                                    <%=b.getStatus()%>
                                </a>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </div>
</section>
<!-- Login End-->

<!-- Footer Start -->
<%@include file="footer.jsp" %>
<!-- Footer End -->


<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="mail/jqBootstrapValidation.min.js"></script>
<script src="mail/contact.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
<script src="js/valid.js" charset="utf-8"></script>
</body>

</html>


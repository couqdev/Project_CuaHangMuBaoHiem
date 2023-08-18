<%--
Created by IntelliJ IDEA.
User: ACER
Date: 11/6/2022
Time: 9:13 PM
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="css/login.css">
</head>

<body>
<!-- Header Start -->
<%@include file="header.jsp" %>
<!-- Header End -->

<!-- Login Start -->
<% String error = (String) request.getAttribute("error");%>
<% String success = (String) request.getAttribute("success");%>
<% String name = (String) request.getParameter("name");%>
<% String email = (String) request.getParameter("email");%>
<% String username = (String) request.getParameter("username");%>
<section>
    <div class="form-container "
         style="background: url('//localhost:8080/Project_CuaHangMuBaoHiem_war/img/login/nendangnhap.png')">
        <div class="form-login">
            <form action="/Project_CuaHangMuBaoHiem_war/doRegister" method="post">
                <div class="title">Đăng ký</div>
                <span style="color: green; font-size: 18px;"><%=(success != null && success != "") ? success : ""%>
                </span>
                <div class="form-group">
                    <div class="icon d-flex align-items-center justify-content-center">
                        <span class="fa-solid fa-info"></span></div>
                    <input type="text" value="<%=(name!=null && name!="")? name:""%>" class="form-control"
                           placeholder="Tên đầy đủ" name="name">
                </div>
                <div class="form-group">
                    <div class="icon d-flex align-items-center justify-content-center">
                        <span class="fa-solid fa-envelope"></span></div>
                    <input type="text" value="<%=(email!=null && email!="")? email:""%>" class="form-control"
                           placeholder="Email" name="email">
                </div>
                <div class="form-group">
                    <div class="icon d-flex align-items-center justify-content-center">
                        <span class="fa-solid fa-user"></span></div>
                    <input type="text" value="<%=(username!=null && username!="")? username:""%>" class="form-control"
                           placeholder="Tên đăng nhập" name="username">
                </div>
                <div class="form-group">
                    <div class="icon d-flex align-items-center justify-content-center">
                        <span class="fa-solid fa-lock"></span></div>
                    <input type="password" id="password" class="form-control" placeholder="Mật khẩu" name="password">
                    <p style="color: red">Mật khẩu phải chứa tối thiểu 6 ký tự.</p>
                </div>
                <div class="form-group">
                    <div class="icon d-flex align-items-center justify-content-center">
                        <span class="fa-solid fa-lock"></span></div>
                    <input type="password" id="confirm_pw" class="form-control" placeholder="Nhập lại mật khẩu"
                           name="confirm_pw">
                    <p style="color: red">Mật khẩu xác nhận phải trùng với mật khẩu mới.</p>
                </div>

                <div class="form-group">
                    <button type="submit" id="submit">Đăng ký</button>
                </div>
                <span style="color: red; font-size: 18px;"><%=(error != null && error != "") ? error : ""%>
                </span>
            </form>
            <div class="form-footer">
                <p>Bạn đã có tài khoản?</p>
                <a href="login.jsp" style="text-decoration: none">Đăng nhập</a>
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
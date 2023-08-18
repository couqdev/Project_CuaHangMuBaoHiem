<%--
  Created by IntelliJ IDEA.
  User: TranDangQuoc
  Date: 06/01/2023
  Time: 9:46 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="vn.edu.hcmuaf.fit.controller.FilterProduct" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.model.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.model.SlideShow" %>
<%@ page import="vn.edu.hcmuaf.fit.service.SlideShowService" %><%--
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
    <title>Cửa hàng bán mũ bảo hiểm</title>
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

    <style>
        .btn-group .login:hover{
            text-decoration: none;
        }
        .btn-group .login{
            color: black;
            margin-top: 10px;
        }
    </style>
</head>

<body>

<!-- Header Star -->
<%@include file="header.jsp"%>
<!-- Header End -->
<% String exits = (String) request.getAttribute("exits");
    String color =(String) request.getAttribute("color");
    String size =(String) request.getAttribute("size");
    int id =(int) request.getAttribute("id");
    String quantity =(String) request.getAttribute("quantity");
    String quantityDB =(String) request.getAttribute("quantityDB");
    int a = Integer.parseInt(quantity);
    int b = Integer.parseInt(quantityDB);
    int r = a-b;
%>
<% if(a==0){ %>
<div class="col-lg-4" style="margin: auto">
    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">THÔNG BÁO</span></h5>
    <div class="bg-light p-30 mb-5">
        <div class="border-bottom">
            <div class="d-flex justify-content-between">
                <p>Số lượng ít nhất phải là 1</p>
            </div>
        </div>
    </div>
</div>
<%}else{if(b==0){%>

<div class="col-lg-4" style="margin: auto">
    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">THÔNG BÁO</span></h5>
    <div class="bg-light p-30 mb-5">
        <div class="border-bottom">
            <div class="d-flex justify-content-between">
                <p>Sản phẩm đã hết hàng</p>
            </div>
        </div>

    </div>
</div>

<%}else{%><div class="col-lg-4" style="margin: auto">
    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">THÔNG BÁO</span></h5>
    <div class="bg-light p-30 mb-5">
        <div class="border-bottom">
            <div class="d-flex justify-content-between">
                <p>Kích thước</p>
                <p><%= size %></p>
            </div>
            <div class="d-flex justify-content-between">
                <p>Màu sắc</p>
                <p><%= color %></p>
            </div>
            <div class="d-flex justify-content-between">
                <p>Số lượng đã chọn</p>
                <p><%= quantity %></p>
            </div>
            <div class="d-flex justify-content-between">
                <p>Số lượng còn lại</p>
                <p><%= quantityDB %></p>
            </div>
        </div>

    </div>
    <div>
        <%--        <a href="<%= "/Project_CuaHangMuBaoHiem_war/detail?id="+ id %>"><button style="background: #FFD333;font-weight: bold;margin-left: 62px;color: white ;border:0;height: 50px; width: 180px">CHỌN LẠI</button></a>--%>

    </div>
</div><%}}%>
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
</body>

</html>

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
    <title>Trang chủ</title>
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

<!-- Carousel Start -->
<div class="container-fluid mb-3">
    <div class="row px-xl-5">
        <div class="col-lg-8">
            <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
                    <li data-target="#header-carousel" data-slide-to="1"></li>
                    <li data-target="#header-carousel" data-slide-to="2"></li>
                </ol>
                <% List<SlideShow> img1 = (List<SlideShow>) request.getAttribute("img1");%>
                <div class="carousel-inner">
                    <div class="carousel-item position-relative active" style="height: 430px;">


                        <img class="position-absolute w-100 h-100" <%if(img1.size()<=0){%>src="img/noimage.jpg"<%}else{%>src="<%=img1.get(0).getImg()%>"<%}%> style="object-fit: cover;">



                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 700px;">
                            </div>
                        </div>
                    </div>
                    <%for(int i=1;i<img1.size();i++){%>
                    <div class="carousel-item position-relative" style="height: 430px;">
                        <img class="position-absolute w-100 h-100" src="<%=img1.get(i).getImg()%>" style="object-fit: cover;">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 700px;">
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <% List<SlideShow> img2 = (List<SlideShow>) request.getAttribute("img2");
            for(SlideShow s : img2){%>
            <div class="product-offer mb-30" style="height: 200px;">
                <img class="img-fluid" src="<%= s.getImg() %>" alt="">
                <div class="offer-text">
                    <h6 class="text-white text-uppercase">Giảm giá <%= s.getDiscount()*100 %>%</h6>
                    <h3 class="text-white mb-3"><%= s.getContent() %></h3>
                    <a href="<%= "/Project_CuaHangMuBaoHiem_war/ListProductDiscount?discount="+ s.getDiscount() %>" class="btn btn-primary">Mua ngay</a>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</div>
<!-- Carousel End -->


<!-- Products Start -->
<div class="container-fluid pt-5 pb-3">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Sản phẩm mới nhất</span></h2>
    <div class="row px-xl-5">
        <% NumberFormat nf = new NumberFormat();
            List<Product> list1 = (List<Product>) request.getAttribute("list1");
        if(list1.size()<8){
            for (Product p1:list1){%>

        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" <%if(p1.getImg().size()<=0){%>src="img/noimage.jpg"<%}else{%> src="<%=p1.getImg().get(0).getImg()%>" <%}%> alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +p1.getId()%>"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +p1.getId()%>"><%=p1.getName()%></a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5><%=nf.numberFormat((long)(p1.getPrice()-p1.getPrice()*p1.getDiscount()))%>đ</h5><h6 class="text-muted ml-2"><del><%=nf.numberFormat(p1.getPrice())%>đ</del></h6>
                    </div>
                    <% if(p1.sumQuantity()<=0) {%>Hết hàng<%}else{%> Còn: <%=p1.sumQuantity()%><%}%>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <%for (int j=1;j<=p1.getStar();j++){%>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <%}
                            if ((p1.getStar()*10)%10!=0){
                        %>
                        <small class="fa fa-star-half-alt text-primary mr-1"></small>
                        <%}%>
                        <small>(<%=p1.getAmount()%>)</small>
                    </div>
                </div>
            </div>
        </div>

        <%}}else{
            for(int i = 0;i<8;i++){%>

        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" <%if(list1.get(i).getImg().size()<=0){%>src="img/noimage.jpg"<%}else{%> src="<%=list1.get(i).getImg().get(0).getImg()%>" <%}%>  alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +list1.get(i).getId()%>"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +list1.get(i).getId()%>"><%=list1.get(i).getName()%></a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5><%=nf.numberFormat((long)(list1.get(i).getPrice()-list1.get(i).getPrice()*list1.get(i).getDiscount()))%>đ</h5><h6 class="text-muted ml-2"><del><%=nf.numberFormat(list1.get(i).getPrice())%>đ</del></h6>
                    </div>
                    <% if(list1.get(i).sumQuantity()<=0) {%>Hết hàng<%}else{%> Còn: <%=list1.get(i).sumQuantity()%><%}%>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <%for (int j=1;j<=list1.get(i).getStar();j++){%>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <%}
                            if ((list1.get(i).getStar()*10)%10!=0){
                        %>
                        <small class="fa fa-star-half-alt text-primary mr-1"></small>
                        <%}%>
                        <small>(<%=list1.get(i).getAmount()%>)</small>
                    </div>
                </div>
            </div>
        </div>
        <%}}%>
    </div>
</div>
<!-- Products End -->
<div class="container-fluid pt-5 pb-3">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Nón bảo hiểm Fullface</span></h2>
    <div class="row px-xl-5">
        <%
            List<Product> list2 = (List<Product>) request.getAttribute("list2");
            if(list2.size()<8){
                for (Product p1:list2){%>

        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" <%if(p1.getImg().size()<=0){%>src="img/noimage.jpg"<%}else{%> src="<%=p1.getImg().get(0).getImg()%>" <%}%> alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +p1.getId()%>"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +p1.getId()%>"><%=p1.getName()%></a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5><%=nf.numberFormat((long)(p1.getPrice()-p1.getPrice()*p1.getDiscount()))%>đ</h5><h6 class="text-muted ml-2"><del><%=nf.numberFormat(p1.getPrice())%>đ</del></h6>
                    </div>
                    <% if(p1.sumQuantity()<=0) {%>Hết hàng<%}else{%> Còn: <%=p1.sumQuantity()%><%}%>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <%for (int j=1;j<=p1.getStar();j++){%>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <%}
                            if ((p1.getStar()*10)%10!=0){
                        %>
                        <small class="fa fa-star-half-alt text-primary mr-1"></small>
                        <%}%>
                        <small>(<%=p1.getAmount()%>)</small>
                    </div>
                </div>
            </div>
        </div>

        <%}}else{
            for(int i = 0;i<8;i++){%>

        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" <%if(list2.get(i).getImg().size()<=0){%>src="img/noimage.jpg"<%}else{%> src="<%=list2.get(i).getImg().get(0).getImg()%>" <%}%> alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +list2.get(i).getId()%>"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +list2.get(i).getId()%>"><%=list2.get(i).getName()%></a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5><%=nf.numberFormat((long)(list2.get(i).getPrice()-list2.get(i).getPrice()*list2.get(i).getDiscount()))%>đ</h5><h6 class="text-muted ml-2"><del><%=nf.numberFormat(list2.get(i).getPrice())%>đ</del></h6>
                    </div>
                    <% if(list2.get(i).sumQuantity()<=0) {%>Hết hàng<%}else{%> Còn: <%=list2.get(i).sumQuantity()%><%}%>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <%for (int j=1;j<=list2.get(i).getStar();j++){%>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <%}
                            if ((list2.get(i).getStar()*10)%10!=0){
                        %>
                        <small class="fa fa-star-half-alt text-primary mr-1"></small>
                        <%}%>
                        <small>(<%=list2.get(i).getAmount()%>)</small>
                    </div>
                </div>
            </div>
        </div>
        <%}}%>
    </div>
</div>

<div class="container-fluid pt-5 pb-3">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Nón bảo hiểm 3/4</span></h2>
    <div class="row px-xl-5">
        <%
            List<Product> list3 = (List<Product>) request.getAttribute("list3");
            if(list3.size()<8){
                for (Product p1:list3){%>

        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" <%if(p1.getImg().size()<=0){%>src="img/noimage.jpg"<%}else{%> src="<%=p1.getImg().get(0).getImg()%>" <%}%> alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +p1.getId()%>"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +p1.getId()%>"><%=p1.getName()%></a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5><%=nf.numberFormat((long)(p1.getPrice()-p1.getPrice()*p1.getDiscount()))%>đ</h5><h6 class="text-muted ml-2"><del><%=nf.numberFormat(p1.getPrice())%>đ</del></h6>
                    </div>
                    <% if(p1.sumQuantity()<=0) {%>Hết hàng<%}else{%> Còn: <%=p1.sumQuantity()%><%}%>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <%for (int j=1;j<=p1.getStar();j++){%>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <%}
                            if ((p1.getStar()*10)%10!=0){
                        %>
                        <small class="fa fa-star-half-alt text-primary mr-1"></small>
                        <%}%>
                        <small>(<%=p1.getAmount()%>)</small>
                    </div>
                </div>
            </div>
        </div>

        <%}}else{
            for(int i = 0;i<8;i++){%>

        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" <%if(list3.get(i).getImg().size()<=0){%>src="img/noimage.jpg"<%}else{%> src="<%=list3.get(i).getImg().get(0).getImg()%>" <%}%> alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +list3.get(i).getId()%>"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +list3.get(i).getId()%>"><%=list3.get(i).getName()%></a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5><%=nf.numberFormat((long)(list3.get(i).getPrice()-list3.get(i).getPrice()*list3.get(i).getDiscount()))%>đ</h5><h6 class="text-muted ml-2"><del><%=nf.numberFormat(list3.get(i).getPrice())%>đ</del></h6>
                    </div>
                    <% if(list3.get(i).sumQuantity()<=0) {%>Hết hàng<%}else{%> Còn: <%=list3.get(i).sumQuantity()%><%}%>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <%for (int j=1;j<=list3.get(i).getStar();j++){%>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <%}
                            if ((list3.get(i).getStar()*10)%10!=0){
                        %>
                        <small class="fa fa-star-half-alt text-primary mr-1"></small>
                        <%}%>
                        <small>(<%=list3.get(i).getAmount()%>)</small>
                    </div>
                </div>
            </div>
        </div>
        <%}}%>
    </div>
</div>

<div class="container-fluid pt-5 pb-3">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Nón bảo hiểm nửa đầu</span></h2>
    <div class="row px-xl-5">
        <%
            List<Product> list4 = (List<Product>) request.getAttribute("list4");
            if(list4.size()<8){
                for (Product p1:list4){%>

        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" <%if(p1.getImg().size()<=0){%>src="img/noimage.jpg"<%}else{%> src="<%=p1.getImg().get(0).getImg()%>" <%}%> alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +p1.getId()%>"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +p1.getId()%>"><%=p1.getName()%></a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5><%=nf.numberFormat((long)(p1.getPrice()-p1.getPrice()*p1.getDiscount()))%>đ</h5><h6 class="text-muted ml-2"><del><%=nf.numberFormat(p1.getPrice())%>đ</del></h6>
                    </div>
                    <% if(p1.sumQuantity()<=0) {%>Hết hàng<%}else{%> Còn: <%=p1.sumQuantity()%><%}%>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <%for (int j=1;j<=p1.getStar();j++){%>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <%}
                            if ((p1.getStar()*10)%10!=0){
                        %>
                        <small class="fa fa-star-half-alt text-primary mr-1"></small>
                        <%}%>
                        <small>(<%=p1.getAmount()%>)</small>
                    </div>
                </div>
            </div>
        </div>

        <%}}else{
            for(int i = 0;i<8;i++){%>

        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" <%if(list4.get(i).getImg().size()<=0){%>src="img/noimage.jpg"<%}else{%> src="<%=list4.get(i).getImg().get(0).getImg()%>" <%}%> alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +list4.get(i).getId()%>"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +list4.get(i).getId()%>"><%=list4.get(i).getName()%></a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5><%=nf.numberFormat((long)(list4.get(i).getPrice()-list4.get(i).getPrice()*list4.get(i).getDiscount()))%>đ</h5><h6 class="text-muted ml-2"><del><%=nf.numberFormat(list4.get(i).getPrice())%>đ</del></h6>
                    </div>
                    <% if(list4.get(i).sumQuantity()<=0) {%>Hết hàng<%}else{%> Còn: <%=list4.get(i).sumQuantity()%><%}%>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <%for (int j=1;j<=list4.get(i).getStar();j++){%>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <%}
                            if ((list4.get(i).getStar()*10)%10!=0){
                        %>
                        <small class="fa fa-star-half-alt text-primary mr-1"></small>
                        <%}%>
                        <small>(<%=list4.get(i).getAmount()%>)</small>
                    </div>
                </div>
            </div>
        </div>
        <%}}%>
    </div>
</div>

<div class="container-fluid pt-5 pb-3">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Nón bảo hiểm Trẻ em</span></h2>
    <div class="row px-xl-5">
        <%
            List<Product> list5 = (List<Product>) request.getAttribute("list5");
            if(list5.size()<8){
                for (Product p1:list5){%>

        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" <%if(p1.getImg().size()<=0){%>src="img/noimage.jpg"<%}else{%> src="<%=p1.getImg().get(0).getImg()%>" <%}%> alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +p1.getId()%>"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +p1.getId()%>"><%=p1.getName()%></a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5><%=nf.numberFormat((long)(p1.getPrice()-p1.getPrice()*p1.getDiscount()))%>đ</h5><h6 class="text-muted ml-2"><del><%=nf.numberFormat(p1.getPrice())%>đ</del></h6>
                    </div>
                    <% if(p1.sumQuantity()<=0) {%>Hết hàng<%}else{%> Còn: <%=p1.sumQuantity()%><%}%>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <%for (int j=1;j<=p1.getStar();j++){%>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <%}
                            if ((p1.getStar()*10)%10!=0){
                        %>
                        <small class="fa fa-star-half-alt text-primary mr-1"></small>
                        <%}%>
                        <small>(<%=p1.getAmount()%>)</small>
                    </div>
                </div>
            </div>
        </div>

        <%}}else{
            for(int i = 0;i<8;i++){%>

        <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
            <div class="product-item bg-light mb-4">
                <div class="product-img position-relative overflow-hidden">
                    <img class="img-fluid w-100" <%if(list5.get(i).getImg().size()<=0){%>src="img/noimage.jpg"<%}else{%> src="<%=list5.get(i).getImg().get(0).getImg()%>" <%}%> alt="">
                    <div class="product-action">
                        <a class="btn btn-outline-dark btn-square" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +list5.get(i).getId()%>"><i class="fa fa-search"></i></a>
                    </div>
                </div>
                <div class="text-center py-4">
                    <a class="h6 text-decoration-none text-truncate" href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +list5.get(i).getId()%>"><%=list5.get(i).getName()%></a>
                    <div class="d-flex align-items-center justify-content-center mt-2">
                        <h5><%=nf.numberFormat((long)(list5.get(i).getPrice()-list5.get(i).getPrice()*list5.get(i).getDiscount()))%>đ</h5><h6 class="text-muted ml-2"><del><%=nf.numberFormat(list5.get(i).getPrice())%>đ</del></h6>
                    </div>
                    <% if(list5.get(i).sumQuantity()<=0) {%>Hết hàng<%}else{%> Còn: <%=list5.get(i).sumQuantity()%><%}%>
                    <div class="d-flex align-items-center justify-content-center mb-1">
                        <%for (int j=1;j<=list5.get(i).getStar();j++){%>
                        <small class="fa fa-star text-primary mr-1"></small>
                        <%}
                            if ((list5.get(i).getStar()*10)%10!=0){
                        %>
                        <small class="fa fa-star-half-alt text-primary mr-1"></small>
                        <%}%>
                        <small>(<%=list5.get(i).getAmount()%>)</small>
                    </div>
                </div>
            </div>
        </div>
        <%}}%>
    </div>
</div>
<!-- Vendor Start -->
<div class="container-fluid py-5">
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel vendor-carousel">
                <% List<SlideShow> img3 = (List<SlideShow>) request.getAttribute("img3");
                for(SlideShow s : img3){
                %>
                <div class="bg-light p-4">
                    <img src="<%= s.getImg() %>" alt="">
                </div>
                <%}%>
            </div>
        </div>
    </div>
    <%
        String message = (String)session.getAttribute("message"); // Lấy thông báo từ session
        session.removeAttribute("message"); // Xóa thông báo khỏi session

        if (message != null) { // Nếu thông báo có giá trị
    %>
    <script>
        alert("<%=message%>"); // Hiển thị alert với thông báo được truyền từ Servlet
    </script>
    <%
        }
    %>
</div>
<!-- Vendor End -->

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
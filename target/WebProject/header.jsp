<%@ page import="vn.edu.hcmuaf.fit.model.Cart" %>
<%@ page import="vn.edu.hcmuaf.fit.service.CustomerService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.Customer" %><%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 11/6/2022
  Time: 9:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="cart" class="vn.edu.hcmuaf.fit.model.Cart" scope="session"/>
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
    <link href="fontawesome-free-6.2.1/css/all.css" rel="stylesheet">
</head>
<body>
<!-- Topbar Start -->
<div class="container-fluid">
    <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
        <div class="col-lg-4">
            <a href="/Project_CuaHangMuBaoHiem_war/Home" class="text-decoration-none">
                <span class="h1 text-uppercase text-primary bg-dark px-2">Helmets</span>
                <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">Shop</span>
            </a>
        </div>
        <div class="col-lg-4 col-6 text-left pt-2" style="margin-top: 8px">
            <form action="/Project_CuaHangMuBaoHiem_war/find-product" method="get">
                <div class="input-group">
                    <input type="text" name="text" class="form-control" placeholder="Nhập từ khóa cần tìm kiếm">
                    <div class="input-group-append">
                        <input type="submit" value="Tìm kiếm" class="input-group-text bg-transparent text-primary">
                        <input hidden name="index" value="1">
                        <%--                                <i class="fa fa-search"></i>--%>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-4 col-6 text-right">
            <p class="m-0">Hỗ trợ khách hàng</p>
            <h5 class="m-0">+038 345 6789</h5>
        </div>
    </div>
</div>
<!-- Topbar End -->


<!-- Navbar Start -->
<div class="container-fluid bg-dark mb-30">
    <div class="row px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse"
               href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Danh mục sản phẩm</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
                 id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                <div class="navbar-nav w-100">
                    <a href="/Project_CuaHangMuBaoHiem_war/ListFullface" class="nav-item nav-link">Nón bảo hiểm
                        fullface</a>
                    <a href="/Project_CuaHangMuBaoHiem_war/List3_4" class="nav-item nav-link">Nón bảo hiểm 3/4</a>
                    <a href="/Project_CuaHangMuBaoHiem_war/ListNuaDau" class="nav-item nav-link">Nón nửa đầu</a>
                    <a href="/Project_CuaHangMuBaoHiem_war/ListChildren" class="nav-item nav-link">Nón trẻ em</a>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <span class="h1 text-uppercase text-dark bg-light px-2">Helmets</span>
                    <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">Shop</span>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="/Project_CuaHangMuBaoHiem_war/Home" class="nav-item nav-link">Trang chủ</a>
                        <a href="/Project_CuaHangMuBaoHiem_war/ListProduct" class="nav-item nav-link">Sản phẩm</a>
                        <a href="/Project_CuaHangMuBaoHiem_war/list-brand" class="nav-item nav-link">Thương hiệu</a>
                        <a href="contact.jsp" class="nav-item nav-link">Liên hệ</a>
                    </div>
                    <div class="navbar-nav ml-auto py-0">
                        <div class="navbar-nav ml-auto py-0">
                            <% String se = (String) request.getSession().getAttribute("tendangnhap");%>
                            <% if (se == null) {%>
                            <div class="navbar-nav ml-auto py-0">
                                <a href="login.jsp" class="nav-item nav-link">
                                    <i class="fas fa-user text-primary" style="padding-top: 4px"></i>
                                </a>
                            </div>
                            <% } else { %>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"><i
                                        class="fas fa-user text-primary"
                                        style="padding-top: 4px; padding-right: 4px; "></i>
                                    <%if(CustomerService.customer((String)request.getSession().getAttribute("tendangnhap")).getTypeAccount()==1 || CustomerService.customer((String)request.getSession().getAttribute("tendangnhap")).getTypeAccount()==2){%>
                                    <%= CustomerService.customer((String)request.getSession().getAttribute("tendangnhap")).getName()%>
                                <%}else{%>
                                    <%= se%>
                                    <%}%>
                                </a>
                                <div class="dropdown-menu bg-dark border-bt-primary m-0">
                                    <a href="account.jsp" class="dropdown-item text-primary">Thông tin</a>
                                    <%
                                        if(CustomerService.customer((String)request.getSession().getAttribute("tendangnhap")).getPermission()==0||CustomerService.customer((String)request.getSession().getAttribute("tendangnhap")).getPermission()==1||CustomerService.customer((String)request.getSession().getAttribute("tendangnhap")).getPermission()==2){
                                    %>
                                    <a href="/Project_CuaHangMuBaoHiem_war/ManageProduct" class="dropdown-item text-primary">Trang quản lý</a>
                                    <%}%>
                                    <a href="DoLogout" class="dropdown-item text-primary">Đăng xuất</a>
                                </div>
                            </div>
                            <% }%>

                            <div class="navbar-nav ml-auto py-0">
                                <a href="/Project_CuaHangMuBaoHiem_war/ListProductInCart" class="nav-item nav-link">
                                    <i class="fas fa-shopping-cart text-primary"></i>

                                    <span class="badge text-secondary border border-secondary rounded-circle"
                                          style="padding-bottom: 2px;"><%=cart.getQuanlity()%></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- Navbar End -->
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>
</body>
</html>

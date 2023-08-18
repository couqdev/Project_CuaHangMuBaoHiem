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
    <title>Liên hệ</title>
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
    <link href="fontawesome-free-6.2.1/css/all.css">
</head>

<body>

<!-- Header Start -->
<%@include file="header.jsp"%>
<!-- Header End -->


<!-- Breadcrumb Start -->
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-12">
            <nav class="breadcrumb bg-light mb-30">
                <a class="breadcrumb-item text-dark" href="/Project_CuaHangMuBaoHiem_war/Home">Trang chủ</a>
                <span class="breadcrumb-item active">Liên hệ</span>
            </nav>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->


<!-- Contact Start -->
<div class="container-fluid">
    <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Liên hệ với chúng tôi</span></h2>
    <div class="row px-xl-5">
        <div class="col-lg-7 mb-5">
            <div class="contact-form bg-light p-30">
                <div id="success"></div>
                <form id="ct"  method="get" action="/Project_CuaHangMuBaoHiem_war/Contact">
                    <div class="control-group">
                        <input type="text" class="form-control" name="name" id="name" placeholder="Tên của bạn"
                               required="required" data-validation-required-message="Vui lòng nhập tên bạn" />
                        <p id="alertname" class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <input type="email" class="form-control" name="email" id="email" placeholder="Email của bạn"
                               required="required" data-validation-required-message="Vui lòng nhập email của bạn" />
                        <p id="alertemail" class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <input type="text" class="form-control" name="subject" id="subject" placeholder="Tiêu đề"
                               required="required" data-validation-required-message="Please enter a subject" />
                        <p id="alertsubject" class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                            <textarea class="form-control" rows="8" name="content" id="message" placeholder="Nội dung"
                                      required="required"
                                      data-validation-required-message="Please enter your message"></textarea>
                        <p id="alertcontent" class="help-block text-danger"></p>
                    </div>
                    <div>

                        <button onclick="check()" class="btn btn-primary py-2 px-4" type="submit" id="sendMessageButton">Gửi</button>

                    </div>
                </form>
            </div>
        </div>
        <div class="col-lg-5 mb-5">
            <div class="bg-light p-30 mb-30">
                <iframe style="width: 100%; height: 250px;"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.2145945643592!2d106.7917617!3d10.8712764!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRwLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1667227488021!5m2!1svi!2s"
                        frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
            </div>
            <div class="bg-light p-30 mb-3">
                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Khu phố 6, phường Linh Trung, TP.Thủ Đức, TP.HCM</p>
                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>helmetsshop@gmail.com</p>
                <p class="mb-2"><i class="fa fa-phone-alt text-primary mr-3"></i>+038 345 6789</p>
            </div>
        </div>
    </div>
</div>
<!-- Contact End -->


<!-- Footer Start -->
<%@include file="footer.jsp"%>
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
<script src="js/contact.js"></script>
</body>

</html>
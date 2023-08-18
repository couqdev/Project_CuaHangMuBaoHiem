<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

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
</head>

<body>

<!-- Header Star -->
<%@include file="header.jsp"%>
<!-- Header End -->


<!-- Breadcrumb Start -->
<div class="container-fluid">
  <div class="row px-xl-5">
    <div class="col-12">
      <nav class="breadcrumb bg-light mb-30">
        <a class="breadcrumb-item text-dark" href="index.html">Trang Chủ</a>
        <a class="breadcrumb-item text-dark" href="#">Cửa hàng</a>
        <span class="breadcrumb-item active">Thanh Toán</span>
      </nav>
    </div>
  </div>
</div>
<!-- Breadcrumb End -->


<!-- Checkout Start -->
    </div>
    <div class="col-lg-4" style="margin: auto">
      <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">ĐƠN ĐẶT HÀNG</span></h5>
      <div class="bg-light p-30 mb-5">
        <div class="border-bottom">
          <h6 class="mb-3">Thông tin người mua</h6>
          <div class="d-flex justify-content-between">
            <p>Tên</p>
            <p><%=request.getAttribute("name")%></p>
          </div>
          <div class="d-flex justify-content-between">
            <p>Số điện thoại</p>
            <p><%=request.getAttribute("phone")%></p>
          </div>
          <div class="d-flex justify-content-between">
            <p>Email</p>
            <p><%=request.getAttribute("email")%></p>
          </div>
          <div class="d-flex justify-content-between">
            <p>Địa chỉ</p>
            <p><%=request.getAttribute("address")%></p>
          </div>
          <h6 class="mb-3">Các sản phẩm</h6>
          <%
            List<BillDetail> list = (List<BillDetail>)request.getAttribute("list");
            NumberFormat nf = new NumberFormat();
            for(BillDetail s: list){%>
          <div class="d-flex justify-content-between">
            <p><%=s.getName()%> x<%=s.getQuantitySold()%></p>
            <p><%=nf.numberFormat(s.getPrice()*s.getQuantitySold())%>đ</p>
          </div>
          <%}%>
        </div>
        <div class="border-bottom pt-3 pb-2">
          <div class="d-flex justify-content-between mb-3">
            <h6>Tổng tiền hàng</h6>
            <%
              long price = 0;
              for(BillDetail s:list){
                price += s.getPrice()*s.getQuantitySold();
              }%>
            <h6><%=nf.numberFormat(price)%>đ</h6>
          </div>
          <div class="d-flex justify-content-between">
            <h6 class="font-weight-medium">Phí vận chuyển</h6>
            <h6 class="font-weight-medium"><%=nf.numberFormat(Integer.parseInt(request.getAttribute("fee").toString()))%> đ</h6>
          </div>
        </div>
        <div class="pt-2">
          <div class="d-flex justify-content-between mt-2">
            <h5>Tổng thanh toán</h5>
            <h5><%=nf.numberFormat(price+Integer.parseInt(request.getAttribute("fee").toString()))%>đ</h5>
          </div>
        </div>
      </div>
      <div>
      <a href="/Project_CuaHangMuBaoHiem_war/Home"><button style="background: #FFD333;font-weight: bold;margin-left: 62px;color: white ;border:0;height: 50px; width: 180px">VỀ TRANG CHỦ</button></a>

        <a href="/Project_CuaHangMuBaoHiem_war/cancel_bill?id=<%=request.getAttribute("id_bill")%>"><button onclick="cancel()" id="delete_bill" style="background: red;font-weight: bold;margin-left: 47px;color: white ;border: 0;height: 50px; width: 180px">HỦY ĐƠN ĐẶT HÀNG</button></a>
    </div>
  </div>
</div>

<!-- Checkout End -->

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
<script>
  function cancel() {
    document.getElementById('delete_bill').style.backgroundColor = 'gray';
    document.getElementById('delete_bill').innerHTML = "ĐÃ HỦY"
  }
</script>
</body>

</html>
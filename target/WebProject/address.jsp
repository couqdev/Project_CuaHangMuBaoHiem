<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.model.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.api.ApiLogistic" %>
<%@ page import="vn.edu.hcmuaf.fit.api.Address" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.fit.controller.Add" %>
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
<%@include file="header.jsp" %>
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
<div class="container-fluid">
    <div class="row px-xl-5">
        <div class="col-lg-8">
            <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">ĐỊA CHỈ NHẬN HÀNG</span>
            </h5>
            <div class="bg-light p-30 mb-5">
                <% String selectedProvince = request.getParameter("province");
                    String selectDistrict = request.getParameter("district");
                    String selectWard = request.getParameter("ward");%>

                <% ApiLogistic api = new ApiLogistic();
                    List<Address> address = api.getAllProvince(); %>
                <% boolean res = false;
                    for (Address a : address) {
                        if (String.valueOf(a.getProvinceID()).equals(selectedProvince)) {
                            res = true;
                        }
                    }%>
                <% if (res == false) { %>
                <select name="province" class="pix_text" onchange="sendAddress()">
                    <option value="000">Chọn tỉnh thành</option>
                    <%for (Address a : address) {%>
                    <option value="<%= a.getProvinceID()%>"><%= a.getProvinceName()%>
                    </option>
                    <%}%>
                </select>
                <%}%>
                <% if (res == true) {
                    String name = "";
                    for (Address i : address) {
                        if (String.valueOf(i.getProvinceID()).equals(selectedProvince)) {
                            name = i.getProvinceName();
                        }
                    }%>
                <select name="province" class="pix_text" onchange="sendAddress()">
                    <option value="<%=selectedProvince%>"><%= name %>
                    </option>
                    <%for (Address a : address) {%>
                    <option value="<%= a.getProvinceID()%>"><%= a.getProvinceName()%>
                    </option>
                    <%}%>
                </select>
                <%}%>
                <% boolean res2 = false;
                    boolean res3 = false;
                    List<Address> district = new ArrayList<Address>();
                    if (res == true) {%>
                <%district = api.getAllDistrict(Integer.parseInt(selectedProvince));%>
                <% res2 = false;
                    for (Address d : district) {
                        if (String.valueOf(d.getDistrictID()).equals(selectDistrict)) {
                            res2 = true;
                        }
                    }%>
                <%if (res2 == false) {%>
                <select name="district" class="pix_text" style="width: 300px" onchange="sendAddressDis()">
                    <option value="000">Chọn quận huyện</option>
                    <%for (Address a : district) {%>
                    <option value="<%= a.getDistrictID()%>"><%= a.getDistrictName()%>
                    </option>
                    <%}%>
                </select>
                <%}%>
                <%
                    if (res2 == true) {
                        String name = "";
                        for (Address i : district) {
                            if (String.valueOf(i.getDistrictID()).equals(selectDistrict)) {
                                name = i.getDistrictName();
                            }
                        }
                %>
                <select name="district" class="pix_text" style="width: 300px" onchange="sendAddressDis()">
                    <option value="<%=selectDistrict%>"><%= name %>
                    </option>
                    <%for (Address a : district) {%>
                    <option value="<%= a.getDistrictID()%>"><%= a.getDistrictName()%>
                    </option>
                    <%}%>
                </select>

                <%}%>
                <%}%>
                <%
                    if (res2 == true) {%>
                <%List<Address> ward = api.getAllWard(Integer.parseInt(selectDistrict));%>
                <% res3 = false;
                    for (Address d : ward) {
                        if (String.valueOf(d.getWardCode()).equals(selectWard)) {
                            res3 = true;
                        }
                    }%>
                <%if (res3 == false) {%>
                <select name="ward" class="pix_text" style="width: 300px" onchange="sendAddressWard()">
                    <option value="000">Chọn phuong xa</option>
                    <%for (Address a : ward) {%>
                    <option value="<%= a.getWardCode()%>"><%= a.getWardName()%>
                    </option>
                    <%}%>
                </select>
                <%}%>
                <%
                    if (res3 == true) {
                        String name = "";
                        for (Address i : ward) {
                            if (String.valueOf(i.getWardCode()).equals(selectWard)) {
                                name = i.getWardName();
                            }
                        }
                %>
                <select name="ward" class="pix_text" style="width: 300px" onchange="sendAddressWard()">
                    <option value="<%=selectWard%>"><%= name %>
                    </option>
                    <%for (Address a : ward) {%>
                    <option value="<%= a.getWardCode()%>"><%= a.getWardName()%>
                    </option>
                    <%}%>
                </select>
                <%}%>
                <%}%>
                <%if(res3==true){%>
                <div class="bg-light p-30">
                    <a href="<%="/Project_CuaHangMuBaoHiem_war/checkout.jsp?province="+selectedProvince+"&district="+selectDistrict+"&ward="+selectWard%>"><input type="button" class="btn btn-block btn-primary font-weight-bold py-3" value="Tiếp theo" style="margin-left: 360px;width: 186px"></a>
                </div>
                <%}%>
            </div>

        </div>
        <div class="col-lg-4">
            <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">TỔNG ĐƠN HÀNG</span>
            </h5>
            <div class="bg-light p-30 mb-5">
                <div class="border-bottom">
                    <h6 class="mb-3">Các sản phẩm</h6>
                    <%NumberFormat nf = new NumberFormat();%>
                    <%for (Product p : cart.getListProduct()) {%>
                    <div class="d-flex justify-content-between">
                        <p><%=p.getName()%>
                        </p>
                        <p><%=nf.numberFormat(p.getPrice() * (1 - (long) p.getDiscount()))%>đ</p>
                    </div>
                    <%}%>
                </div>
                <div class="border-bottom pt-3 pb-2">
                    <div class="d-flex justify-content-between mb-3">
                        <h6>Tổng tiền hàng</h6>
                        <%
                            long price = 0;
                            for (Product p : cart.getListProduct()) {
                                price += p.getPrice() - p.getPrice() * p.getDiscount();
                            }%>
                        <h6><%=nf.numberFormat(price)%>đ</h6>
                    </div>
                </div>
                <div class="pt-2">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Checkout End -->

<!-- Footer Start -->
<%@include file="footer.jsp" %>
<!-- Footer End -->
<script>
    function sendAddress() {
        var selectedValue = document.getElementsByName("province")[0].value;
        window.location.href = 'AddressTransport?province=' + selectedValue;
    }

    function sendAddressDis() {
        var selectedValue = document.getElementsByName("province")[0].value;
        var selectedDistrict = document.getElementsByName("district")[0].value;
        window.location.href = 'AddressTransport?province=' + selectedValue + '&district=' + selectedDistrict;
    }

    function sendAddressWard() {
        var selectedValue = document.getElementsByName("province")[0].value;
        var selectedDistrict = document.getElementsByName("district")[0].value;
        var selectedWard = document.getElementsByName("ward")[0].value;
        window.location.href = 'AddressTransport?province=' + selectedValue + '&district=' + selectedDistrict + '&ward=' + selectedWard;
    }
</script>
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
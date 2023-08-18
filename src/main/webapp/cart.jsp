<%@ page import="vn.edu.hcmuaf.fit.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collection" %>
<%@ page import="vn.edu.hcmuaf.fit.model.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>HelmetsShop
    </title>
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
                    <a class="breadcrumb-item text-dark" href="index.jsp">Trang chủ</a>
                    <a class="breadcrumb-item text-dark" href="/Project_CuaHangMuBaoHiem_war/list-product">Sản phẩm</a>
                    <span class="breadcrumb-item active">Giỏ hàng</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->
    <!-- Cart Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Kích thước</th>
                            <th>Màu sắc</th>
                         <th>Giá tiền</th>
                            <th>Số lượng</th>
                            <th>Tổng tiền</th>
                            <th>Xóa</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        <% NumberFormat nf = new NumberFormat();
                            for(Product p: cart.getListProduct()){
                        %>
                        <tr>
                            <td class="align-middle"><a href="<%="/Project_CuaHangMuBaoHiem_war/detail?id=" +p.getId()%>" style="color: #6c757d;">
                                <div style="float: left"><img <%if(p.getImg().size()<=0){%>src="img/noimage.jpg" <%}else{%>src="<%= p.getImg().get(0).getImg() %>"<%}%> alt="" style="width: 50px"> <%= p.getName() %></div>
                            </a></td>
                            <td class="align-middle"><%=p.getDetail().get(0).getSize()%></td>
                            <td class="align-middle"><%=p.getDetail().get(0).getColor()%></td>
                            <td class="align-middle"><%=nf.numberFormat((long) (p.getPrice()-p.getPrice()*p.getDiscount()))%>đ</td>
                            <td class="align-middle">
                                <div class="input-group mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <form action="/Project_CuaHangMuBaoHiem_war/Minus" method="get">
                                            <input type="hidden" name="minus" value="<%= p.getKey() %>">
                                            <button type="submit" class="btn btn-sm btn-primary btn"> <i class="fa fa-minus"></i></button>
                                        </form>
                                    </div>
                                    <input type="text" class="form-control form-control-sm bg-secondary border-0 text-center " value="<%= p.getQuantity() %>">
                                    <div class="input-group-btn">
                                        <form method="get" action="/Project_CuaHangMuBaoHiem_war/Plus">
                                            <input type="hidden" name="plus" value="<%= p.getId() %>">
                                            <input type="hidden" name="size" value="<%= p.getDetail().get(0).getSize() %>">
                                            <input type="hidden" name="color" value="<%= p.getDetail().get(0).getColor() %>">
                                            <%if(p.getQuantity() >= p.getDetail().get(0).getQuantity()){%>
                                        <button class="btn btn-sm btn-primary btn-plus" disabled>
                                            <i class="fa fa-plus"></i>
                                        </button>
                                            <%}else{%>
                                            <button class="btn btn-sm btn-primary btn-plus">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                            <%}%>
                                        </form>
                                    </div>
                                </div>

                            </td>
                            <td class="align-middle"><%= nf.numberFormat((long) ((p.getPrice()-p.getPrice()*p.getDiscount())*p.getQuantity())) %>đ</td>
                            <td class="align-middle">
                                <form method="get" action="/Project_CuaHangMuBaoHiem_war/Delete">
                                <input type="hidden" name="delete" value="<%= p.getKey() %>">
                                    <input type="hidden" name="proName" value="<%= p.getName() %>">
                                <button class="btn btn-sm btn-danger" ><i class="fa fa-times"></i></button>
                            </form></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">

                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Giỏ hàng</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="border-bottom pb-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h6>Tổng tiền hàng</h6>
                            <h6><%=  nf.numberFormat(cart.getTotal()) %>đ</h6>
                        </div>
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Tổng thanh toán</h5>
                            <h5><%= nf.numberFormat(cart.getTotal()) %>đ</h5>
                        </div>
                        <a href="/Project_CuaHangMuBaoHiem_war/CheckCart" style="text-decoration: none"><button class="btn btn-block btn-primary font-weight-bold my-3 py-3">Tiến hành thanh toán</button></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart End -->

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
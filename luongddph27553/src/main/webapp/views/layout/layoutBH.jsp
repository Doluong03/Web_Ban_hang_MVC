<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 3/21/2023
  Time: 10:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>

</head>
<link rel="stylesheet"
      href="/css/bootstrap.min.css"/>
<body style="background-color: #F8FAFC">
<%--<nav class="navbar navbar-expand-lg bg-light">--%>
<%--    <div class="container-fluid">--%>
<%--        <a class="navbar-brand" href="#">IT17321</a>--%>
<%--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"--%>
<%--                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--            <span class="navbar-toggler-icon"></span>--%>
<%--        </button>--%>
<%--        <div class="collapse navbar-collapse" id="navbarNav">--%>
<%--            <ul class="navbar-nav">--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link active" aria-current="page" href="//">Trang chủ</a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="/khach-hang/index">Khách hàng</a>--%>
<%--                </li>--%>
<%--                <li class="nav-item">--%>
<%--                    <a class="nav-link" href="/san-pham/index">Sản phẩm</a>--%>
<%--                </li>--%>
<%--            </ul>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</nav>--%>
<header class="bg-light">
    <div class="container">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <button class="btn btn-outline-dark me-5" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions"
                    aria-controls="offcanvasWithBothOptions"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-ul" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm-3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2zm0 4a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
            </svg>
            </button>
            <a class="navbar-brand" href="#">Web bán hàng</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/muahang/trangchu">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/khach-hang/index">Blogs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/san-pham/index">Liên hệ</a>
                    </li>
                </ul>
                <%--                <form class="d-flex w-auto mt-1">--%>
                <%--                    <input class="form-control me-2" type="search" placeholder="Tìm kiếm" aria-label="Tìm kiếm">--%>
                <%--                    <button class="btn btn-outline-success w-50" type="submit">Tìm kiếm</button>--%>

                <%--                </form>--%>
                <%--                <li class="nav-item col-md-1 mt-2  ">--%>
                <%--                    <a class="nav-link text-decoration-none" href="/Login">Đăng nhập</a>--%>
                <%--                </li>--%>
                <div class="d-flex w-auto">
                    <form class="d-flex w-auto me-2 mt-1" method="get" action="/muahang/timkiem${tenSP}">
                        <input class="form-control me-2" name="tenSP" type="search" placeholder="Tìm kiếm " aria-label="Tìm kiếm">
                        <button class="btn btn-outline-success w-50" type="submit">Tìm kiếm</button>
                    </form>
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/login">Đăng nhập</a>
                        </li>
                    </ul>
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/muahang/lichsugd">Lịch sử</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
<div id="carouselExampleIndicators" class="carousel slide">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="/Anh/524_attimg1_origin.jpg" class="d-block w-100 h-50" alt="">
        </div>
        <div class="carousel-item">
            <img src="/Anh/523_attimg1_origin.jpg" class="d-block w-100 h-50" alt="">
        </div>
        <div class="carousel-item">
            <img src="/Anh/522_attimg1_origin.jpg" class="d-block w-100 h-50" alt="">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<%--menu Tab--%>

    <jsp:include page="${ view }"/>
</div>

<footer class="text-center text-lg-start text-white " style="background-color: #024137">
    <!-- Section: Social media -->
    <section class="d-flex justify-content-between pt-4 px-4 mx-4 fst-italic fs-1 "
             style="background-color: #024137">
        <!-- Left -->

        <!-- Left -->
    </section>
    <!-- Right -->
    <div class="row  mt-0">
        <div class="col-1 text-end offset-9" style="height: 50px;">
        </div>
        <div class=" text-start   col-2">
            © 2020 innisfree Inc. <br>
            All rights reserved.
        </div>
    </div>
    <div class="mx-5 ">
        <a href="" class="text-white fs-2 mx-5 me-4 text-decoration-none">
            <i class="fa-brands fa-facebook"></i>
        </a>
        <a href="" class="text-white me-4 fs-2 text-decoration-none">
            <i class="fa-brands fa-instagram"></i>
        </a>
        <a href="" class="text-white me-4 fs-2 text-decoration-none">
            <i class="fab fa-youtube"></i>
        </a>
        <a href="" class="text-white me-4 fs-2">
            <i class="fa-brands fa-github"></i> </a>

    </div>


    <!-- Right -->

    <!-- Section: Social media -->

    <!-- Section: Links  -->
    <section class="">
        <div class="mx-5 text-center text-md-start mt-5 ">
            <!-- Grid row -->
            <div class="row mt-3 mx-2">
                <!-- Grid column -->
                <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                    <!-- Content -->
                    <h6 class="text-uppercase fw-bold"><a href="#" class="text-decoration-none text-light">Chính
                        sách giao hàng và thanh toán </a></h6>
                    <hr class="mb-4 mt-0 d-inline-block mx-auto"
                        style="width: 60px; background-color: #7c4dff; height: 2px"/>

                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-3 col-lg-3 col-xl-3 mx-0 mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold"><a href="#" class="text-decoration-none text-light">Chính
                        sách bảo mật thông tin khách hàng</a></h6>
                    <hr class="mb-4 mt-0 d-inline-block mx-auto"
                        style="width: 60px; background-color: #7c4dff; height: 2px"/>

                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold "><a href="#" class="text-decoration-none text-light">Chính
                        sách mua hàng</a></h6>
                    <hr class="mb-4 mt-0 d-inline-block mx-auto"
                        style="width: 60px; background-color: #7c4dff; height: 2px"/>

                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                    <!-- Links -->
                    <h6 class="text-uppercase fw-bold"><a href="#" class="text-decoration-none text-light">Chính
                        sách trả hàng</a></h6>
                    <hr class="mb-4 mt-0 d-inline-block mx-auto"
                        style="width: 60px; background-color: #7c4dff; height: 2px"/>

                </div>
                <!-- Grid column -->
            </div>
            <!-- Grid row -->
            <div class="mx-5">
                <div>
                    Thời gian làm việc Thứ 2 ~ Thứ 6 09:00 ~ 17:00 (trừ Thứ 7, Chủ Nhật và ngày lễ)
                </div>
                <div>Tư vấn và chăm sóc khách hàng 028 3827 9777 (Ext: 125)</div>
                <div>Email cs_vn@innisfree.com</div>
                <br>
                <div>CÔNG TY TNHH AMOREPACIFIC VIỆT NAM</div>
                <div>GIẤY CNĐKDN: 0309984165 - Ngày cấp: 05/05/2010, được sửa đổi lần thứ 21, ngày 04/04/2022</div>
                <div>Cơ quan cấp: Phòng Đăng kí kinh doanh - Sở Kế hoạch và Đầu tư TP.HCM</div>
                <div>Địa chỉ đăng ký kinh doanh: Lầu 4A, Toà nhà Vincom, 72 Lê Thánh Tôn, Phường Bến Nghé, Quận 1,
                    Tp. Hồ Chí Minh, Việt Nam.
                </div>
            </div>
        </div>
        <br>
    </section>
    <!-- Section: Links  -->

    <!-- Copyright -->
    <!-- Copyright -->
</footer>
<!-- Footer -->
<script src="/js/jquery.min.js"/>
"></script>
<script src="/js/bootstrap.min.js"/>
"></script>
<%--<script src="/js/bootstrap.bundle.min.js" />"></script>--%>
<script src="/js/popper.js"/>
"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
        integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"></script>
</body>
</html>

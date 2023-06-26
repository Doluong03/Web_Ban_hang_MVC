<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản trị</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Custom styles */
        .container {
            padding-top: 60px;
        }

        .search-box {
            margin-bottom: 10px;
        }

        .notification-icon,
        .mail-icon {
            margin-right: 10px;
        }

        .admin-info {
            margin-bottom: 10px;
        }

        .admin-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #333;
            margin-right: 10px;
        }

        .admin-name {
            vertical-align: middle;
            line-height: 40px;
        }
    </style>
</head>
<body>
<div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions"
     aria-labelledby="offcanvasWithBothOptionsLabel">
    <div class="offcanvas-header row " style="background-color: #4D72DF;">
        <h5 class="offcanvas-title  " style="width: 0px;;margin-top: 60px; margin-left: 130px;border-bottom: white;color: white;" id="offcanvasWithBothOptionsLabel">MENU</h5>
        <div class="container col offset-1 " style="background-color: white;" >
            <div class="row  justify-content-end offset-1" >
                <div class="col row ">
                    <div class="search-box col-8 row">
                        <input type="text" class="form-control col" placeholder="Tìm kiếm"> <i class="fa fa-search col mt-2 "></i>
                    </div>

                </div>
                <div class="col-md-6" >
                    <div class="admin-info row justify-content-end " style="margin-left: 150px;">
                        <div class="notification-icon col-1 mt-2 "style="margin-left: 70px;">
                            <a href="#"><i class="fas fa-bell"></i></a>
                        </div>
                        <div class="mail-icon col-1 mt-2  " >
                            <a href="#"><i class="fas fa-envelope"></i></a>
                        </div>
                        <a  href="/logout" class="admin-name text-decoration-none text-dark  offset-1 col ">Đăng xuất</a>
                        <div class="admin-avatar col-1 " style="margin-right: 80px;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="offcanvas-body  " style="width: 288px;background-color: #4D72DF;">
            <div class="row" style="min-height: 500px;margin-left: 100px;">
                <div class=" ">
                    <div class="offcanvas-body" >
                        <nav id="sidebar">
                            <ul class="list-unstyled components mt-3">

                                <div class="dropdown">
                                    <a class="btn dropdown-toggle fw-bold fs-3 " style="color: white;" type="button"
                                       href="#" role="button" id="sanpham" data-toggle="collapse" data-target="#sp"
                                       aria-expanded="false" aria-controls="sp">
                                        Sản phẩm
                                    </a>
                                    <div class="collapse ms-3" id="sp">
                                        <ul class="list-unstyled">
                                            <li><a class=" text-decoration-none mt-2 fs-5" style="color: white;"
                                                   href="/sanpham/index">Sản phẩm</a></li>
                                            <li><a class=" text-decoration-none mt-2 fs-5" style="color: white;"
                                                   href="/chitietsp/index">Chi tiết sản phẩm</a></li>
                                            <li><a class=" text-decoration-none mt-2 fs-5" style="color: white;"
                                                   href="/dongsp/index">Dòng sản phẩm</a></li>
                                            <li><a class=" text-decoration-none mt-2 fs-5" style="color: white;"
                                                   href="/nsx/index">Nhà sản xuất</a></li>
                                            <li><a class=" text-decoration-none mt-2 fs-5" style="color: white;"
                                                   href="/mausac/index">Màu sắc</a></li>
                                        </ul>
                                    </div>
                                </div>

                                <hr>
                                <li class="mb-2 mt-5  fw-bold fs-3 ms-3 "><a class="text-decoration-none "
                                                                             style="color: white;margin-left: 15px"
                                                                             href="/khachhang/index">Khách hàng</a>
                                </li>
                                <hr>
                                <li class="mb-2 mt-5  fw-bold fs-3 ms-3 "><a class="text-decoration-none "
                                                                             style="color: white;margin-left: 15px"
                                                                             href="/hoadon/index">Hóa đơn</a>
                                </li>
                                <hr>
                                <li class="mb-2 mt-5  fw-bold fs-3 ms-3 "><a class="text-decoration-none "
                                                                             style="color: white;margin-left: 15px"
                                                                             href="/cuahang/index">Cửa hàng</a>
                                </li>
                                <hr>
                                <div class="dropdown">
                                    <a class="btn dropdown-toggle fw-bold fs-3 mt-4" style="color: white;" type="button"
                                       href="#" role="button" id="nhanVien" data-toggle="collapse" data-target="#nv"
                                       aria-expanded="false" aria-controls="nv">
                                        Nhân viên
                                    </a>

                                    <div class="collapse ms-3" id="nv">
                                        <ul class="list-unstyled">
                                            <li><a class=" text-decoration-none mt-2 fs-5" style="color: white;"
                                                   href="/nhanvien/index">Nhân viên</a></li>
                                            <li><a class=" text-decoration-none mt-2 fs-5" style="color: white;"
                                                   href="/chucvu/index">Chức vụ</a></li>

                                        </ul>
                                    </div>
                                </div>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

        <div class="bg-light col mt-3 mb-3 ">
            <jsp:include page="${ view_qt }" />
        </div>
    </div>

</div>
<!-- Main Content -->

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







<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-10 offset-1" style="background-color: #F8FAFC">
    <div style="display: flex;align-items: center" class="mt-5">
        <h1 class="offset-2 mb-2">Hóa đơn</h1>
        <div style="font-size: larger ; color: darkred" class="ms-5" id="msg"> <c:if test="${not empty error}"> ${error}</c:if></div>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Mã</th>
            <th scope="col">Khách hàng</th>
            <th scope="col">Nhân viên</th>
            <th scope="col">Ngày tạo  </th>
            <th scope="col">Ngày thanh toán </th>
            <th scope="col">Ngày Ship </th>
            <th scope="col">Ngày nhận </th>
            <th scope="col">Người nhận  </th>
            <th scope="col">SDT </th>
            <th scope="col">Địa chỉ  </th>
            <th scope="col">Tình trạng</th>
            <th colspan="2">Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ listHd }" var="hd" varStatus="loop">
            <tr>
                <td>${loop.index}</td>
                <td>${ hd.ma }</td>
                <td>${ hd.khachHang.ten }</td>
                <td>${ hd.nhanVien.ten }</td>
                <td><fmt:formatDate value="${ hd.ngayTao }" pattern="dd-MM-yyyy"/></td>
                <td><fmt:formatDate value="${ hd.ngayThanhToan }" pattern="dd-MM-yyyy"/></td>
                <td><fmt:formatDate value="${ hd.ngayShip }" pattern="dd-MM-yyyy"/></td>
                <td><fmt:formatDate value="${ hd.ngayNhan }" pattern="dd-MM-yyyy"/></td>
                <td>${ hd.tenNguoiNhan }</td>
                <td>${hd.sdt}</td>
                <td>${hd.diaChi}</td>
                <c:choose>
                    <c:when test="${hd.tinhTrang==0}">
                        <td>Chờ xác nhận</td>
                    </c:when>
                    <c:when test="${hd.tinhTrang==1}">
                        <td>Đang giao</td>
                    </c:when>
                    <c:when test="${hd.tinhTrang==2}">
                        <td>Đã nhận</td>
                    </c:when>
                    <c:otherwise>
                        <td>Đã hủy</td>
                    </c:otherwise>
                </c:choose>
                <td>
                    <a href="edit/${hd.id}" class="btn btn-primary">Cập nhật</a>
                </td>
                <td>
                    <a href="delete/${hd.id}" class="btn btn-danger">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="row mt-3">
        <div class="col-6">
            <a class="btn btn-primary" href="create">Thêm mới</a>
        </div>
        <div class="col-6"></div>
    </div>
</div>
</div>

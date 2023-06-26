<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-10 offset-1" style="background-color: #F8FAFC">
    <div style="display: flex;align-items: center" class="mt-5">
        <h1 class="offset-2 mb-2">Nhân viên</h1>
        <div style="font-size: larger ; color: darkred" class="ms-5" id="msg"> <c:if test="${not empty error}"> ${error}</c:if></div>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Mã</th>
            <th scope="col">Họ </th>
            <th scope="col">Tên đệm</th>
            <th scope="col">Tên</th>
            <th scope="col">Ngày sinh</th>
            <th scope="col">SDT</th>
            <th scope="col">Địa chỉ</th>
            <th scope="col">Mật khẩu</th>
            <th scope="col">Giới tính</th>
            <th scope="col">Trạng thái</th>
            <th scope="col">Cửa hàng</th>
            <th scope="col">Chức vụ</th>
            <th colspan="2">Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ listNv }" var="nv" varStatus="loop">
            <tr>
                <td>${loop.index}</td>
                <td>${ nv.ma }</td>
                <td>${ nv.ho }</td>
                <td>${ nv.tenDem }</td>
                <td>${ nv.ten }</td>
                <td><fmt:formatDate value="${ nv.ngaySinh }" pattern="yyyy-MM-dd"/></td>
                <td>${nv.sdt}</td>
                <td>${nv.diaChi}</td>
                <td>${nv.matKhau}</td>
                <td>${nv.gioiTinh}</td>
                <td>${nv.trangThai}</td>
                <td>${nv.cuaHang.ten}</td>
                <td>${nv.chucVu.ten}</td>
                <td>
                    <a href="edit/${nv.id}" class="btn btn-primary">Cập nhật</a>
                </td>
                <td>
                    <a href="delete/${nv.id}" class="btn btn-danger">Xóa</a>
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

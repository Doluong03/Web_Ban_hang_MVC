<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-10 offset-1" style="background-color: #F8FAFC">
    <div style="display: flex;align-items: center" class="mt-5">
        <h1 class="offset-2 mb-2">Khách hàng</h1>
        <div style="font-size: larger ; color: darkred" class="ms-5" id="msg"> <c:if test="${not empty error}"> ${error}</c:if></div>
    </div>
    <table class="table">
        <thead>
            <tr>
                <td scope="col"> STT</td>
                <td scope="col"> Mã</td>
                <td scope="col"> Họ</td>
                <td scope="col"> Tên đệm </td>
                <td scope="col"> Tên</td>
                <td scope="col"> Ngày sinh</td>
                <td scope="col"> SDT</td>
                <td scope="col"> Địa chỉ </td>
                <td scope="col"> Thành phố</td>
                <td scope="col"> Quốc gia</td>
                <td scope="col"> Mật khẩu</td>
                <td scope="col"> Thao tác</td>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${listKH}" var="kh" varStatus="loop">
            <tr>
                <td>${loop.index}</td>
                <td>${kh.ma}</td>
                <td>${kh.ho}</td>
                <td>${kh.tenDem}</td>
                <td>${kh.ten}</td>
                <td><fmt:formatDate value="${ kh.ngaySinh }" pattern="dd-MM-yyyy"/></td>
                <td>${kh.sdt}</td>
                <td>${kh.diaChi}</td>
                <td>${kh.thanhPho}</td>
                <td>${kh.quocGia}</td>
                <td>${kh.matKhau}</td>
                <td>
                    <a href="edit/${kh.id}" class="btn btn-primary">Cập nhật</a>
                </td>
                <td>
                    <a href="delete/${kh.id}" class="btn btn-danger">Xóa</a>
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

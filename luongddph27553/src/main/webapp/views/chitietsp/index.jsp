<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="col-10 offset-1" style="background-color: #F8FAFC">
    <div style="display: flex;align-items: center" class="mt-5">
        <h1 class="offset-2 mb-2">Chi tiết sản phẩm</h1>
        <div style="font-size: larger ; color: darkred" class="ms-5" id="msg"> <c:if test="${not empty error}"> ${error}</c:if></div>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Mã</th>
            <th scope="col">Sản phẩm </th>
            <th scope="col">NSX</th>
            <th scope="col">Dòng SP</th>
            <th scope="col">Màu Sắc</th>
            <th scope="col">Mô tả </th>
            <th scope="col">Năm BH</th>
            <th scope="col">Số lượng tồn</th>
            <th scope="col">Giá nhập</th>
            <th scope="col">Giá bán</th>
            <th colspan="2">Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${ listNv }" var="nv" varStatus="loop">
            <tr>
                <td>${ nv.ma }</td>
                <td>${ nv.sanPham.ten }</td>
                <td>${ nv.nsx.ten }</td>
                <td>${ nv.dongSP.ten}</td>
                <td>${ nv.mauSac.ten }</td>
                <td>${ nv.moTa }</td>
                <td>${ nv.namBh }</td>
                <td>${ nv.soLuongTon }</td>
                <td>${nv.giaNhap}</td>
                <td>${nv.giaBan}</td>
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
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <c:forEach begin="0" end="${ listMayTinh.totalPages -1}" varStatus="loop">
                <li class="page-item">
                    <a class="page-link" href="/chitietsp/index?page=${loop.begin + loop.count - 1}">
                            ${loop.begin + loop.count }
                    </a>
                </li>
            </c:forEach>
        </ul>
    </nav>
    <div class="row mt-3">
        <div class="col-6">
            <a class="btn btn-primary" href="create">Thêm mới</a>
        </div>
        <div class="col-6"></div>
    </div>
</div>
</div>

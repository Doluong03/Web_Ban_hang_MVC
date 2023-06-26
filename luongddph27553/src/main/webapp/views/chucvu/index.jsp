<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="col-10 offset-1" style="background-color: #F8FAFC">
    <div style="display: flex;align-items: center" class="mt-5">
        <h1 class="offset-2 mb-2">Chức vụ</h1>
        <div style="font-size: larger ; color: darkred" class="ms-5" id="msg"> <c:if test="${not empty error}"> ${error}</c:if></div>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Mã</th>
            <th scope="col">Tên</th>
            <th colspan="2">Thao tác</th>        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listCh}" var="ch" varStatus="loop">
            <tr>
                <td>${ loop.index}</td>
                <td>${ ch.ma }</td>
                <td>${ ch.ten }</td>
                <td>
                    <a href="edit/${ch.id}" class="btn btn-success">Cập nhật</a>
                </td>

                <td>
                    <a href="delete/${ch.id}" class="btn btn-danger">Xóa</a>
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

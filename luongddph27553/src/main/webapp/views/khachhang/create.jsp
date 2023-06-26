<%@ page language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="col-10 offset-2" style="background-color: #F8FAFC">
    <div class="col-8 offset-2">
        <sf:form method="post" action="${action}" modelAttribute="kh">
            <h1 class="offset-2"> Khách hàng </h1>
            <div class="row mt-3">
                <div class="col-6">
                    <label > Mã</label>
                    <sf:input path="ma" class="form-control" />
                    <span class="text-danger mt-3"> <sf:errors path="ma" readonly="${fn:contains(action, 'update')}"/></span>
                </div>  <div class="col-6">
                    <label > Họ</label>
                    <sf:input path="ho" class="form-control"/>
                    <span class="text-danger mt-3"> <sf:errors path="ho" /></span>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-6">
                    <label>Tên đệm</label>
                    <sf:input path="tenDem" class="form-control"/>
                    <span class="text-danger mt-3"> <sf:errors path="tenDem" class=""/></span>
                </div>
                <div class="col-6">
                    <label>Tên</label>
                    <sf:input path="ten" class="form-control"/>
                    <span class="text-danger mt-3"> <sf:errors path="ten" class=""/></span>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-6">
                    <label>Ngày sinh</label>
                    <sf:input type="date" path="ngaySinh"  class="form-control" />
                    <span class="text-danger mt-3"> <sf:errors path="ngaySinh" class=""/></span>
                </div>
                <div class="col-6">
                    <label>SDT</label>
                    <sf:input  path="sdt"  class="form-control" />
                    <span class="text-danger mt-3"> <sf:errors path="sdt" class=""/></span>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-6">
                    <label>Địa chỉ</label>
                    <sf:input path="diaChi" class="form-control"/>
                    <span class="text-danger mt-3"> <sf:errors path="diaChi" class=""/></span>
                </div>
                <div class="col-6">
                    <label>Mật khẩu</label>
                    <sf:input path="matKhau" class="form-control"/>
                    <span class="text-danger mt-3"> <sf:errors path="matKhau" class=""/></span>
                </div>
                </div>
            <div class="row mt-3">
            <div class="col-6">
                <label>Thành phố  </label>
                <sf:select path="thanhPho" class="form-select">
                    <option value="Hưng Yên">Hưng Yên</option>
                    <option value="Hà Nội">Hà Nội </option>
                </sf:select>
                </div>
                <div class="col-6">
                <label>Quốc Gia </label>
                <sf:select path="quocGia" class="form-select">
                    <option value="Việt Nam">Việt Nam</option>
                    <option value="Nước ngoài">Nước ngoài </option>
                </sf:select>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-6">
                    <button class="btn btn-primary" type="submit">
                        <c:if test="${action.contains('update')}">Cập nhật</c:if>
                        <c:if test="${action == 'store'}">Thêm mới</c:if>
                    </button>
                </div>
                <div class="col-6"></div>
            </div>
        </sf:form >
    </div>
    </div>

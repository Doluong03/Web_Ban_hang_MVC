<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="col-10 offset-2" style="background-color: #F8FAFC">
    <div class="col-8 offset-1">
        <sf:form method="post" action="${action}" modelAttribute="nv">
        <h1 class="offset-3"> Chi tiết sản phẩm</h1>
        <div class="row mt-3">
            <div class="col-6">
                <label>Cửa hàng </label>
                <sf:select path="sanPham" class="form-select">
                    <c:forEach items="${listCh}" var="ch">
                        <option value="${ch.id}"${nv2.sanPham.id == ch.id ? "selected" : "" }>${ch.ten}</option>
                    </c:forEach>
                </sf:select>
            </div>
            <div class="col-6">
                <label>Chức vụ </label>
                <sf:select path="nsx" class="form-select">
                    <c:forEach items="${listnsx}" var="cv">
                        <option value="${cv.id}"${nv2.nsx.id == cv.id ? "selected" : "" }>${cv.ten}</option>

                    </c:forEach>
                </sf:select>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-6">
                <label>Cửa hàng </label>
                <sf:select path="mauSac" class="form-select">
                    <c:forEach items="${listms}" var="ch">
                        <option value="${ch.id}"${nv2.mauSac.id == ch.id ? "selected" : "" }>${ch.ten}</option>
                    </c:forEach>
                </sf:select>
            </div>
            <div class="col-6">
                <label>Chức vụ </label>
                <sf:select path="dongSP" class="form-select">
                    <c:forEach items="${listCv}" var="cv">
                        <option value="${cv.id}"${nv2.dongSP.id == cv.id ? "selected" : "" }>${cv.ten}</option>

                    </c:forEach>
                </sf:select>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-6">
                <label>Mã</label>
                <sf:input path="ma" class="form-control" readonly="${fn:contains(action, 'update')}"/>
                <span class="text-danger mt-3"> <sf:errors path="ma" class=""/></span>
            </div>
            <div class="col-6">
                <label>Năm BH </label>
                <sf:input type="number" path="namBh" class="form-control"/>
                <span class="text-danger mt-3"> <sf:errors path="namBh" class=""/></span>

            </div>
        </div>
        <div class="row mt-3">
            <div class="col-6">
                <label>Mô tả </label>
                <sf:input path="moTa" class="form-control"/>
                <span class="text-danger mt-3"> <sf:errors path="moTa" class=""/></span>
            </div>
            <div class="col-6">
                <label>Số lượng tồn</label>
                <sf:input path="soLuongTon" class="form-control"/>
                <span class="text-danger mt-3"> <sf:errors path="soLuongTon" class=""/></span>
            </div>
        </div>
        <div class="row mt-3">

            <div class="col-6">
                <label>Giá nhập</label>
                <sf:input path="giaNhap" class="form-control"/>
                <span class="text-danger mt-3"> <sf:errors path="giaNhap" class=""/></span>
            </div>
            <div class="col-6">
                <label>Giá bán</label>
                <sf:input path="giaBan" class="form-control"/>
                <span class="text-danger mt-3"> <sf:errors path="giaBan" class=""/></span>
            </div>
        </div>
        <div class="row mt-3">

            <div class="col-6">
                <div class="input-group mb-3">
                        <%--                        <sf:input type="file" class="form-control" id="inputGroupFile02" path="anh" value="${nv2.anh}" />--%>
                    <sf:input type="file" class="form-control" id="inputGroupFile02" path="anh"/>
<%--                    <input type="text" class="form-control" value="${nv2.anh != null ? nv2.anh : ''}"/>--%>

                    <label class="input-group-text" for="inputGroupFile02">Upload</label>
                </div>

            </div>
            <div class="row mt-5">
                <div class="col ">
                    <button class="btn btn-primary" type="submit">
                        <c:if test="${action.contains('update')}">Cập nhật</c:if>
                        <c:if test="${action == 'store'}">Thêm mới</c:if>
                    </button>
                </div>
            </div>
            </sf:form>
        </div>
    </div>
    </div>

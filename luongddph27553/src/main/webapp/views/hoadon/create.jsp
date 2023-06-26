<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="col-10 offset-2" style="background-color: #F8FAFC">
    <div class="col-8 offset-2">
        <sf:form method="post" action="${action}" modelAttribute="nv">
        <h1 class="offset-2"> Hóa đơn</h1>
        <div class="row mt-3">
            <div class="col-6">
                <label>Khách hàng </label>
                <sf:select path="khachHang" class="form-select">
                    <c:forEach items="${listKh}" var="cv">
                        <option value="${cv.id}"${nv2.khachHang.id == cv.id ? "selected" : "" }>${cv.ten}</option>
                    </c:forEach>
                </sf:select>
            </div>
            <div class="col-6">
                <label>Nhân viên </label>
                <sf:select path="nhanVien" class="form-select">
                    <c:forEach items="${listNv}" var="nv1">
                        <option value="${nv1.id}"${nv2.nhanVien.id == nv1.id ? "selected" : "" }>${nv1.ten}</option>
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
                <label>Ngày tạo </label>
                <sf:input type="date" path="ngayTao" class="form-control"/>
                <span class="text-danger mt-3"> <sf:errors path="ngayTao" class=""/></span>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-6">
                <label>Ngày thanh toán </label>
                <sf:input type="date" path="ngayThanhToan" class="form-control"/>
                <span class="text-danger mt-3"> <sf:errors path="ngayThanhToan" class=""/></span>
            </div>
            <div class="col-6">
                <label>Ngày ship  </label>
                <sf:input type="date" path="ngayShip" class="form-control"/>
                <span class="text-danger mt-3"> <sf:errors path="ngayShip" class=""/></span>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-6">
                <label>Ngày nhận  </label>
                <sf:input type="date" path="ngayNhan" class="form-control"/>
                <span class="text-danger mt-3"> <sf:errors path="ngayNhan" class=""/></span>
            </div>
            <div class="col-6">
                <label>SDT</label>
                <sf:input path="sdt" class="form-control"/>
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
                <label>Tên người nhận</label>
                <sf:input path="tenNguoiNhan" class="form-control"/>
                <span class="text-danger mt-3"> <sf:errors path="tenNguoiNhan" class=""/></span>
            </div>
            <div class="row mt-3">
                <div class="col-6">
                    <label>Trạng thái </label>
                    <sf:select path="tinhTrang" class="form-select">
                        <option value=0>Chờ xác nhận</option>
                        <option value=1>Đang giao</option>
                        <option value=2>Đã giao</option>
                        <option value=3>Đã hủy</option>
                    </sf:select>

                </div>
<%--                <div class="col-6">--%>
<%--                    <label>Tổng tiền</label>--%>
<%--                    <sf:input path="tongTien" class="form-control"/>--%>
<%--                    <span class="text-danger mt-3"> <sf:errors path="tongTien" class=""/></span>--%>
<%--                </div>--%>
<%--            </div>--%>

                    <div class="col-8 offset-10  ">
                        <button class="btn btn-primary" type="submit">
                            <c:if test="${action.contains('update')}">Cập nhật</c:if>
                            <c:if test="${action == 'store'}">Thêm mới</c:if>
                        </button>
                    </div>
            </sf:form>
        </div>
    </div>
    </div>
    </div>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="col-10 offset-2" style="background-color: #F8FAFC">
    <div class="col-8 offset-2">
        <sf:form method="post" action="${action}" modelAttribute="nv">
            <h1 class="offset-2"> Nhân viên</h1>
            <div class="row mt-3">
                <div class="col-6">
                    <label>Mã</label>
                    <sf:input path="ma" class="form-control" readonly="${fn:contains(action, 'update')}"/>
                    <span class="text-danger mt-3"> <sf:errors path="ma" class=""/></span>
                </div>
                <div class="col-6">
                    <label>Họ</label>
                    <sf:input path="ho" class="form-control"/>
                    <span class="text-danger mt-3"> <sf:errors path="ho" class=""/></span>

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
                    <sf:input type="date" path="ngaySinh" class="form-control"/>
                    <span class="text-danger mt-3"> <sf:errors path="ngaySinh" class=""/></span>
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
                    <label>Mật khẩu</label>
                    <sf:input path="matKhau" class="form-control"/>
                    <span class="text-danger mt-3"> <sf:errors path="matKhau" class=""/></span>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-6 ">
                    <label>Giới tính </label>
                    <br>
                    <div class="form-check-inline mt-3">
                        <sf:radiobutton class="form-check-input" path="gioiTinh" id="flexRadioDefault1" value="Nam"/>
                        <label class="form-check-label" for="flexRadioDefault1">
                            Nam
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <sf:radiobutton class="form-check-input" path="gioiTinh" id="flexRadioDefault2" value="Nữ"/>
                        <label class="form-check-label" for="flexRadioDefault2">
                            Nữ
                        </label>
                    </div>
                    <br>
                    <span class="text-danger mt-3"> <sf:errors path="gioiTinh" class=""/></span>
                </div>
                <div class="col-6">
                    <label>Trạng thái </label>
                    <sf:select path="trangThai" class="form-select">
                        <option value=1>Hoạt động</option>
                        <option value=0>Không hoạt động</option>
                    </sf:select>

                </div>
            </div>
            <div class="row mt-3">
                <div class="col-6">
                    <label>Cửa hàng </label>
                    <sf:select path="cuaHang" class="form-select">
                        <c:forEach items="${listCh}" var="ch">
                            <option value="${ch.id}"${nv2.cuaHang.id == ch.id ? "selected" : "" }>${ch.ten}</option>
                        </c:forEach>
                    </sf:select>
                </div>
                <div class="col-6">
                    <label>Chức vụ </label>
                    <sf:select path="chucVu" class="form-select">
                        <c:forEach items="${listCv}" var="cv">
                            <option value="${cv.id}"${nv2.chucVu.id == cv.id ? "selected" : "" }>${cv.ten}</option>

                        </c:forEach>
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
        </sf:form>
    </div>
</div>

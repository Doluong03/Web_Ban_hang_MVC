<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 3/21/2023
  Time: 8:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<div class="col-11  mt-5 mx-5 table-responsive">
    <sf:form method="POST"
          action="chitiet/${hd.id}" modelAttribute="hd">
        <h1 class="offset-4"> Thanh toán</h1>
        <div class="row">
            <div class=" col">
                <div class="col-8">
                    <label>Họ và tên khách hàng</label>
                    <sf:input type="text" path="khachHang" class="form-control" disabled="true" value="${hd.khachHang.ten}"/>
                </div>
                <div class="col-8">
                    <label>Ngày tạo </label>
                    <sf:input type="text" path="ngayTao" class="form-control" disabled="true"  />
                </div>
                <div class="col-8">
                    <label>Ngày thanh toán </label>
                    <sf:input type="text" path="ngayThanhToan" class="form-control" disabled="true"  />
                </div>
                <div class="col-8">
                    <label>Ngày ship  </label>
                    <sf:input type="text" path="ngayShip" class="form-control" disabled="true"  />
                </div>
                <div class="col-8">
                    <label>Ngày nhận  </label>
                    <sf:input  type="text" path="ngayNhan" class="form-control" disabled="true"  />
                </div>
                <div class="col-8">
                    <label>Tình trạng </label>
                    <sf:select path="tinhTrang" disabled="true" class="form-control">
                        <sf:option value="0" label="Chờ xác nhận" />
                        <sf:option value="1" label="Đang giao" />
                        <sf:option value="2" label="Đã nhận" />
                        <sf:option value="3" label="Đã hủy" />
                    </sf:select>


                </div>
                <div class="col-8">
                    <label>Họ và tên người nhận</label>
                    <sf:input type="text" path="tenNguoiNhan" class="form-control" disabled="true" />
                </div>
                <div class="col-8">
                    <label>Số điện thoại</label>
                    <sf:input type="tel" path="sdt" class="form-control" disabled="true" />
                </div>
                <div class="col-8">
                    <label>Địa chỉ</label>
                    <sf:input type="text" path="diaChi" class="form-control" disabled="true" />
                </div>
                <div class="col-8">
                    <label>Tổng tiền</label>
                    <sf:input type="text" path="tongTien" class="form-control" disabled="true" />
                </div>
                <div class="col-8">
                    <label>Hình thúc thanh toán</label>
                    <select  class="form-select" disabled>
                        <option  value="1"> Thanh toán khi nhận hàng</option>
                    </select>
                </div>
            </div>
            <%--        left--%>
            <div class="col table">
                <div><h4>Sản phẩm đã mua</h4>
                    <hr>
                </div>
                <table>
                    <c:set var="ma_hd" value=""/>
                    <c:set var="total" value="0"/>
                    <c:forEach items="${listHd}" var="ct">
                        <tr>
                            <td class="row"><img style="width: 100px ; height: 100px"
                                                 src="/Anh/${ct.chiTietSP.anh}" alt="${ct.chiTietSP.moTa}">
                                <p class="col pt-5 pe-5" style="padding-top: 150px">${ ct.chiTietSP.moTa }</p>
                                <br>
                                <p class="pt-5 col"> Số lượng: ${ ct.soLuong}</p>
                            </td>
                                <%--                    <td class="pt-5" style="xpadding-top: 100p">${ ct.soLuong}</td>--%>
                            <td id="totalPrice" class="pt-2 ps-5">${ct.tongTien}</td>
                        </tr>
                        <c:set var="ma_hd" value="${ct.hoaDon.ma}"/>
                        <c:set var="total" value="${total + ct.tongTien}"/>
                    </c:forEach>
                </table>
            </div>
            <%--                right--%>
        </div>
        <div class="row mt-3">
            <div class="col-2">
                <button class="btn btn-primary">Trang chủ</button>
            </div>
            <div class="col-8"></div>
        </div>
    </sf:form>
</div>
<script src="/BaiTap_war/js/bootstrap.min.js"></script>

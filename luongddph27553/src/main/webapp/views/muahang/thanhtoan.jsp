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
<div class="col-10 offset-2" style="background-color: #F8FAFC">
<div class="col-10 ">
<sf:form method="post" action="thanhtoan?ma=${hd.ma}" modelAttribute="hd">
    <h1 class="offset-4"> Thanh toán </h1>
    <div class=" row">
    <div class=" col">
    <div class="col-6">
    <label>Họ và tên người nhận</label>
    <sf:input type="text" path="tenNguoiNhan" class="form-control" value="${hd.tenNguoiNhan}"/>
    </div>
    <div class="col-6">
    <label>Số điện thoại</label>
    <sf:input type="tel" path="sdt" class="form-control" value="${hd.sdt}"/>
    </div>
    <div class="col-6">
    <label>Địa chỉ</label>
    <sf:input type="text" path="diaChi" class="form-control" value="${hd.diaChi}"/>
    </div>
    <div class="col-6">
    <label>Tổng tiền</label>
    <sf:input type="text" path="tongTien" class="form-control" value="${hd.tongTien}"/>
    </div>
    <div class="col-6">
    <label>Hình thúc thanh toán</label>
    <select path="" class="form-select">
    <option value="1"> Thanh toán khi nhận hàng</option>
    </select>
    </div>
    </div>
    <div class="col table ms-5">
    <div><h4>Sản phẩm đã mua</h4>
    <hr>
    </div>
    <table>
    <c:set var="ma_hd" value=""/>
    <c:set var="total" value="0"/>
    <c:forEach items="${listCt2}" var="ct">
        <tr>
            <td class="row"><img style="width: 100px ; height: 100px"
                                 src="/BaiTap_war/Anh/${ct.chiTietSP.anh}" alt="${ct.chiTietSP.moTa}">
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
    </div>
    <%--        right--%>
    </div>
    </div>
    <div class="row mt-3">
    <div class="col-2">
    <a class="text-decoration-none" href="giohang" ><< Giỏ hàng</a>
    </div>
    <div class="col-2">
    <button class="btn btn-primary">Thanh toán</button>
    </div>
    <div class="col-6"></div>
    </div>
    </div>
</sf:form>
    <script src="/BaiTap_war/js/bootstrap.min.js"></script>
    <script src="/BaiTap_war/js/bootstrap.min.js"></script>
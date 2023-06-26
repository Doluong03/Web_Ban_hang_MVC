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
<div class="col-10 offset-2" style="background-color: #F8FAFC">
    <body >
    <di v>
        <h1 class="offset-5 mb-5">Giỏ hàng</h1>
    <c:if test="${ f:length(listCt2) == 0 }">
    <img class="offset-3" src="../Anh/empty_cart.png">
    <div>
        <a class="btn btn-outline-danger btn-sm offset-5 px-5 mb-5" href="trangchu">Mua ngay</a>
    </div>

    </c:if>
    <c:if test="${ f:length(listCt2) != 0 }" var="ma">
    <table class="table">
        <thead>
        <tr>
            <th scope="col" >Thông tin sản phẩm</th>
            <th scope="col">Số lượng</th>
            <th scope="col">Thành tiền</th>
            <th colspan="2">Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <tbody>
        <c:set var="ma_hd" value=""/>
        <c:set var="total" value="0"/>
        <c:forEach items="${listCt2}" var="ct">
            <tr>
                <td class="row"><img style="width: 200px ; height: 180px" src="/Anh/${ct.chiTietSP.anh}" alt="${ct.chiTietSP.sanPham.ten}"> <p class="col pt-5" style="padding-top: 150px" >${ ct.chiTietSP.sanPham.ten }</p></td>
                    <%--                <td style="padding: 10px">${ ct.chiTietSP.sanPham.ten }</td>--%>
<%--                <td class="pt-5" style="xpadding-top: 100p">${ ct.soLuong}</td>--%>
                <td>
                    <div class="input-group w-50 mt-5">
                        <a type="button" class="btn btn-minus" href="decrementValue/${ct.chiTietSP.id}/${ct.hoaDon.id}">-</a>
                        <input type="number" id="quantity_${ct.chiTietSP.id}" name="quantity" class="form-control input-number" style="width: 1px" value="${ct.soLuong}" min="1" max="${ct.chiTietSP.soLuongTon}">
                        <a type="button" class="btn btn-plus" href="incrementValue/${ct.chiTietSP.id}/${ct.hoaDon.id}" >+</a>
                    </div>
                </td>
                <td  class="pt-5">${ct.tongTien}</td>

                <td class="pt-5">
                    <a href="deleteSP/${ct.chiTietSP.id}" class="btn btn-primary">remove</a>
                </td>
            </tr>
            <c:set var="ma_hd" value="${ct.hoaDon.ma}"/>
            <c:set var="total" value="${total + ct.tongTien}"/>
        </c:forEach>
        </tbody>
        </tbody>
    </table>
    <div class="row mb-5">
        <a class="btn btn-primary btn-sm col-3 offset-2" href="trangchu">Tiếp tục mua hàng</a>
        <a class="btn btn-primary btn-sm col-3 offset-2"
           href="editThanhtoan?ma=${ma_hd}&total=${total}">Thanh toán</a>
    </div>
    </c:if>
</div>
<script src="/BaiTap_war/js/bootstrap.min.js"></script>
<script>
    function updateQuantity(productId, quantity) {
        $.ajax({
            url: "/updateQuantity",
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({ productId: productId, quantity: quantity }),
            success: function(response) {
                // Cập nhật số lượng sản phẩm trên trang bằng JavaScript
                var quantityElement = document.getElementById('quantity');
                quantityElement.value = response.quantity;

                // Cập nhật tổng tiền trên trang bằng JavaScript
                var totalPriceElement = document.getElementById('totalPrice');
                totalPriceElement.textContent = response.totalPrice;
            },
            error: function(xhr, status, error) {
                // Xử lý lỗi nếu có
                console.error(error);
            }
        });
    }

    function incrementValue(ctid, hdid) {
        // Gửi yêu cầu AJAX tới máy chủ
        $.ajax({
            type: 'GET',
            url: '/incrementValue/' + ctid + '/' + hdid,
            success: function(data) {
                // Cập nhật dữ liệu trong trang
                $('#totalPrice').text(data.totalPrice);
                $('#quantity_' + ctid).val(data.quantity);
            },
            error: function() {
                // Xử lý lỗi (nếu có)
            }
        });
    }

    function decrementValue(ctid, hdid) {
        $.ajax({
            type: 'GET',
            url: '/incrementValue/' + ctid + '/' + hdid,
            success: function(data) {
                // Cập nhật dữ liệu trong trang
                $('#totalPrice').text(data.totalPrice);
                $('#quantity_' + ctid).val(data.quantity);
            },
            error: function() {
                // Xử lý lỗi (nếu có)
            }
        });
    }
</script>
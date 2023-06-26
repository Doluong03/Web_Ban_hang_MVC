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

<div class="col-10 offset-1" style="background-color: #F8FAFC" >
    <div class="row  mt-5 offset-1  " >
        <div class="col-6 me-1 "style=" background-color: white">
            <img id="main_product_image" src="/Anh/${ct.anh}" alt="${ct.sanPham.ten}" alt="" style="width: 450px; height: 450px">
        </div>
        <!-- left -->
        <div class="ms-3 col  " style="height: 500px; background-color: white">
            <h2 class="fw-bold ">
               ${ct.moTa}
            </h2>
            <div class="text-dark ms-2 mb-2">
                164 Đánh Giá | 1,1k Đã Bán
            </div>
            <h3 class=" mb-5 ms-3">
                <div class="text-danger ">
                    <fmt:formatNumber type="number" value="${ct.giaBan}" pattern="#,##0 ₫" />
                </div>
            </h3>
            <h5 class=" mb-5 ms-2 row fw-light  " style="font-size: 18px">
               <p class="col-2 text-secondary "> Bảo Hiểm </p>
                <p class="col text-dark">Bảo hiểm Quyền lợi tiêu dùng   </pcol-1>
                    <p class="col text-primary">Tìm hiểu thêm </p>
            </h5>
            <h5 class=" mb-5 ms-2 row fw-light  " style="font-size: 18px">
               <p class="col-2 text-secondary "> Vận Chuyển </p>
                <p class="col text-dark">Miễn phí vận chuyển  </p>
            </h5>

            <div>
                <div class="row mb-4 d-flex  align-items-center">
                    <p class="col-2 ms-3">Số lượng</p>
                    <div class="col-4  d-flex ">
                        <button class="btn btn-minus  text-light col-3 fs-5 " style="background-color: #F35D00" onclick="decrementValue()">-</button>
                        <input id="form1" min="1" name="quantity" value="1" type="number" max="${ct.soLuongTon}"
                               class="form-control form-control-sm col-1 w-50" style="width: 50px"/>

                        <button class="btn btn-plus text-light col-3 fs-5 "  style="background-color: #F35D00" onclick="incrementValue()">+</button>
                    </div>
                    <div class="col-3 ms-2 text-dark    ">
                        <span> ${ct.soLuongTon} sản phẩm có sẵn </span>
                    </div>
<%--                    <div class="input-group">--%>
<%--                        <button type="button" class="btn btn-minus">-</button>--%>
<%--                        <input type="number" id="quantity" name="quantity" class="form-control input-number "--%>
<%--                               style="width: 5px" value="1" min="1" max="${ct.chiTietSP.soLuongTon}">--%>
<%--                        <button type="button" class="btn btn-plus">+</button>--%>

<%--                    </div>--%>

                </div>

                <script>
                    function decrementValue() {
                        var input = document.getElementById("form1");
                        var value = parseInt(input.value);
                        if (value > 0) {
                            value--;
                        }
                        input.value = value;
                        <c:set var="quantity" value="${value}" />
                    }

                    function incrementValue() {
                        var input = document.getElementById("form1");
                        var value = parseInt(input.value);
                        var max = parseInt(input.max);
                        if (value < max) {
                            value++;
                        }
                        input.value = value;
                        <c:set var="quantity" value="${value}" />
                    }
                    function addToCart() {
                        var input = document.getElementById("form1");
                        var quantity = input.value;
                        var productId = "${ct.id}";
                        var url = "/muahang/edit/" + productId + "/" + quantity;
                        window.location.href = url;
                    }
                </script>
                <div class="col-5  text-danger">
                    <a onclick="addToCart()"  class="btn text-light text-center " style="width: 250px; margin-left: 20px; background-color: #F35D00">Thêm vào giỏ hàng </a>
                </div>
            </div>
        </div>
        </div>
        </div>
    <div class="row  mt-3 " style="background-color: white; margin-left:283px;width: 1425px  ">
        <div class="col">
            <div class="nav nav-tabs" id="myTab" role="tablist">
                <a class="nav-link active" id="description-tab" data-bs-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">Mô tả</a>
                <a class="nav-link" id="info-tab" data-bs-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="false">Thông tin</a>
                <a class="nav-link" id="review-tab" data-bs-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">Đánh giá</a>
            </div>
            <div class="col-8">
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                        <h4>Mô tả sản phẩm</h4>
                        <p>Giúp bồi bổ sức khoẻ, bổ sung năng lượng giúp phát triển cơ thể - tăng cân, giúp cho người suy nhược cơ thể, bệnh nhân trước và sau phẫu thuật.
                             Công dụng chính:
                            - CẢI THIỆN GIẤC NGỦ & DỄ TIÊU HÓA
                            Đột phá với đạm Lactium chiết xuất từ sữa, giúp ngủ ngon, giảm mệt mỏi. Giàu chất xơ hòa tan (FOS) & không đường Lactose giúp dễ tiêu hóa.
                            - TỐT CHO CƠ - XƯƠNG
                            Đạm chất lượng cao HMB cùng Arginine, BCAA giúp tăng cường hệ cơ, phục hồi nhanh sức khỏe sau ốm.
                            Thêm 50% Canxi, cùng vitamin D3, Magie, Phốt pho giúp phòng chống loãng xương, tăng cường vận động.
                            - TỐT CHO TIM MẠCH
                            Giàu chất béo không no nguồn gốc thực vật MUFA, PUFA & không chứa Cholesterol giúp giảm tình trạng xơ vữa động mạch, tốt cho tim mạch.
                            - TĂNG CƯỜNG MIỄN DỊCH
                            Nguồn dinh dưỡng cân đối với 27 vitamin & khoáng chất, cùng hệ Antioxidants (A, C, E & Selen) giúp tăng cường miễn dịch, phục hồi sức khỏe.

                        </p>
                    </div>
                    <div class="tab-pane fade" id="info" role="tabpanel" aria-labelledby="info-tab">
                        <h4>Thông tin sản phẩm</h4>
                        <p> Đối tượng sử dụng:</p>
                            <p> - Người lớn & trẻ trên 10 tuổi có nhu cầu bổ sung năng lượng cao, phát triển cơ thể, tăng cân </p>
                            <p> - Người già, người suy nhược cơ thể, bệnh nhân trước và sau phẫu thuật cần #bồi #bổ dinh dưỡng hoặc năng lượng.</p>
                            <p> - Người cao tuổi #tiêu #hóa kém & khó nhai nuốt</p>
                            <p> - Sản phẩm không chứa đường #Lactose, người bị bất dung nạp với Lactose vẫn có thể sử dụng được sản phẩm Nutricare Gold</p>
                            <p> - Nutricare Gold có thể sử dụng qua sonde</p>
                    </div>
                    <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
                        <h4>Đánh giá sản phẩm</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis ultrices arcu. Sed id lectus sagittis, tincidunt odio et, pulvinar neque.</p>
                    </div>
                    </div>
                    </div>
        </div>
    </div>

        <div class="text-center m-5 ">
            <h2 class="fw-bold">Các sản phẩm tương tự </h2>
        </div>
        <div class="row  col-11  mb-5 mt-5 ms-5 " ng-controller="MyController" style="background-color: #F8FAFC">
            <div class=" text-center px-5 border-0 row offset-1" >
                <c:forEach var="sp" items="${listCt}">
                    <c:if test="${sp.giaBan<400000}">
                        <div class="col-sm-2 ms-4 mb-3 border border-success">
                            <div class="product">
                                <a href="/muahang/detail/${sp.id}">
                                <img src="/Anh/${sp.anh}" alt="${sp.sanPham.ten}">
                                </a>
                                <h5>${sp.sanPham.ten}</h5>
                                <p class="">${sp.moTa}</p>
<%--                                <a href="edit/${sp.id}" class="btn btn-outline-primary mt-1">Thêm vào giỏ hàng</a>--%>
                            </div>
                            <div class="text-danger fw-bolder">
                                <fmt:formatNumber type="number" value="${sp.giaBan}" pattern="#,##0 ₫" />
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            </div>

            <script>
                function changeImage(element) {
                    var main_prodcut_image = document.getElementById('main_product_image');
                    main_prodcut_image.src = element.src;
                }
            </script>
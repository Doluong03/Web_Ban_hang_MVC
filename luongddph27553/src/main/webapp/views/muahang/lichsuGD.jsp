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
<div class="col-11  mt-5 mx-5 table-responsive">
    <div>
        <h1 class="offset-4 mb-5">Hóa đơn </h1>
    </div>
    <div class="row  mt-3 " style="background-color: white; margin-left:250px;width: 1425px  ">
        <div class="col">
            <div class="nav nav-tabs" id="myTab" role="tablist">
                <a class="nav-link active" id="description-tab" data-bs-toggle="tab" href="#description" role="tab"
                   aria-controls="description" aria-selected="true">Chờ xác nhận</a>
                <a class="nav-link" id="info-tab" data-bs-toggle="tab" href="#info" role="tab" aria-controls="info"
                   aria-selected="false">Đang giao</a>
                <a class="nav-link" id="dn-tab" data-bs-toggle="tab" href="#dn" role="tab" aria-controls="dn"
                   aria-selected="false">Đã nhận</a>
                <a class="nav-link" id="review-tab" data-bs-toggle="tab" href="#review" role="tab"
                   aria-controls="review" aria-selected="false">Đã hủy</a>
            </div>
            <div class="col">
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="description" role="tabpanel"
                         aria-labelledby="description-tab">
                        <c:if test="${ f:length(listHd) == 0 }">
                            <h3>Không có dữ liệu</h3>
                        </c:if>
                        <c:if test="${ f:length(listHd) != 0 }">

                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">Mã</th>
                                    <th scope="col">Khách hàng</th>
                                    <th scope="col">Nhân viên</th>
                                    <th scope="col">Ngày tạo</th>
                                    <th scope="col">Ngày thanh toán</th>
                                    <th scope="col">Ngày Ship</th>
                                    <th scope="col">Ngày nhận</th>
                                    <th scope="col">Người nhận</th>
                                    <th scope="col">SDT</th>
                                    <th scope="col">Địa chỉ</th>
                                    <th scope="col">Tình trạng</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${listHd}" var="hd">
                                    <c:if test="${hd.tinhTrang==0}">
                                        <tr>
                                            <td>${ hd.ma }</td>
                                            <td>${ hd.khachHang.ten }</td>
                                            <td>${ hd.nhanVien.ten }</td>
                                            <td><fmt:formatDate value="${ hd.ngayTao }" pattern="dd/MM/yyyy"/></td>
                                            <td><fmt:formatDate value="${ hd.ngayThanhToan }"
                                                                pattern="dd/MM/yyyy"/></td>
                                            <td><fmt:formatDate value="${ hd.ngayShip }" pattern="dd/MM/yyyy"/></td>
                                            <td><fmt:formatDate value="${ hd.ngayNhan }" pattern="dd/MM/yyyy"/></td>
                                            <td>${ hd.tenNguoiNhan }</td>
                                            <td>${hd.sdt}</td>
                                            <td>${hd.diaChi}</td>
                                            <c:choose>
                                                <c:when test="${hd.tinhTrang==0}">
                                                    <td>Chờ xác nhận</td>
                                                </c:when>
                                                <c:when test="${hd.tinhTrang==1}">
                                                    <td>Đang giao</td>
                                                </c:when>
                                                <c:when test="${hd.tinhTrang==2}">
                                                    <td>Đã nhận</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>Đã hủy</td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td><a type="button" class="btn btn-outline-primary"
                                                   href="chitiet/${hd.id}">
                                                Xem chi tiết
                                            </a></td>
                                            <td><a type="button" class="btn btn-outline-primary"
                                                   data-bs-toggle="modal" data-bs-target="#cancelOrderModal"  >
                                                Yêu cầu hủy
                                            </a></td>
                                        </tr>
                                    </c:if>
                                    <div class="modal fade" id="cancelOrderModal" tabindex="-1" aria-labelledby="cancelOrderModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="cancelOrderModalLabel">Chọn lý do hủy đơn hàng</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <div class="mb-3">
                                                            <label for="cancelReason" class="form-label">Lý do:</label>
                                                            <select class="form-select" id="cancelReason" name="cancelReason">
                                                                <option value="1">Không hài lòng với sản phẩm</option>
                                                                <option value="2">Thay đổi kế hoạch</option>
                                                                <option value="3">Khác</option>
                                                            </select>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="cancelComment" class="form-label">Bình luận:</label>
                                                            <textarea class="form-control" id="cancelComment" name="cancelComment" rows="3"></textarea>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                                    <a   class="btn btn-primary" href="updateTT/${hd.id}/3">Hủy đơn hàng</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                    </div>
                    <div class="tab-pane fade" id="info" role="tabpanel" aria-labelledby="info-tab">
                        <c:if test="${ f:length(listHd) == 0 }">
                            <h3>Không có dữ liệu</h3>
                        </c:if>
                        <c:if test="${ f:length(listHd) != 0 }">

                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">Mã</th>
                                    <th scope="col">Khách hàng</th>
                                    <th scope="col">Nhân viên</th>
                                    <th scope="col">Ngày tạo</th>
                                    <th scope="col">Ngày thanh toán</th>
                                    <th scope="col">Ngày Ship</th>
                                    <th scope="col">Ngày nhận</th>
                                    <th scope="col">Người nhận</th>
                                    <th scope="col">SDT</th>
                                    <th scope="col">Địa chỉ</th>
                                    <th scope="col">Tình trạng</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${listHd}" var="hd">
                                    <c:if test="${hd.tinhTrang==1}">
                                        <tr>
                                            <td>${ hd.ma }</td>
                                            <td>${ hd.khachHang.ten }</td>
                                            <td>${ hd.nhanVien.ten }</td>
                                            <td><fmt:formatDate value="${ hd.ngayTao }" pattern="dd/MM/yyyy"/></td>
                                            <td><fmt:formatDate value="${ hd.ngayThanhToan }"
                                                                pattern="dd/MM/yyyy"/></td>
                                            <td><fmt:formatDate value="${ hd.ngayShip }" pattern="dd/MM/yyyy"/></td>
                                            <td><fmt:formatDate value="${ hd.ngayNhan }" pattern="dd/MM/yyyy"/></td>
                                            <td>${ hd.tenNguoiNhan }</td>
                                            <td>${hd.sdt}</td>
                                            <td>${hd.diaChi}</td>
                                            <c:choose>
                                                <c:when test="${hd.tinhTrang==0}">
                                                    <td>Chờ xác nhận</td>
                                                </c:when>
                                                <c:when test="${hd.tinhTrang==1}">
                                                    <td>Đang giao</td>
                                                </c:when>
                                                <c:when test="${hd.tinhTrang==2}">
                                                    <td>Đã nhận</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>Đã hủy</td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td><a type="button" class="btn btn-outline-primary"
                                                   href="chitiet/${hd.id}">
                                                Xem chi tiết
                                            </a></td>
                                            <td><a type="button" class="btn btn-outline-primary"
                                                   href="updateTT/${hd.id}/2">
                                                Đã nhận được hàng
                                            </a></td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>

                    </div>
                    <div class="tab-pane fade" id="dn" role="tabpanel" aria-labelledby="dn-tab">
                        <c:if test="${ f:length(listHd) == 0 }">
                            <h3>Không có dữ liệu</h3>
                        </c:if>
                        <c:if test="${ f:length(listHd) != 0 }">

                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">Mã</th>
                                    <th scope="col">Khách hàng</th>
                                    <th scope="col">Nhân viên</th>
                                    <th scope="col">Ngày tạo</th>
                                    <th scope="col">Ngày thanh toán</th>
                                    <th scope="col">Ngày Ship</th>
                                    <th scope="col">Ngày nhận</th>
                                    <th scope="col">Người nhận</th>
                                    <th scope="col">SDT</th>
                                    <th scope="col">Địa chỉ</th>
                                    <th scope="col">Tình trạng</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${listHd}" var="hd">
                                    <c:if test="${hd.tinhTrang==2}">
                                        <tr>
                                            <td>${ hd.ma }</td>
                                            <td>${ hd.khachHang.ten }</td>
                                            <td>${ hd.nhanVien.ten }</td>
                                            <td><fmt:formatDate value="${ hd.ngayTao }" pattern="dd/MM/yyyy"/></td>
                                            <td><fmt:formatDate value="${ hd.ngayThanhToan }" pattern="dd/MM/yyyy"/></td>
                                            <td><fmt:formatDate value="${ hd.ngayShip }" pattern="dd/MM/yyyy"/></td>
                                            <td><fmt:formatDate value="${ hd.ngayNhan }" pattern="dd/MM/yyyy"/></td>
                                            <td>${ hd.tenNguoiNhan }</td>
                                            <td>${hd.sdt}</td>
                                            <td>${hd.diaChi}</td>
                                            <c:choose>
                                                <c:when test="${hd.tinhTrang==0}">
                                                    <td>Chờ xác nhận</td>
                                                </c:when>
                                                <c:when test="${hd.tinhTrang==1}">
                                                    <td>Đang giao</td>
                                                </c:when>
                                                <c:when test="${hd.tinhTrang==2}">
                                                    <td>Đã nhận</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>Đã hủy</td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td><a type="button" class="btn btn-outline-primary"
                                                   href="chitiet/${hd.id}">
                                                Xem chi tiết
                                            </a></td>
<%--                                            <td><a type="button" class="btn btn-outline-primary"--%>
<%--                                                   href="chitiet/${hd.id}">--%>
<%--                                                Xem chi tiết--%>
<%--                                            </a></td>--%>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>

                    </div>
                    <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
                        <c:if test="${ f:length(listHd) == 0 }">
                            <h3>Không có dữ liệu</h3>
                        </c:if>
                        <c:if test="${ f:length(listHd) != 0 }">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th scope="col">Mã</th>
                                    <th scope="col">Khách hàng</th>
                                    <th scope="col">Nhân viên</th>
                                    <th scope="col">Ngày tạo</th>
                                    <th scope="col">Ngày thanh toán</th>
                                    <th scope="col">Ngày Ship</th>
                                    <th scope="col">Ngày nhận</th>
                                    <th scope="col">Người nhận</th>
                                    <th scope="col">SDT</th>
                                    <th scope="col">Địa chỉ</th>
                                    <th scope="col">Tình trạng</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${listHd}" var="hd">
                                    <c:if test="${hd.tinhTrang==3}">
                                        <tr>
                                            <td>${ hd.ma }</td>
                                            <td>${ hd.khachHang.ten }</td>
                                            <td>${ hd.nhanVien.ten }</td>
                                            <td><fmt:formatDate value="${ hd.ngayTao }" pattern="dd/MM/yyyy"/></td>
                                            <td><fmt:formatDate value="${ hd.ngayThanhToan }"
                                                                pattern="dd/MM/yyyy"/></td>
                                            <td><fmt:formatDate value="${ hd.ngayShip }" pattern="dd/MM/yyyy"/></td>
                                            <td><fmt:formatDate value="${ hd.ngayNhan }" pattern="dd/MM/yyyy"/></td>
                                            <td>${ hd.tenNguoiNhan }</td>
                                            <td>${hd.sdt}</td>
                                            <td>${hd.diaChi}</td>
                                            <c:choose>
                                                <c:when test="${hd.tinhTrang==0}">
                                                    <td>Chờ xác nhận</td>
                                                </c:when>
                                                <c:when test="${hd.tinhTrang==1}">
                                                    <td>Đang giao</td>
                                                </c:when>
                                                <c:when test="${hd.tinhTrang==2}">
                                                    <td>Đã nhận</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>Đã hủy</td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td><a type="button" class="btn btn-outline-primary"
                                                   href="chitiet/${hd.id}">
                                                Xem chi tiết
                                            </a></td>
<%--                                            <td><a type="button" class="btn btn-outline-primary"--%>
<%--                                                   href="chitiet/${hd.id}">--%>
<%--                                                Xem chi tiết--%>
<%--                                            </a></td>--%>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Button trigger modal -->
    <script>
        var selectedProductId;

        function confirmDelete(productId) {
            selectedProductId = productId;
            $('#confirmDeleteModal').modal('show');
        }

        function redirectToUrl() {
            // Xây dựng URL với selectedProductId
            var url = 'delete/' + selectedProductId;

            // Gửi yêu cầu xóa đến URL
            $.ajax({
                url: url,
                type: 'DELETE',
                success: function(response) {
                    // Xử lý phản hồi từ máy chủ sau khi xóa thành công
                    if (response.success) {
                        // Xóa thành công, thực hiện các thao tác khác
                        // Ví dụ: Cập nhật danh sách, hiển thị thông báo, v.v.
                        // ...
                    } else {
                        // Xóa không thành công, xử lý lỗi nếu cần
                        // ...
                    }
                    // Đóng modal xác nhận
                    $('#confirmDeleteModal').modal('hide');
                },
                error: function(xhr, status, error) {
                    // Xử lý lỗi trong quá trình gửi yêu cầu xóa
                    // ...
                }
            });
        }

    </script>
    <!-- Modal -->

    <div class="row mt-3">
        <div class="col-6">
            <a href="/BaiTap_war/mua-hang/index">
                <button class="btn btn-primary">Quay lại</button>
            </a>
        </div>
        <div class="col-6"></div>
    </div>

</div>

<script src="/BaiTap_war/js/bootstrap.min.js"></script>

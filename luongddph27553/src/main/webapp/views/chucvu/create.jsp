<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="col-10 offset-2" style="background-color: #F8FAFC">
    <div class="col-8 offset-2">
        <sf:form method="post" action="${action}" modelAttribute="ch">
            <h1 class="offset-2"> Chức Vụ</h1>
            <div style="font-size: larger ; color: darkred" class="ms-5" id="msg"> <c:if test="${not empty error}"> ${error}</c:if></div>

            <div class="row mt-3">
                <div class="col-6">
                    <label>Mã</label>
                    <sf:input path="ma" class="form-control" readonly="${fn:contains(action, 'update')}"/>
                    <span class="text-danger mt-3"> <sf:errors path="ma" class="" /></span>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-6">
                    <label>Tên</label>
                    <sf:input path="ten" class="form-control"/>
                    <span class="text-danger mt-3"> <sf:errors path="ten" class=""/></span>
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

        <script src="/SP23B2_SOF3011_IT17321_war/js/bootstrap.min.js"></script>
    </div>
</div>

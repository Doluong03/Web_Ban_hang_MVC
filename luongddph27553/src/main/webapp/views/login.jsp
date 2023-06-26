<%@ page language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>
        Login
    </title>
    <link rel="stylesheet"
          href="/css/bootstrap.min.css"/>
</head>
<body>
<div class="alert alert-danger">
    ${ loi }
</div>
<form action="/login" method="post">
    <section class="vh-">
        <div class="m-5 px-5">
            <h1>Đăng nhập hoặc đăng ký  </h1>
            <hr>
        </div>
        <div class="  p h-100">
            <div class="row d-flex  h-100">
                <div class="col-md-7 col-lg-5 col-xl-5 offset-1 me-5 pe-5   ">
                    <h1>Đăng nhập </h1>
                    <form>
                        <!-- Email input -->
                        <div class="form-outline mb-5 mt-5 ">
                            <input type="text" id="form1Example13" placeholder="Vd: Username"
                                   class="form-control form-control-lg border-bottom" name="ma"/>
                        </div>

                        <!-- Password input -->
                        <div class="form-outline mb-5">
                            <input type="password" id="form1Example23" placeholder="Vui lòng nhập mật khẩu "
                                   class="form-control form-control-lg" name="matkhau"/>
                        </div>

                        <div class="d-flex justify-content-around offset-7 mb-4">
                            <!-- Checkbox -->
                            <a href="#!" data-bs-toggle="modal" data-bs-target="#exampleModal">Forgot password?</a>
                        </div>

                        <!-- Submit button -->
                        <button type="submit" class="btn btn-primary btn-lg btn-block offset-4 px-5 " > Đăng nhập
                        </button>

                        <%--                        <div class="divider d-flex align-items-center my-4 offset-5">--%>
                        <%--                            <p class="text-center fw-bold mx-3 mb-0 text-muted ">OR</p>--%>
                        <%--                        </div>--%>

                        <%--                        <a class="btn btn-primary btn-lg btn-block mx-5" style="background-color: #3b5998" href="#!"--%>
                        <%--                           role="button">--%>
                        <%--                            <i class="fab fa-facebook-f me-2"></i>Continue with Facebook--%>
                        <%--                        </a>--%>
                        <%--                        <a class="btn btn-primary btn-lg btn-block" style="background-color: #55acee" href="#!"--%>
                        <%--                           role="button">--%>
                        <%--                            <i class="fab fa-twitter me-2"></i>Continue with Twitter</a>--%>

                    </form>
                </div>
                <div class="col-md-5 col-lg-4 col-xl-3">
                    <h1>Đăng ký  </h1>
                    <h6 class="mt-3">Đăng ký ngay để mua sắm dễ dàng hơn và nhận thêm nhiều ưu độc quyền cho thành viên
                        Innisfree
                    </h6>
                    <button class="btn btn-outline-success col-9 mt-5 offset-2 text-danger"> Đăng ký ngay</button>
                </div>

            </div>
        </div>
    </section>

</form>
</body>
</html>
<%-- 
    Document   : login
    Created on : Jul 2, 2020, 9:08:56 PM
    Author     : Tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Đăng nhập</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="resources/images/icons/favicon.ico"/>
        <link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
        <link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">	
        <link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
        <link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">	
        <link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
        <link rel="stylesheet" type="text/css" href="resources/css/util.css">
        <link rel="stylesheet" type="text/css" href="resources/css/main.css">
        <script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
        <script src="resources/vendor/animsition/js/animsition.min.js"></script>
        <script src="resources/vendor/bootstrap/js/popper.js"></script>
        <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="resources/vendor/select2/select2.min.js"></script>
        <script src="resources/vendor/daterangepicker/moment.min.js"></script>
        <script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
        <script src="resources/vendor/countdowntime/countdowntime.js"></script>
        <script src="resources/js/main.js"></script>
    </head>
    <body>
        <div class="limiter">
            <div class="container-login100" style="background-color: #eee">
                <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
                    <form:form cssClass="login100-form" action="doLogin" method="POST" modelAttribute="account">
                        <span class="login100-form-title p-b-33">Đăng nhập</span>
                        <c:if test="${not empty param.error}"> <span class="login100-form-title p-b-33"><p style="color: red">Tài khoản hoặc mật khẩu không chính xác !!!</p></span> </c:if>
                            <div class="wrap-input100">
                                <!--<input class="input100" type="text" name="username" placeholder="Username">-->
                            <form:input path="username" name="username" id="username" cssClass="input100" placeholder="Tài Khoản"/>
                            <span class="focus-input100-1"></span>
                            <span class="focus-input100-2"></span>
                        </div>

                        <div class="wrap-input100 rs1">
                            <!--<input class="input100" type="password" name="password" placeholder="Password">-->
                            <form:password path="password" name="password" id="password" cssClass="input100" placeholder="Mật khẩu"/>
                            <span class="focus-input100-1"></span>
                            <span class="focus-input100-2"></span>
                        </div>     
                        <div class="container-login100-form-btn m-t-20">
                            <button class="login100-form-btn">Đăng nhập</button>
                        </div>                            
                    </form:form>
                </div>
            </div>
        </div>
    </body>
</html>

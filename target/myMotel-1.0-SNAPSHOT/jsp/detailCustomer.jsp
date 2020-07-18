<%-- 
    Document   : home
    Created on : Jul 4, 2020, 9:32:42 PM
    Author     : Tuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--Icon-->
        <link rel="icon" type="image/png" href="resources/images/favicon.png">
        <!--CSS-->
        <link rel="stylesheet" type="text/css" href="resources/css/home.css">
        <link rel="stylesheet" type="text/css" href="resources/css/loader.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--JS-->
        <script src="resources/js/loader.js"></script>
        <script src="resources/js/home.js"></script>
        <title>Quản lý phòng</title>       
    </head>
    <body onload="loader()">
        <div id="loader" class="loader"></div>
        <div id="myDiv" class="content" style="display: none">
            <div class="home-container">
                <div class="left" style="background-color:#bbb;">
                    <h2>Menu</h2>
                    <input type="text" id="mySearch" onkeyup="searchMenu()" placeholder="Tìm kiếm..." title="Tìm kiếm">
                    <ul id="myMenu">
                        <li><a href="home">Tài khoản</a></li>
                        <li><a href="roomMaganement">Quản lý phòng</a></li>
                        <li><a href="makeBillRoom">Tính tiền phòng</a></li>
                        <li><a href="viewTotal">Doanh Thu</a></li>
                        <li><a href="introduce">Hướng dẫn</a></li>
                        <li style="background-color: #eee;"><a href="#">Chi Tiết Khách Hàng</a></li>
                    </ul>
                </div>

                <div class="right" style="background-color:#eee;">
                    <c:if test="${not empty requestScope.CUSTOMER}">
                        <c:set var="customer" value="${requestScope.CUSTOMER}" />
                        <h1 style="text-decoration: underline">Thông tin khách hàng</h1>
                        <h3>Tên : ${customer.name}</h3>
                        <h3>Ngày Sinh : ${customer.birthdate}</h3>
                        <h3>Giới tính : ${customer.sex}</h3>
                        <h3>Số điện thoại : ${customer.phone}</h3>
                        <h3>Email : ${customer.email}</h3>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>

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
                        <li style="background-color: #eee;"><a href="#">Chi Tiết Phòng</a></li>
                    </ul>
                </div>

                <div class="right" style="background-color:#eee;">
                    <c:if test="${not empty requestScope.ROOM}">
                        <c:set var="room" value="${requestScope.ROOM}" />
                        <c:set var="customerList" value="${requestScope.CUSTOMER_LIST}" />
                        <h1 style="text-decoration: underline">Phòng : ${room.room_number}</h1>
                        <h3>- Quản lý : ${sessionScope.USER.fullname}</h3>
                        <h3>
                            - Trạng thái : 
                            <c:if test="${room.status_id eq 5}">Cho thuê</c:if>
                            <c:if test="${room.status_id eq 6}">Đang trống</c:if>
                        </h3>
                        <c:if test="${room.status_id eq 5}">
                            <h3>- Khách thuê : </h3>
                            <c:forEach items="${customerList}" var="customer">
                                <h3 style="margin-left: 5%">+ <a href="view-customer?id=${customer.id}">${customer.name}</a> </h3>
                            </c:forEach>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>

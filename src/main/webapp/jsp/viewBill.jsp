<%-- 
    Document   : calculateRoom
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
        <link href="resources/css/calculate.css" rel="stylesheet" type="text/css"/>
        <link href="resources/css/paging.css" rel="stylesheet" type="text/css"/>
        <!--JS-->
        <script src="resources/js/loader.js"></script>
        <script src="resources/js/home.js"></script>
        <script src="resources/js/calculate.js"></script>
        <title>Quản lý phòng</title>      
    </head>
    <body onload="loader()">
        <div id="loader" class="loader"></div>
        <div id="myDiv" class="content" style="display: none">
            <div class="home-container">
                <div class="left" style="background-color:#bbb;">
                    <h2>Menu</h2>
                    <input style="height: auto" type="text" id="mySearch" onkeyup="searchMenu()" placeholder="Tìm kiếm..." title="Tìm kiếm">
                    <ul id="myMenu">
                        <li><a href="home">Tài khoản</a></li>
                        <li><a href="roomMaganement">Quản lý phòng</a></li>
                        <li><a href="makeBillRoom">Tính tiền phòng</a></li>
                        <li><a href="viewTotal" style="background-color: #eee;">Doanh Thu</a></li>
                        <li><a href="introduce">Hướng dẫn</a></li>
                    </ul>
                </div>

                <div class="right" style="background-color:#eee;">
                    Xem doanh thu
                    <h1>Number Page : ${requestScope.NUMBER_PAGE}</h1>
                    <c:forEach items="${requestScope.LIST}" var="bill" varStatus="counter">
                        <h1>Bill : bill.id - bill.total - bill.date - bill.statusId</h1>
                    </c:forEach>
                    <div class="pagination">
                      <!-- <a href="#">&laquo;</a> -->
                      <a href="#">1</a>
                      <a class="active" href="#">2</a>
                      <a href="#">3</a>
                      <a href="#">4</a>
                      <a href="#">5</a>
                      <a href="#">6</a>
                      <!-- <a href="#">&raquo;</a> -->
                    </div>                  
                </div>
            </div>
        </div>
    </body>
</html>

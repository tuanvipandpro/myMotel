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
        <!--JS-->
        <script src="resources/js/loader.js"></script>
        <script src="resources/js/home.js"></script>
        <script src="resources/js/calculate.js"></script>
        <title>Quản lý phòng</title>  
        <style>
            .details ul {
              list-style-type: none;
              padding: 0;
              margin: 0;
            }

            .details ul li {
              border: 1px solid #ddd;
              margin-top: -1px; /* Prevent double borders */
              background-color: #f6f6f6;
              padding: 12px;
            }            
        </style>
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
                        <li><a href="viewTotal">Doanh Thu</a></li>
                        <li><a href="introduce">Hướng dẫn</a></li>
                    </ul>
                </div>

                <div class="right details" style="background-color:#eee;">
                    <c:if test="${not empty requestScope.BILL}">
                        <h1>Mã hóa đơn : ${requestScope.BILL.id}</h1>
                        <h2>Tổng tiền : ${requestScope.BILL.total}</h2>
                        <c:if test="${not empty requestScope.DETAILS_LIST}">
                            <ul>
                                <c:forEach var="details" items="${requestScope.DETAILS_LIST}" varStatus="counter">
                                    <li>Mã phòng : ${details.roomId} - Số điện : ${details.electricNumber} - Số nước : ${details.waterNumber} - Tổng : ${details.total}</li>
                                </c:forEach>                                
                            </ul>
                        </c:if>
                    </c:if>
                    <c:if test="${empty requestScope.BILL}">
                        <h3>Hóa đơn không hợp lệ, hãy kiểm tra lại !!!</h3>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>

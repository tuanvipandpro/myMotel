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
        <style>
            input[type=submit]{
                height: 30px;
                font-size: 16px;
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
                        <li><a href="viewTotal" style="background-color: #eee;">Doanh Thu</a></li>
                        <li><a href="introduce">Hướng dẫn</a></li>
                    </ul>
                </div>

                <div class="right" style="background-color:#eee;">
                    <c:if test="${not empty requestScope.LIST}">
                        <h1>Hóa đơn</h1>
                        <table>
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>ID</th>
                                    <th>Tổng tiền (VND)</th>
                                    <th>Ngày</th>
                                    <th>Xem</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.LIST}" var="bill" varStatus="counter">
                                    <form action="viewDetailBill">
                                        <input type="hidden" name="billId" value="${bill.id}"/>
                                        <c:if test="${bill.statusId eq 1}">
                                            <tr>
                                                <td>${counter.count + requestScope.PAGE_NO * 1 - 1}</td>
                                                <td>${bill.id}</td>
                                                <td>${bill.total}</td>
                                                <td>${bill.date}</td>
                                                <td><input type="submit" value="Chi Tiết" /> </td>
                                            </tr>                                        
                                        </c:if>
                                    </form>
                                </c:forEach>                                 
                            </tbody>
                        </table>                             
                        <div class="pagination">
                          <!-- <a href="#">&laquo;</a> -->
                            <c:forEach begin="1" end="${requestScope.NUMBER_PAGE}" var="pageNo" step="1">
                                <c:if test="${requestScope.PAGE_NO eq pageNo}"><a class="active" href="#">${pageNo}</a></c:if>
                                <c:if test="${requestScope.PAGE_NO ne pageNo}"><a href="viewTotalByPageNo?pageNo=${pageNo}">${pageNo}</a></c:if>
                            </c:forEach>                           
                          <!-- <a href="#">&raquo;</a> -->
                        </div>                              
                    </c:if>
                    <c:if test="${empty requestScope.LIST}">
                        <h3>Bạn không thể xem hóa đơn !!!</h3>
                    </c:if>                                 
                </div>
            </div>
        </div>
    </body>
</html>

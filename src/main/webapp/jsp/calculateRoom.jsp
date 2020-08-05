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
        <!--JS-->
        <script src="resources/js/loader.js"></script>
        <script src="resources/js/home.js"></script>
        <title>Quản lý phòng</title>      
        <style>
            table {
                border-collapse: collapse;
                border-spacing: 0;
                width: 100%;
                border: 2px solid #ddd;
            }
            th, td {
                text-align: left;
                padding: 8px;
            }   
            th {
                background-color: #17a2b8;
                font-size: 16px;
            }            
            tr:nth-child(even){background-color: #b8daff}
            td {
                font-size: 16px;
            }
            input[type=number] {
                width: 80%;
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
                        <li><a href="makeBillRoom" style="background-color: #eee;">Tính tiền phòng</a></li>
                        <li><a href="viewTotal">Doanh Thu</a></li>
                        <li><a href="introduce">Hướng dẫn</a></li>
                    </ul>
                </div>

                <div class="right" style="background-color:#eee;">
                    <h1>Tính tiền phòng</h1>
                    <c:if test="${not empty requestScope.LIST}">
                        <c:set var="list" value="${requestScope.LIST}"/>
                        <table>
                            <thead>
                                <tr>
                                    <th>Số Phòng</th>
                                    <th>Điện (Cũ)</th>
                                    <th>Điện (Mới)</th>
                                    <th>Nước (Cũ)</th>
                                    <th>Nước (Mới)</th>
                                    <th>Giá(VND)</th>
                                    <th>Trạng Thái</th>
                                    <th>Kiểm Tra</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="dto" items="${list}" varStatus="counter">
                                    <tr>
                                        <div id="${dto.roomId}">
                                            <input type="hidden" name="roomId" value="${dto.roomId}" />
                                            <td>${dto.roomNumber} </td>
                                            <td>${dto.oldElectric}</td>
                                            <td style="width: 12%">
                                                <c:if test="${dto.statusId eq 5}">
                                                    <input type="number" name="newElectric" value="${dto.newElectric}" min="${dto.oldElectric}"/>
                                                </c:if>
                                                <c:if test="${dto.statusId ne 5}">
                                                    <input type="number" name="newElectric" value="${dto.newElectric}" min="${dto.oldElectric}" readonly/>
                                                </c:if>                                                    
                                            </td>
                                            <td>${dto.oldWater}</td>
                                            <td style="width: 12%">
                                                <c:if test="${dto.statusId eq 5}">
                                                    <input type="number" name="newElectric" value="${dto.newWater}"  min="${dto.oldWater}"/>
                                                </c:if>
                                                <c:if test="${dto.statusId ne 5}">
                                                    <input type="number" name="newElectric" value="${dto.newWater}"  min="${dto.oldWater}" readonly/>
                                                </c:if>                                                
                                            </td>
                                            <td>${dto.roomPrice}</td>
                                            <td>
                                                <c:if test="${dto.statusId eq 5}">
                                                    Cho Thuê
                                                </c:if>
                                                <c:if test="${dto.statusId ne 5}">
                                                    Trống
                                                </c:if>                                                
                                            </td>
                                            <td>
                                                <button onclick="return false">Check</button>
                                            </td>
                                        </div>                                  
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <button>Confirm</button>
                    </c:if>
                    <c:if test="${empty requestScope.LIST}">
                        <h3>Không có phòng trọ để tính</h3>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>

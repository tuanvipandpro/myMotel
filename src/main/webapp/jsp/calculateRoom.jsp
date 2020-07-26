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
        <link rel="stylesheet" type="text/css" href="resources/css/table.css"/>
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
                    <h1>Danh Sách Phòng Trọ</h1>
                    <c:if test="${not empty sessionScope.ROOM_LIST}">
                        <c:set var="list" value="${sessionScope.ROOM_LIST}"/>
                        <div class="table-content">
                            <table>
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Số Phòng</th>
                                        <th>Trạng Thái</th>
                                        <th>Giá (VND)</th>
                                        <th>Cập Nhật</th>
                                        <th>Chi Tiết</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="room" items="${list}" varStatus="counter">
                                    <tr>
                                        <form action="update-room" method="POST">
                                            <input type="hidden" name="id" value="${room.id}" />
                                            <td>${counter.count}</td>
                                            <td><input type="text" maxlength="3" name="roomNumber" value="${room.room_number}" /></td>
                                            <td>
                                                <select name="status">
                                                    <c:if test="${room.status_id eq 5}">
                                                        <option value="5" selected>Cho Thuê</option>
                                                        <option value="6" >Đang Trống</option>
                                                    </c:if>
                                                    <c:if test="${room.status_id eq 6}">
                                                        <option value="5">Cho Thuê</option>
                                                        <option value="6" selected>Đang Trống</option>
                                                    </c:if>
                                                </select>
                                            </td>
                                            <td><input type="number" name="price" value="${room.price}" min="700000" max="10000000"/></td>
                                            <td><input style="width: 75%" type="submit" value="Cập Nhật" onclick="return confirm('Cập nhật thông tin của phòng này ?')"/></td>
                                        </form>
                                        <form action="view-room" method="GET">
                                            <td> 
                                                <input type="hidden" name="id" value="${room.id}" />
                                                <input type="submit" value="View"/>
                                            </td>
                                        </form>                                    
                                    </tr>
                                </c:forEach>
                                    <tr>
                                        <form action="add-room" method="POST">
                                            <td>Thêm</td>
                                            <td><input type="text" maxlength="3" name="roomNumber" value="" required/></td>
                                            <td>
                                                <select name="status">
                                                    <option value="5" >Cho Thuê</option>
                                                    <option value="6" selected>Đang Trống</option>
                                                </select>
                                            </td>
                                            <td>
                                                <input type="number" name="price" value="700000" min="700000" max="10000000" required/>
                                            </td>
                                            <td colspan="2"><input style="width: 90%" type="submit" value="Thêm Mới Phòng" onclick="return confirm('Bạn có chắc muốn thêm mới ?')"/></td>
                                        </form>
                                    </tr>
                                </tbody>
                            </table> 
                        </div>
                    </c:if>
                    <c:if test="${empty sessionScope.ROOM_LIST}">
                        <h3>Không có phòng trọ bạn đang quản lý !!!</h3>
                    </c:if>
                </div>
            </div>
        </div>
    </body>
</html>

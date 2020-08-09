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
        <!--JS-->
        <script src="resources/js/loader.js"></script>
        <script src="resources/js/home.js"></script>
        <style>
            button:hover {
                background-color: blanchedalmond;
            }
        </style>
        <title>Trang Chủ</title>
    </head>
    <body onload="loader()">
        <div id="loader" class="loader"></div>
        <div id="myDiv" class="content" style="display: none">
            <div class="home-container">
                <div class="left" style="background-color:#bbb;">
                    <h2>Menu</h2>
                    <input type="text" id="mySearch" onkeyup="searchMenu()" placeholder="Tìm kiếm..." title="Type in a category">
                    <ul id="myMenu">
                        <li style="background-color: #eee;"><a href="home">Tài khoản</a></li>
                        <li><a href="roomMaganement">Quản lý phòng</a></li>
                        <li><a href="makeBillRoom">Tính tiền phòng</a></li>
                        <li><a href="viewTotal">Doanh Thu</a></li>
                        <li><a href="introduce">Hướng dẫn</a></li>
                    </ul>
                </div>

                <div class="right" style="background-color:#eee;">
                    <form action="changePassword" method="POST">
                        <h1>Thông tin tài khoản</h1>
                        <div class="account">
                            <div class="account-left">
                                <div >
                                    <img src="resources/images/icon.png" alt="Avatar" class="image"/><br/>
                                </div>
                                <h2>${sessionScope.USER.fullname}</h2>
                            </div>
                            <div class="account-right">
                                <label>Tài Khoản</label> 
                                <input name="username" type="text" value="${sessionScope.USER.username}" readonly/>
                                <label>Mật khẩu mới</label> 
                                <input id="password" name="password" type="password" value="" required/>
                                <label>Xác nhận mật khẩu</label> 
                                <input id="confirm-password" name="confirm-password" type="password" value="" required/>                
                            </div>
                        </div>
                        <button class="btn" type="submit" onclick="return clickConfirm()">Lưu Thay Đổi</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

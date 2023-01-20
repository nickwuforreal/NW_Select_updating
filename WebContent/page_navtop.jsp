<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/format.css">
    <link rel="stylesheet" href="css/popup.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <title>N.W Select</title>
</head>
<body>
    <!-- 導覽列 -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid"> 
            <a class="navbar-brand" href="home.jsp">N.W Select</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0" >
                <!-- 會員登入按鈕 -->
                    <% 
                String username = null;
                String password = null;
                Cookie[] cookies = request.getCookies();
                if(cookies!=null){
	                for (int i = 0; i < cookies.length; i++) {
	                    if ("username".equals(cookies[i].getName())) {
	                        username = cookies[i].getValue();
	                    } 
	                }
                }
                if (username != null) {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8080/NW_Select/logOut" id="logoutbtn" type="button">
                    <span class="material-symbols-outlined">
                        logout
                    </span>登出</a>
                    </li>
                <%
                }
                else{
                %>
                    <li class="nav-item">
                    <a class="nav-link" id="loginbtn" href="login.jsp" type="button"><span class="material-symbols-outlined">
                        login
                    </span>會員登入</a>
                    </li>
                <%}%>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="JavaScript:;" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <span class="material-symbols-outlined">
                                manage_accounts
                            </span>會員專區
                        </a>
                        <ul class="dropdown-menu">
                          <li><a class="dropdown-item" href="order_history.jsp">訂單查詢</a></li>
                          <li><a class="dropdown-item" href="member_info.jsp">會員資料</a></li>
                        </ul>
                <li class="nav-item">
                    <a class="nav-link" href="cart.jsp"><span class="material-symbols-outlined">
                        shopping_cart_checkout
                    </span>購物車</a>
                </li>
                </ul>
              </div>
          </div>
    </nav>
</body>

</html>
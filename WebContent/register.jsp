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
	<jsp:include page="/page_navtop.jsp" />
	<!-- 頁籤 -->
	<jsp:include page="/page_marktop.jsp" />
    <!-- 註冊會員表單 -->
    <div class="container-fluid text-center cartorder_outer">
        <form action="login.jsp" method="POST">
            <div class="badge text-wrap cartorder_inner mt-3" style="width: 80%;">
                <h4>會員註冊</h4>
            </div>
            <div id="reg" class="register row">
				<div class="col-sm-12">
					<label for="account" class="form-label">電子郵件(視為帳號)</label>
					<input type="email" name="email" class="form-control" id="mail" placeholder="請輸入e-mail">
					<label for="password" class="form-label">密碼(請輸入6~12位數)</label>
					<input type="password" name="passwd" class="form-control" id="passwd" placeholder="請輸入密碼">
                    <label for="realname" class="form-label">真實姓名</label>
					<input type="text" name="mem_name" class="form-control" id="name" placeholder="請輸入真實姓名">
					<label for="birth" class="form-label">生日</label>
					<input type="date" name="birth" class="form-control" id="birth">
					<label for="phonenumber" class="form-label">手機號碼</label>
					<input type="tel" name="phone" class="form-control" id="phone" placeholder="請輸入手機號碼">
				</div>
                <div class="spacer15"></div>
                <span id = "message" style="color:red"> </span>
				<input type="button" value="送出" class="btn btn-primary" onclick="checkreg()">
			</div> 
            <div class="spacer50"></div>
        </form>
    </div>

    <div class="spacer50"></div>
    
	<!-- 頁尾 -->
	<jsp:include page="/page_bottom.jsp" />
	
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<!-- <script src="js/plugins.js"></script> -->
	<script src="./js/active.js"></script>
</body>

</html>
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
	
	<!-- 登入抬頭 -->
	<div class="container-fluid text-center cartorder_outer">
	    <div class="badge text-wrap cartorder_inner mt-3" style="width: 80%;">
	        <h4>會員登入</h4>
	    </div>
	    <!-- 登入表單 -->
	    <form name="login" action="doLogin" method="post">
	        <!-- email -->
	         <div id="reg" class="register row">
			 <div class="col-sm-12">
	         <div class="form-group">
	         	<label for="account" class="form-label">電子郵件</label>
	            <input type="email" name="loginmail" id="loginmail" class="account form-control" placeholder="請輸入Email">
	         </div>
	         <!-- password -->
	        <div class="form-group">
	        	<label for="password" class="form-label">密碼</label>
	            <input type="password" name="loginpwd" id="loginpwd" class="password form-control" placeholder="請輸入密碼">
	        </div>
	        <div class="spacer15"></div>
	        <!-- 登入資訊驗證錯誤 -->
	        <div class="form-group">
	       	<%//System.out.print(session.getAttribute("errorlogin")); %>
	      	<%if(!(session.getAttribute("errorlogin")==null)){ %>
	        <span style="color:red"><%= session.getAttribute("errorlogin") %></span>
	        <%} %>
	        <span id = "loginmessage" style="color:red"></span>
	        </div>
	        <!-- checkbox&送出按鈕 -->
	        <input type="checkbox" name="remember">保持登入
	        <input type="button" value="登入" class="btn btn-info" onclick="checklogin()">
	        <div class="spacer15"></div>
	        <div class="form-group">
	        <a href="register.jsp" type="button" class="member">註冊會員</a>
	        </div>
	    </div>
	    </div>
	    </form> 
	    <%
	    String username = null;
	    Cookie[] cookies = request.getCookies();
	    if(cookies!=null){
	    for (int i = 0; i < cookies.length; i++) {
	       if ("username".equals(cookies[i].getName())) {
	            username = cookies[i].getValue();
	        	} 
	    	}
	    }
	    if (username != null) {
	        response.sendRedirect("home.jsp");
	    }
		%>
	</div>
	<div class="spacer50"></div>
	    
	<!-- 頁尾 -->
	<jsp:include page="/page_bottom.jsp" />
	    
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="./js/active.js"></script>
</body>

</html>
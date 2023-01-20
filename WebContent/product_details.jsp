<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<!-- 商品資訊頁 -->
	<div class="spacer15"></div>
    <%
    String prodname = (String) session.getAttribute("prodname");
    String prodprice = (String) session.getAttribute("prodprice");
    String prodstock = (String) session.getAttribute("prodstock");
    String prodcon = (String) session.getAttribute("prodcon");
    String prodpic = (String) session.getAttribute("prodpic");

    if(prodcon!=null){
    String[] conarr = prodcon.split("/");
    %>
	<div class="container-fluid">
	    <div class="row justify-content-between align-items-center">
	        <!-- 左側商品圖片欄 -->
	        <div class="col-sm-6 col-xs-12">
	            <img src="<%="img/"+prodpic %>" class="img-fluid" alt="<%=prodname%>">
	        </div>
	
	        <!-- 右側商品說明欄 -->
	        <div class="col-sm-6 col-xs-12">
	            <div class="text-center prod-name" id="prodname"><%=prodname%></div>
	            <div class="spacer15"></div>
	            <div class="text-center"><%=conarr[0]%></div>
	            <div class="text-center"><%=conarr[1]%></div>
	            <div class="text-center"><%=conarr[2]%></div>
	            <div class="text-center"><%=conarr[3]%></div>
	            <div class="spacer15"></div>
	            <div class="text-center"><span class='text-danger'>NTD. <%=prodprice%></span></div>
	            <div class="spacer30"></div>
	            <div class="prod-count">
	                <div class="prod-num">
	                    <label>商品數量</label>
	                </div>
	                <div>
	                <select class="form-select" id="quantity">
	                <%
	                for(int i=1;i<=Integer.parseInt(prodstock);i++){
	                %>
	                    <option><%=i%></option>
	                <%} %>
	                </select>
	                </div>
	                <div>
	                <label>庫存：
	                    <a><%=prodstock%></a>
	                </label>
	                </div>
	                <div class="spacer15"></div>
	                <span id="cartmsg"></span>
	                <button type="button" class="cart btn btn-dark" onclick="addcart()">加入購物車</button>
	                <div class="spacer30"></div>
	            </div>
	            <%}%>
	        </div>
	    </div>
	</div>
	<div class="spacer30"></div>
	
	<!-- 頁尾 -->
	<jsp:include page="/page_bottom.jsp" />
	
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="./js/active.js"></script>
</body>

</html>
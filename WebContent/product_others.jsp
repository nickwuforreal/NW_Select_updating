<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,com.ted.SQLBean" %>
<%@ page import="java.sql.PreparedStatement" %>
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
    <div class="container-fluid">
        <ul class="nav nav-tabs justify-content-center text-center">
            <li class="nav-item col-2 ">
                <a class="nav-link " href="home.jsp" >首頁</a>
            </li>
            <li class="nav-item col-2">
                <a class="nav-link" href="product_top.jsp">上衣</a>
            </li>
            <li class="nav-item col-2">
                <a class="nav-link" href="product_bottom.jsp">褲子</a>
            </li>
            <li class="nav-item col-2">
                <a class="nav-link active" aria-current="page" href="product_others.jsp">配件</a>
            </li>
        </ul>
    </div>
    <div class="text-center" style="font-size:10px;color:red;padding:15px 15px 0 15px;">慎防詐騙 > N.W 不會利用電話要求會員ATM操作，切勿聽從電話通知，前往ATM匯款轉帳，如接到可疑電話，務必冷靜處理並且掛斷</div>

	<!-- 標頭 + 商品欄 -->
    <div class="container">
        <div class="spacer50"></div>
        <h4 class="text-center">配件</h4>
        <div class="spacer30"></div>
        <div class="row">
			<%
			String dataname=null;
			String dataprice=null;	
			String datapic=null;
			
			try {
				com.ted.SQLBean db = new com.ted.SQLBean();
				Connection conn = null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				conn = db.getconn();
				
				String sql= "SELECT * FROM nw_select.commodity INNER JOIN nw_select.comm_pic ON commodity.comm_no=comm_pic.comm_no WHERE sort=?;";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,"配件");
				rs = stmt.executeQuery();
				while(rs.next()){
					dataprice = rs.getString("price");
					dataname = rs.getString("comm_name");
					datapic = rs.getString("pic_name");
				%>	
			        
			<div class="col-xs-6 col-sm-3 pd-item">
			    <div class="prod-img">
			        <a href="<%="http://localhost:8080/NW_Select/doProdDetail?title="+dataname%>" title="<%=dataname%>" class="prod-det">
			            <img src="<%="img/"+datapic %>"
			                class="pdimg lazy img-responsive"
			                data-original="https://v2cdn.sfec.cloud/eyJidWNrZXQiOiJzZi1lYy1zdGF0aWMiLCJrZXkiOiJoeXN0b3JlX2EzMzZiMjkyL3VwbG9hZHMvcHJvZHVjdC9UTDIyTDAyMy84YTNjNGUxYzNjNTU0OWY5OGQ1M2MxZGY4ZmEzMGMxNC5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjY1MCwiaGVpZ2h0Ijo2NTAsImZpdCI6Imluc2lkZSIsIndpdGhvdXRFbmxhcmdlbWVudCI6dHJ1ZX19fQ=="
			                style="width:100%;"/>
			        </a>
			    </div>
			    <div class="spacer15"></div>
			    <div class="text-center"><%=dataname %></div>
			    <div class="spacer15"></div>
			    <div class="text-center"><span class='text-danger'><%="NTD. "+dataprice %></span></div>
			    <div class="spacer50"></div>
			    <div class="spacer20"></div>
			</div>
		
		<%
		}
		rs.close();
		stmt.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		} 
		%>
		</div>
	</div>
	    
	<!-- 頁尾 -->
	<jsp:include page="/page_bottom.jsp" />
	
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="./js/active.js"></script>
</body>

</html>
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
	<jsp:include page="/page_marktop.jsp" />
	
	<!-- 訂單明細表格 -->
    <div class="container-fluid text-center cartorder_outer">
        <form action="cart.jsp" method="POST">
            <div class="badge text-wrap cartorder_inner my-3" style="width: 80%;">
                <h4>訂單明細</h4>
            </div>
            <!-- 訂單資訊 -->
            <table class="table table-light table-striped order-table">
                <tr>
                    <th role="1">訂單編號</th>
                    <th role="3">訂購時間</th>
                    <th role="5">訂單狀態</th>
                    <th role="3">付款方式</th>
                    <th role="5">收件人資料</th>
                    <th role="3">收件門市</th>
                </tr>
                <tr>
                    <td>名稱</td>
                    <td>單價</td>
                    <td>數量</td>
                    <td>金額</td>
                    <td>數量</td>
                    <td>金額</td>
                </tr>
            </table>
            <div class="spacer50"></div>
            <!-- 訂單商品內容 -->
            <table class="table table-light table-striped order-table">
                <tr>
                    <th>商品名稱</th>
                    <th>商品單價</th>
                    <th>商品數量</th>
                    <th>金額</th>
                </tr>
                <tr>
                    <td>名稱</td>
                    <td>單價</td>
                    <td>數量</td>
                    <td>金額</td>
                </tr>
                <tr>
                    <td>名稱</td>
                    <td>單價</td>
                    <td>數量</td>
                    <td>金額</td>
                </tr>
                <tr>
                    <td>名稱</td>
                    <td>單價</td>
                    <td>數量</td>
                    <td>金額</td>
                </tr>
                <tr>
                    <td class="text-end" colspan="3">小計</td>
                    <td>總額</td>
                </tr>
            </table>
            <div class="spacer50"></div>
            <div>
                <a class="btn btn-dark" role="button" href="order_history.jsp">返回訂單查詢</a>
            </div>
        </form>
    </div>
    <div class="spacer50"></div>
    
    <!-- 頁尾 -->
	<jsp:include page="/page_bottom.jsp" />
	
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="./js/active.js"></script>
</body>

</html>
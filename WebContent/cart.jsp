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
	
	<!-- 購物車頁面 -->
    <div class="addtocart_outer">
        <div class="addtocart_inner">
            <form>
                <table class="table table-light table-striped">
                    <tr>
                        <th>刪除</th>
                        <th>商品編號</th>
                        <th>商品名稱</th>
                        <th>商品單價</th>
                        <th>商品數量</th>
                        <th>金額</th>
                    </tr>
                    <%
                    String loginmail = "";
                    String memno = "";
				    String prodname = "";
				    String prodprice = "";
				    String quantity = "";
				    int quan=0;
				    int pri=0;
				    String count="";
				    int tot=0;
				    String total="";
				    String commno="";
				    String cartno="";
				    boolean loggedIn=false;
				    Cookie[] cookies = request.getCookies();
					for (Cookie c : cookies) {
						  if (c.getName().equals("username")){
						    loginmail = c.getValue();
						    loggedIn=true;
						  }
						} 
					if(!loggedIn){
							response.setHeader("Cache-Control","no-store");
							response.setHeader("Pragma","no-cache");
							response.setDateHeader ("Expires", 0);
							response.sendRedirect("login.jsp");
					}
					else{
					    try {
							com.ted.SQLBean db = new com.ted.SQLBean();
							Connection conn = null;
							PreparedStatement stmt = null;
							ResultSet rs = null;
							conn = db.getconn();
							
							String sql="SELECT mem_no FROM member WHERE email=?;";
							stmt = conn.prepareStatement(sql);
							stmt.setString(1,loginmail);
							rs = stmt.executeQuery();
						    while(rs.next()) {
						    	memno=String.format("%05d",rs.getInt("mem_no"));
						    }
	
							String sql1="select * from cart_data inner join ("+
										"(SELECT * ,(SELECT mem_no FROM member WHERE email='"+loginmail+"') as mem_no FROM commodity WHERE commodity.comm_no in"+ 
										"(SELECT comm_no FROM cart_data "+
										"WHERE cart_no=(SELECT cart_no FROM cart "+
										"WHERE mem_no='"+memno+"')) "+
										")) as temp"+
										" on temp.comm_no=cart_data.comm_no;";
						    rs = stmt.executeQuery(sql1);
						    while(rs.next()) {
						    	cartno=String.format("%05d",rs.getInt("cart_no"));
						    	commno=String.format("%05d",rs.getInt("comm_no"));
						    	quan=rs.getInt("qty");
						    	quantity=String.valueOf(quan);
						    	prodname=rs.getString("comm_name");
						    	pri=rs.getInt("price");
						    	prodprice=String.valueOf(pri);
						    	count=String.valueOf(quan*pri);
						    	tot+=(quan*pri);
						    	total=String.valueOf(tot);
					    %>
                    <tr class="prodtr">
                        <td><a href="#" onclick="deleteprod()">刪除</a></td>
                        <td id="commno"><%=commno%></td>
                        <td><%=prodname%></td>
                        <td class="price"><%=prodprice%></td>
                        <td>
                            <input class="prod-quan" type="number" value="<%=quantity%>" min="0" id="quantity">
                        </td>
                        <td class="count"><%=count %></td>
                    </tr> 
                    <%
					}
					rs.close();
					stmt.close();
					}
					catch (SQLException e) {
						System.out.print(e);
					} 
					%>
                    <tr>
                    	<td id="cartno" class="text-start" colspan="3" style="font-size:5px; vertical-align:bottom ;text-align:left;"><%=cartno %></td>
                        <td class="text-end" colspan="2">小計</td>
                        <td class="total" ><%=total %></td>
                    </tr>
                    <%
					}
					%>
                </table>
                <div class="cart-btn mb-3">
                    <a class="btn btn-dark" role="button" href="product_top.jsp">繼續購物</a>
                    <button type="button" class="btn btn-dark" onclick="refreshcart()">更新購物車</button>
                    <button type="button" class="btn btn-dark" onclick="clearcart()">清空購物車</button>
                    <button type="button" class="btn btn-dark" onclick="finishcart()">我要結帳</button>
                </div>
            </form>
        </div>
    </div>
    <div class="spacer50"></div>
    
    <!-- 頁尾 -->
	<jsp:include page="/page_bottom.jsp" />
	
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="./js/active.js"></script>
</body>

</html>
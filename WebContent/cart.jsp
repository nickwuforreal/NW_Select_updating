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
<script type="text/javascript">
function refreshcart()
{
	const count=[];
	var total=0;
	const quan_elements=document.querySelectorAll(".prod-quan");
	const price_elements=document.querySelectorAll(".price");
	const count_elements=document.querySelectorAll(".count");
	const products_price = [];
	const products_quantity = [];
	for (var i=0;i<price_elements.length;i++){
		products_price.push(price_elements[i].innerText);
		products_quantity.push(quan_elements[i].value);
		count[i]=products_price[i]*products_quantity[i];
		total+=count[i];
		count_elements[i].innerText=count[i];
	}
	document.querySelector(".total").innerText=total;
}

function deleteprod(){
// 	if(window.ActiveXObject)
//     {
//         xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
//     }
//     else if(window.XMLHttpRequest)
//     {
//         xmlHTTP=new XMLHttpRequest();
//     }
	const trElement = document.querySelector('.prodtr');
// 	const commno_element = document.querySelectorAll("#commno");
// 	const commno=commno_element.innerText;
// 	console.log(commno);
// 	if(commno!=null)
// 	{
// 		xmlHTTP.open("GET","http://localhost:8080/NW_Select/deleteProd?useUnicode=true&characterEncoding=UTF-8&cartno="+cartno+"&prodno="+prodno+"&prodquan="+prodquan, true);
// 	}
// 	xmlHTTP.onreadystatechange=function ()
// 	{
// 		if(xmlHTTP.readyState == 4)
//         {
//           if(xmlHTTP.status == 200)
//           {
//         	  
//           }
//         }
// 	}
//     xmlHTTP.send();
    
	event.target.parentNode.parentNode.parentNode.removeChild(event.target.parentNode.parentNode);
	refreshcart()
}

function clearcart(){
	const tbElements = document.querySelectorAll('.prodtr');
	  for (const tbElement of tbElements) {
	    tbElement.parentNode.removeChild(tbElement);
	  }
	  refreshcart()
}

function finishcart(){
	if(window.ActiveXObject)
    {
        xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
    }
    else if(window.XMLHttpRequest)
    {
        xmlHTTP=new XMLHttpRequest();
    }
	
	const qty_elements=document.querySelectorAll("#quantity");
	const commno_elements=document.querySelectorAll("#commno");
	var cartno=document.getElementById("cartno").innerText;
	const products_no = [];
	const products_quantity = [];
	//const products_detail = [];
	for (var i=0;i<commno_elements.length;i++){
		products_no.push(commno_elements[i].innerText);
		products_quantity.push(qty_elements[i].value);
		//products_detail[i]=products_no[i]+"/"+products_quantity[i]
	}
	var prodno = products_no.join(',')
	var prodquan = products_quantity.join(',')
	console.log(prodno+"/"+prodquan)
	if(cartno!=null)
	{
		xmlHTTP.open("GET","http://localhost:8080/NW_Select/editCart?useUnicode=true&characterEncoding=UTF-8&cartno="+cartno+"&prodno="+prodno+"&prodquan="+prodquan, true);
	}
	
	xmlHTTP.onreadystatechange=function ()
	{
		if(xmlHTTP.readyState == 4)
        {
          if(xmlHTTP.status == 200)
          {
        	  setTimeout("location.href='cart_order.jsp'",500);
          }
        }
	}
    xmlHTTP.send();
}

</script>
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
                    String loginmail = null;
                    String memno = null;
				    String prodname = null;
				    String prodprice = null;
				    String quantity = null;
				    int quan=0;
				    int pri=0;
				    String count=null;
				    int tot=0;
				    String total=null;
				    String commno=null;
				    String cartno=null;
				    Cookie[] cookies = request.getCookies();
					for (Cookie c : cookies) {
						  if (c.getName().equals("username")) {
						    loginmail = c.getValue();
						  }
						}
					//System.out.println(loginmail);
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
					    //System.out.println(memno);
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
	<!-- <script src="js/plugins.js"></script> -->
	<script src="./js/active.js"></script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.io.*,java.util.*,com.ted.SQLBean" %>
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
<script>
function cleardelivery()
{
	document.getElementById("deliveryname").value = ""
	document.getElementById("deliveryphone").value = ""
	document.getElementById("deliveryemail").value = ""
}

function orderdone()
{
	if(window.ActiveXObject)
    {
        xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
    }
    else if(window.XMLHttpRequest)
    {
        xmlHTTP=new XMLHttpRequest();
    }
	var payment = document.getElementById("payment").value;
	var cartno=document.getElementById("cartno").innerText;
	var name = document.getElementById("deliveryname").value;
	if(name==''){
		document.getElementById("message").innerHTML = "***請填入真實姓名***";
		document.getElementById('deliveryname').focus();
		return false;
	}else{
		var nameRegxp = /^[\u4e00-\u9fa5]+$|^[a-zA-Z\s]+$/;
		if (nameRegxp.test(name) != true){
			document.getElementById("message").innerHTML = "***真實姓名格式錯誤***";
			document.getElementById('deliveryname').focus();
			document.getElementById('deliveryname').select();
			return false;
		}
	}
	
	var phone = document.getElementById("deliveryphone").value;
	if(phone==''){
		document.getElementById("message").innerHTML = "***請填入手機號碼***";
		document.getElementById('deliveryphone').focus();
		return false;
	}else{
		var phoneRegxp = /^09\d{8}$/;
		if (phoneRegxp.test(phone) != true){
			document.getElementById("message").innerHTML = "***手機號碼格式錯誤***";
			document.getElementById('deliveryphone').focus();
			document.getElementById('deliveryphone').select();
			return false;
		}
	}
	
	var mail = document.getElementById("deliveryemail").value;
	if(mail==''){
		document.getElementById("message").innerHTML = "***請填入電子信箱***";
		document.getElementById('deliveryemail').focus();
		return false;
	}else{
		var mailRegxp = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
		if (mailRegxp.test(mail) != true){
			document.getElementById("message").innerHTML = "***電子信箱格式錯誤***";
			document.getElementById('deliveryemail').focus();
			document.getElementById('deliveryemail').select();
			return false;
		}
	}
	document.getElementById("message").innerHTML = ""
	
	if(mail!=0 && name!=0 && phone!=0)
	{
		console.log(mail+"/"+name+"/"+phone+"/"+payment+"/"+cartno)
		xmlHTTP.open("GET","http://localhost:8080/NW_Select/setDelivery?useUnicode=true&characterEncoding=UTF-8&mail="+mail+"&name="+name+"&phone="+phone+"&payment="+payment+"&cartno="+cartno, true);
	}
	
	xmlHTTP.onreadystatechange=function ()
	{
		if(xmlHTTP.readyState == 4)
        {
          if(xmlHTTP.status == 200)
          {
        	  document.getElementById("reg").innerHTML="<div class='spacer50'></div><h4 style='color:red'>結帳完成<br>5秒後自動前往<a href='order_history.jsp'>訂單查詢</a></h4>";
        	  setTimeout("location.href='order_history.jsp'",4000);
          }
        }
	}
	 
    xmlHTTP.send();
}

function goezship()
{
	document.forms["ezship"].submit();
}
</script>
<%
     // === 接收電子地圖回傳值 ===
     String s_processID = request.getParameter("processID")==null?"":request.getParameter("processID");
     String s_stCate = request.getParameter("stCate")==null?"":request.getParameter("stCate");
     String s_stCode = request.getParameter("stCode")==null?"":request.getParameter("stCode");
     String s_stName = request.getParameter("stName")==null?"":request.getParameter("stName");
     String s_stAddr = request.getParameter("stAddr")==null?"":request.getParameter("stAddr");
     String s_stTel = request.getParameter("stTel")==null?"":request.getParameter("stTel");
     String s_webPara = request.getParameter("webPara")==null?"":request.getParameter("webPara");

     s_stName = new String(s_stName.getBytes("ISO8859_1"),"UTF-8");
     s_stAddr = new String(s_stAddr.getBytes("ISO8859_1"),"UTF-8");
%>
	<!-- 導覽列 -->
	<jsp:include page="/page_navtop.jsp" />
	<!-- 頁籤 -->
	<jsp:include page="/page_marktop.jsp" />
	
	<!-- 購物明細頁面 -->
    <div class="container-fluid text-center cartorder_outer">
        <form>
            <div id="reg" class="row">
                <div class="col-12 col-md-6">
                    <div class="badge text-wrap cartorder_inner my-3" style="width: 100%;">
                        <h4>購物明細</h4>
                    </div>
                    <table class="table table-light table-striped">
                        <tr>
                        	<th>商品編號</th>
                            <th>商品名稱</th>
                            <th>商品單價</th>
                            <th>商品數量</th>
                            <th>金額</th>
                        </tr>
                        <%
                        String loginmail = null;
	                    String memno = null;
	                    String memname = null;
	                    String phone = null;
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
						//System.out.println("cookie:"+loginmail);
						application.setAttribute("username",loginmail);
						loginmail = String.valueOf(application.getAttribute("username"));
						//System.out.println("application:"+loginmail);
					    try {
							com.ted.SQLBean db = new com.ted.SQLBean();
							Connection conn = null;
							PreparedStatement stmt = null;
							ResultSet rs = null;
							conn = db.getconn();
							
							String sql="SELECT * FROM member WHERE email=?;";
							stmt = conn.prepareStatement(sql);
							stmt.setString(1,loginmail);
							rs = stmt.executeQuery();
						    while(rs.next()) {
						    	memname = rs.getString("mem_name");
						    	phone = rs.getString("phone");
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
                        <tr>
                        	<td><%=commno %></td>
                            <td><%=prodname %></td>
                            <td><%=pri %></td>
                            <td><%=quantity %></td>
                            <td><%=count %></td>
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
                            <td id="cartno" class="text-start" colspan="2" style="font-size:5px; vertical-align:bottom ;text-align:left;"><%=cartno %></td>
                        	<td class="text-end" colspan="2">小計</td>
                            <td><%=total %></td>
                        </tr>
                    </table>
                    <div class="payment">
                        <div class="badge text-wrap cartorder_inner my-3" style="width: 100%;">
                            <h4>付款方式</h4>
                        </div>
                        <div class="spacer15"></div>
                        <div>
                        <select id="payment" class="payment-select">
                            <option select>超商取貨貨到付款</option>
                            <option>超商取貨線上刷卡</option>
                        </select>
                        </div>
                        <div class="spacer15"></div>
                        <input name="Submit2" type="button" value="選擇門市" onclick="goezship()">
						<span><%out.print(s_stName); %></span>
                        <div class="spacer15"></div>
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="row">
                        <div class="col-12 col-md-6">
                            <div class="badge text-wrap cartorder_inner my-3" style="width: 100%;">
                                <h4>訂購人資訊</h4>
                            </div>
                            <h5 class="form-label text-start">真實姓名</h5>
                            <div class="input-group input-group-sm mb-3">
                                <input value="<%=memname %>" type="text" class="form-control form-bg" name="customername" aria-label="Sizing example input" aria-describedby="customername">
                            </div>
                            <h5 class="form-label text-start">手機</h5>
                            <div class="input-group input-group-sm mb-3">
                                <input value="<%=phone %>" type="text" class="form-control form-bg" name="customerphone" aria-label="Sizing example input" aria-describedby="customername">
                            </div>
                            <h5 class="form-label text-start">電子郵件</h5>
                            <div class="input-group input-group-sm mb-3">
                                <input value="<%=loginmail %>" type="text" class="form-control form-bg" name="customeremail" aria-label="Sizing example input" aria-describedby="customername">
                            </div>
                        
                            <form>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" checked>
                                    <label class="form-check-label" for="flexCheckDefault" onclick="cleardelivery()">
									同收件人
                                    </label>
                                  </div>
                            </form>

                        </div>
                        <div class="col-12 col-md-6">
                            <div class="badge text-wrap cartorder_inner my-3" style="width: 100%;">
                                <h4>收件人資訊</h4>
                            </div>
                            <h5 class="form-label text-start">真實姓名</h5>
                            <div class="input-group input-group-sm mb-3">
                                <input value="<%=memname %>" type="text" class="form-control form-bg" id="deliveryname" aria-label="Sizing example input" aria-describedby="customername">
                            </div>
                            <h5 class="form-label text-start">手機</h5>
                            <div class="input-group input-group-sm mb-3">
                                <input value="<%=phone %>" type="text" class="form-control form-bg" id="deliveryphone" aria-label="Sizing example input" aria-describedby="customername">
                            </div>
                            <h5 class="form-label text-start">電子郵件</h5>
                            <div class="input-group input-group-sm mb-3">
                                <input value="<%=loginmail %>" type="text" class="form-control form-bg" id="deliveryemail" aria-label="Sizing example input" aria-describedby="customername">
                            </div>
                            
                            <div class="order-btn">
                                <a class="btn btn-dark" role="button" href="product_top.jsp">繼續購物</a>
                                <a class="btn btn-dark" role="button" href="cart.jsp">返回購物車</a>
                            </div>
                        </div>
                        
                    </div>
                    <div>
                    	<span id = "message" style="color:red"> </span>
                        <button type="button" class="btn btn-danger mt-2" style="width:100%" onclick="orderdone()">送出</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="spacer50"></div>
    <!--使用 FORM SUBMIT 轉頁到電子地圖-->
						<form name="ezship" action="http://map.ezship.com.tw/ezship_map_web.jsp" method="post">
						  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse">
						    <tr>
						      <td align="center">
						        <input type="hidden" name="suID"  value="test@vgb.com"> <!-- 賣家登入ezShip的帳號，需開通網站串接服務 -->
						        <input type="hidden" name="processID" value="VGB201804230000005"> <!-- 處理序號或訂單編號，由購物網站自行提供的編號 -->
						        <input type="hidden" name="stCate" value=""> <!-- 取件門市通路代號。可帶空值 -->
						        <input type="hidden" name="stCode" value=""> <!-- 取件門市代號。可帶空值 -->
						        <input type="hidden" name="rtURL"  value="http://localhost:8080/NW_Select/cart_order.jsp"><!-- 回傳網址路徑及程式名稱。請輸入完整網站路徑網址。如  -->
						        <input type="hidden" name="webPara" value="simulationpage"> <!-- 網站所需額外判別資料。由開通網站自行提供，ezShip 將原值回傳。可帶空值 -->
						      </td>
						    </tr>
						  </table>
						</form>
    <!-- 頁尾 -->
	<jsp:include page="/page_bottom.jsp" />
	
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<!-- <script src="js/plugins.js"></script> -->
	<script src="./js/active.js"></script>
</body>

</html>
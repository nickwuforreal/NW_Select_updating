<!DOCTYPE html>
<%@ page contentType="text/html;charset=utf-8" language="java" import="java.io.*,java.util.*,java.sql.*" %>

<html>
  <head>
    <title>電子地圖連接模擬</title>
  </head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
  <body>

  <hr>
  <!--使用 FORM SUBMIT 轉頁到電子地圖-->
  <form method="post" name="simulation_from" action="https://map.ezship.com.tw/ezship_map_web.jsp">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-collapse: collapse">
      <tr>
        <td align="center">
          <input name="Submit2" type="submit" value="選擇門市">
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
  <hr>
  </body>
</html>

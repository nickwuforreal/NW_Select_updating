
//回到頁面頂端
document.querySelector("#gotop2").addEventListener
	("click",function(e)
		{
			window.scrollTo({top:0})
		}
	)

//會員註冊檢查
function checkreg()
{
	if(window.ActiveXObject)
    {
        xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
    }
    else if(window.XMLHttpRequest)
    {
        xmlHTTP=new XMLHttpRequest();
    }
	
	var mail = document.getElementById("mail").value;
	if(mail==''){
		document.getElementById("message").innerHTML = "***請填入電子信箱***";
		document.getElementById('mail').focus();
		return false;
	}else{
		var mailRegxp = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
		if (mailRegxp.test(mail) != true){
			document.getElementById("message").innerHTML = "***電子信箱格式錯誤***";
			document.getElementById('mail').focus();
			document.getElementById('mail').select();
			return false;
		}
	}
	var password = document.getElementById("passwd").value;
   if(password == "")
    {
        document.getElementById("message").innerHTML = "***請填入密碼***";
        document.getElementById('passwd').focus();
        return false;
    }
    if(password.length < 6) 
    {
        document.getElementById("message").innerHTML = "***密碼過短(長度需6~12位數)***";
        document.getElementById('passwd').focus();
		document.getElementById('passwd').select();
        return false;
    }
    if(password.length > 12)
    {
        document.getElementById("message").innerHTML = "***密碼過長(長度需6~12位數)***";
        document.getElementById('passwd').focus();
		document.getElementById('passwd').select();
        return false;
    }
    
    var name = document.getElementById("name").value;
	if(name==''){
		document.getElementById("message").innerHTML = "***請填入真實姓名***";
		document.getElementById('name').focus();
		return false;
	}else{
		var nameRegxp = /^[\u4e00-\u9fa5]+$|^[a-zA-Z\s]+$/;
		if (nameRegxp.test(name) != true){
			document.getElementById("message").innerHTML = "***真實姓名格式錯誤***";
			document.getElementById('name').focus();
			document.getElementById('name').select();
			return false;
		}
	}
	
	var birth = document.getElementById("birth").value;
	if(birth==''){
		document.getElementById("message").innerHTML = "***請選擇生日***";
		document.getElementById('birth').focus();
		return false;
	}
	
	var phone = document.getElementById("phone").value;
	if(phone==''){
		document.getElementById("message").innerHTML = "***請填入手機號碼***";
		document.getElementById('phone').focus();
		return false;
	}else{
		var phoneRegxp = /^09\d{8}$/;
		if (phoneRegxp.test(phone) != true){
			document.getElementById("message").innerHTML = "***手機號碼格式錯誤***";
			document.getElementById('phone').focus();
			document.getElementById('phone').select();
			return false;
		}
	}
	document.getElementById("message").innerHTML = ""
	
	if(mail!=0 && password!=0 && name!=0 && birth!=0 && phone!=0)
	{
		xmlHTTP.open("GET","http://localhost:8080/NW_Select/setRegister?useUnicode=true&characterEncoding=UTF-8&mail="+mail+"&passwd="+password+"&name="+name+"&birth="+birth+"&phone="+phone, true);
	}
	
	xmlHTTP.onreadystatechange=function ()
	{
		if(xmlHTTP.readyState == 4)
        {
          if(xmlHTTP.status == 200)
          {
        	  document.getElementById("reg").innerHTML="<div class='spacer50'></div><h4 style='color:red'>註冊完成<br>5秒後自動返回<a href='login.jsp'>會員登入</a></h4>";
        	  setTimeout("location.href='login.jsp'",4000);
          }
        }
	}
	 
    xmlHTTP.send();
}
//會員登入檢查
function checklogin()
{
	var loginmail=document.getElementById("loginmail").value;
	if(loginmail==''){
		document.getElementById("loginmessage").innerHTML = "請填入電子信箱";
		document.getElementById('loginmail').focus();
		return false;
	}else{
		var mailRegxp = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
		if (mailRegxp.test(loginmail) != true){
			document.getElementById("loginmessage").innerHTML = "電子信箱格式錯誤";
			document.getElementById('loginmail').focus();
			document.getElementById('loginmail').select();
			return false;
		}
	}
	
	var loginpwd=document.getElementById("loginpwd").value;
	if(loginpwd == "")
    {
        document.getElementById("loginmessage").innerHTML = "***請填入密碼***";
        document.getElementById('loginpwd').focus();
        return false;
    }
    if(loginpwd.length < 6) 
    {
        document.getElementById("loginmessage").innerHTML = "***密碼過短(長度需6~12位數)***";
        document.getElementById('loginpwd').focus();
		document.getElementById('loginpwd').select();
		return false;
    }
    if(loginpwd.length > 12)
    {
        document.getElementById("loginmessage").innerHTML = "***密碼過長(長度需6~12位數)***";
        document.getElementById('loginpwd').focus();
		document.getElementById('loginpwd').select();
		return false;
    }
    document.getElementById("loginmessage").innerHTML = ""
    login.submit();
}
//加入購物車
function addcart()
{
	if(window.ActiveXObject)
    {
        xmlHTTP=new ActiveXObject("Microsoft.XMLHTTP");
    }
    else if(window.XMLHttpRequest)
    {
        xmlHTTP=new XMLHttpRequest();
    }
	
	var qty=document.getElementById("quantity").value;
	var prodn=document.getElementById("prodname").innerText;
	
	if(qty!=0)
	{
		xmlHTTP.open("GET","http://localhost:8080/NW_Select/addCart?useUnicode=true&characterEncoding=UTF-8&prodname="+prodn+"&quantity="+qty, true);
	}
	
	xmlHTTP.onreadystatechange=function ()
	{
		if(xmlHTTP.readyState == 4)
        {
          if(xmlHTTP.status == 200)
          {
        	  document.getElementById("cartmsg").innerHTML="<h6 style='color:red'>已加入購物車</h6>";
          }
        }
	}
	 
    xmlHTTP.send();
}


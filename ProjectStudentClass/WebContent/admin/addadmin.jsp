<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.project.servlet.AddAdminServlet,com.project.servlet.ExistAdminServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function judge(){
	var a = document.getElementById("admin").value;
	var ap = document.getElementById("adminpassword").value;
	var rp = document.getElementById("repassword").value;
	if(a==null||a.length==0){
		alert("管理员账号不能为空");
		return;
	}
	if(ap==null||ap.length==0){
		alert("管理员密码不能为空");
		return;
	}
	if(ap==null||ap.length==0){
		alert("请确认密码");
		return;
	}
	if(rp!=ap){
		alert("两次密码不一致，请重新输入");
		return;
	}
	document.getElementById("table").submit();
}
var xmlHttp;
var flag;
function createXMLHttp(){
	if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}
	else{
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
}
function checkadmin(admin){
	createXMLHttp();
	xmlHttp.open("POST","../ExistAdminServlet?admin="+admin);
	xmlHttp.onreadystatechange = checkAdminCallback;
	xmlHttp.send(null);
	document.getElementById("msg").innerHTML="正在验证……";
}
function checkAdminCallback(){
	if(xmlHttp.readyState==4){
		if(xmlHttp.status==200){
			var text = xmlHttp.responseText;
			if(text=="true"){
				flag=false;
				document.getElementById("msg").innerHTML="用户名重复，无法使用";
			}
			else{
				flag=true;
				document.getElementById("msg").innerHTML="此用户名可用";
			}
		}
	}
}
function checkform(){
	return flag;
}
</script>
</head>
<body>
<form action="../AddAdminServlet" method="post" id="table" onsubmit="checkform()">
管理员账号：<input name="admin" id="admin"  onblur="checkadmin(this.value)"><span id="msg"></span><br>
管理员密码：<input type="password" name="adminpassword" id="adminpassword"><br>
请确认密码：<input type="password" name="repassword" id="repassword"><br>
<input type="button" value="添加" onClick="judge()">
<input type="button" id="back" value="返回" onClick="javascript:history.go(-1)">
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.project.servlet.AdminAddStudentServlet,com.project.servlet.ExistStudentServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function judge(){
	var u=document.getElementById("username").value;
	var p=document.getElementById("password").value;
	var rp=document.getElementById("repassword").value;
	var rn=document.getElementById("realname").value;
	if(u==null||u.length==0){
		alert("用户名不能为空");
		return;
	}
	if(p==null||p.length==0){
		alert("密码不能为空");
		return;
	}
	if(rp==null||rp.length==0){
		alert("请确认密码");
		return;
	}
	if(rp!=p){
		alert("两次密码不一致，请重新输入");
		return;
	}
	if(rn==null||rn.length==0){
		alert("真实姓名不能为空");
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
function checkusername(username){
	createXMLHttp();
	xmlHttp.open("POST","../ExistStudentServlet?username="+username);
	xmlHttp.onreadystatechange = checkUsernameCallback;
	xmlHttp.send(null);
	document.getElementById("msg").innerHTML="正在验证……";
}
function checkUsernameCallback(){
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
<form action="../AdminAddStudentServlet" id="table" method="post" onsubmit="checkform()">
用户名：<input name="username" id="username" onblur="checkusername(this.value)"><span id="msg"></span><br>
密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="password" id="password"><br>
确认密码：<input type="password" name="repassword" id="repassword"><br>
真实姓名：<input name="realname" id="realname"><br>
<input type="button" value="注册" onClick="judge()">
</form>
</body>
</html>
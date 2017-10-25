<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.project.servlet.AdminCheckServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function judge(){
	var a=document.getElementById("admin").value;
	var ap=document.getElementById("adminpassword").value;
	if(a==null||a.length==0){
		alert("请输入账号");
		return;
	}
	if(ap==null||ap.length==0){
		alert("请输入密码");
		return;
	}
	document.getElementById("table").submit();
}
</script>
</head>
<body>
<form action="../AdminCheckServlet" id="table">
管理员账号：<input name="admin" id="admin">
管理员口令：<input type="password" name="adminpassword" id="adminpassword">
<input type="button" value="登录" onClick="judge()">
</form>
</body>
</html>
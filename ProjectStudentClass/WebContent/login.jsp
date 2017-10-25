<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.project.servlet.CheckStudentServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function judge(){
	var u=document.getElementById("username").value;
	var p=document.getElementById("password").value;
	if(u==null||u.length==0){
		alert("请输入用户名");
	}
	if(p==null||p.length==0){
		alert("请输入密码");
	}
	document.getElementById("table").submit();
}
</script>
</head>
<body>
<center>
<form action="CheckStudentServlet" id="table" method="post">
用户名：<input name="username" id="username"><br>
密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="password" id="password"><br>
<input type="button" value="登录" onClick="judge()"><br>
<a href="register.jsp">注册</a>
<a href="teacher/teacherlogin.jsp">教师通道</a>
<a href="admin/adminlogin.jsp">管理员登录</a>
</form>
</center>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.project.servlet.CheckTeacherServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function judge(){
	var t=document.getElementById("teachername").value;
	var p=document.getElementById("password").value;
	if(t==null||t.length==0){
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
<form action="../CheckTeacherServlet" id="table" method="post">
用户名：<input name="teachername" id="teachername"><br>
密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="password" id="password"><br>
<input type="button" value="登录" onClick="judge()"><br>
<a href="register.jsp">注册</a>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.project.servlet.UpdateTeacherServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function judge(){
	var p = document.getElementById("password").value;
	var rp = document.getElementById("repassword").value;
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
	document.getElementById("table").submit();
}
</script>
</head>
<body>
<form action="../UpdateTeacherServlet" method="post" id="table">
教师用户名：<input name="name" value="${teachername }" disabled="disabled">
<input type="hidden" name="teachername" value="${teachername }"><br>
教师密码：<input name="password" id="password"><br>
请确认密码：<input name="repassword" id="repassword"><br>
<input type="button" value="修改" onClick="judge()">
</form>
</body>
</html>
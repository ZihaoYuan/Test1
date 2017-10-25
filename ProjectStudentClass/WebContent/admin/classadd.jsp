<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.project.servlet.AddClassesServlet,com.project.servlet.ExistClassServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function judge(){
	var c=document.getElementById("classname").value;
	var ct=document.getElementById("classtime").value;
	if(c==null||c.length==0){
		alert("课程名不能为空");
		return;
	}
	if(ct==null||ct.length==0){
		alert("课程时间不能为空");
		return;
	}
	document.getElementById("table").submit();
}
</script>
</head>
<body>
<form action="../AddClassesServlet" method="post" id="table">
课程名称：<input id="classname" name="classname"><br>
课程时间：<input id="classtime" name="classtime"><br>
<input type="button" value="添加" onClick="judge()">
</form>
</body>
</html>
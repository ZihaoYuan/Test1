<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>您好，${teachername }老师</center>
<form action="checkclass.jsp" method="post">
<input type="hidden" value="${teachername }" name="teachername">
<input value="查看课程时间" type="submit">
</form>
<input value="选择课程及时间" type="button" onClick="window.location.href='ChooseTime.jsp';"><br>
<form action="update.jsp">
<input type="submit" value="修改密码"><br>
<a class=menuChild onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="../login.jsp" target=_top>退出系统</a>
</form>
</body>
</html>
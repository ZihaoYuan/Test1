<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table height="100%" cellSpacing=0 cellPadding=0 width=170 border=0>
<tr>
<td>
<a href="chooseadd.jsp" target="right">添加用户</a>
</td>
<td>
<a href="userlist.jsp" target="right">用户列表</a>
</td>
<td>
<a href="classlist.jsp" target="right">课程列表</a>
</td>
<td>
<a href="addadmin.jsp" target="right">添加管理员</a>
</td>
<td>
<a href="updateadmin.jsp" target="right">修改管理员</a>
</td>
<td><a class=menuChild onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="../login.jsp" target=_top>退出系统</a>
</td>
</tr>
</table>
</body>
</html>
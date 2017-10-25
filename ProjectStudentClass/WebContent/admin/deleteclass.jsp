<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.project.driver.ConnectionManager,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String ids=request.getParameter("id");
String got=request.getParameter("currentPage");
int id=Integer.parseInt(ids);
int gotten=Integer.parseInt(got);
Connection conn=ConnectionManager.getConnection();
String sql="delete from class where classid=?";
PreparedStatement ps=conn.prepareStatement(sql);
ps.setInt(1,id);
ps.execute();
ps.close();
conn.close();
response.sendRedirect("main.jsp");
%>
</body>
</html>
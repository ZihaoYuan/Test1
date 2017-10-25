<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,com.project.driver.ConnectionManager,java.io.PrintWriter,com.project.servlet.CheckStudentServlet,com.project.javabean.Teacher" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
Connection conn = ConnectionManager.getConnection();
String t = request.getParameter("teachername");
String ids = request.getParameter("classid");
String cn = request.getParameter("classname");
String ct = request.getParameter("classtime");
int ci = Integer.parseInt(ids);
String sql = "insert into "+t+" values (?,?,?)";
PreparedStatement ps = null;
ps = conn.prepareStatement(sql);
ps.setInt(1, ci);
ps.setString(2, cn);
ps.setString(3, ct);
ps.execute();
ps.close();
conn.close();
response.sendRedirect("main.jsp");
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.project.javabean.Teacher,com.project.driver.ConnectionManager,java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
Teacher tea = new Teacher();
String teachername = tea.getTeachername();
String sql = "drop table "+teachername;
Connection conn = ConnectionManager.getConnection();
Statement st = conn.createStatement();
st.executeUpdate(sql);
st.close();
conn.close();
response.sendRedirect("main.jsp");
%>
</body>
</html>
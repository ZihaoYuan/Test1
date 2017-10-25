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
欢迎，${admin }
<center>课程列表</center>
<center><a href="classadd.jsp">添加课程</a></center>
<center><table width="500" border=1>
<%
int pageSize=5;
int totalPage=0;
int totalItem=0;
int currentPage=0;
Connection conn=ConnectionManager.getConnection();
Statement st=conn.createStatement();
String sql="select count(*) from class";
ResultSet rs=st.executeQuery(sql);
rs.next();
totalItem=rs.getInt(1);
totalPage=totalItem%pageSize==0?totalItem/pageSize:totalItem/pageSize+1;
String r=request.getParameter("currentPage");
if(r==null){
	currentPage=1;
}
else{
	currentPage=Integer.parseInt(r);
	if(currentPage<=0){
		currentPage=1;
	}
	else if(currentPage>totalPage){
		currentPage=totalPage;
	}
}
sql = "select * from class limit ?,?";
PreparedStatement ps=conn.prepareStatement(sql);
ps.setInt(1, (currentPage-1)*pageSize);//第一个参数
ps.setInt(2, pageSize);//第二个参数
rs=ps.executeQuery();
while(rs.next()){
	%>
	<tr><td><center><%=rs.getInt(1) %></center></td>
	<td><center><%=rs.getString(2) %></center></td>
	<td><center><%=rs.getString(3) %></center></td>
	<td><a href="deleteclass.jsp?id=<%=rs.getInt(1) %>&currentPage=<%=currentPage%>">删除</a></td>
	</tr>
	<%
}
rs.close();
ps.close();
st.close();
conn.close();
%>
<tr><td colspan="4"><center>
<a href="classlist.jsp?currentPage=1">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="classlist.jsp?currentPage=<%=currentPage-1 %>">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
<%
for(int i=currentPage-5;i<currentPage;i++){
	if(i>0){
		
	%>
	<a href="classlist.jsp?currentPage=<%=i %>"><%=i %></a>
	<%
	}
}
out.print(currentPage);
for(int i=currentPage+1;i<currentPage+5;i++){
	if(i<totalPage){
		
	%>
	<a href="classlist.jsp?currentPage=<%=i %>"><%=i %></a>
	<%
	}
}
%>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="classlist.jsp?currentPage=<%=currentPage+1 %>">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a href="classlist.jsp?currentPage=<%=totalPage %>">末页</a></center>
</td></tr>
<tr><td colspan="4"><center>
第<%=currentPage %>页
</center>
</td></tr>
</table>
<input type="button" id="back" value="返回" onClick="javascript:history.go(-1)">
</center>
</body>
</html>
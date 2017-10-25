package com.project.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.StudentDao;
import com.project.driver.ConnectionManager;
import com.project.javabean.Student;

/**
 * Servlet implementation class AddStudentServlet
 */
public class AddStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		Connection conn = ConnectionManager.getConnection();
		Statement st = null;
		String u=request.getParameter("username");
		String p=request.getParameter("password");
		String r=request.getParameter("realname");
		Student stu=new Student();
		stu.setUsername(u);
		stu.setPassword(p);
		stu.setRealname(r);
		StudentDao sql=new StudentDao();
		sql.add(stu);
		try {
			st = conn.createStatement();
			st.executeUpdate("create table "+u+" (classid int,classname varchar(20),classtime varchar(50))");
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("login.jsp");
	}

}

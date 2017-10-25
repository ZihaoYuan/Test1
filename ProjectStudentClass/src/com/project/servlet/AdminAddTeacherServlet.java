package com.project.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.TeacherDao;
import com.project.driver.ConnectionManager;
import com.project.javabean.Teacher;

/**
 * Servlet implementation class AdminAddTeacherServlet
 */
public class AdminAddTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddTeacherServlet() {
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
		String t=request.getParameter("teachername");
		String p=request.getParameter("password");
		String r=request.getParameter("realname");
		String c=request.getParameter("classname");
		Teacher tea=new Teacher();
		tea.setTeachername(t);
		tea.setPassword(p);
		tea.setRealname(r);
		tea.setClassname(c);
		TeacherDao sql=new TeacherDao();
		sql.add(tea);
		try {
			st = conn.createStatement();
			st.executeUpdate("create table "+t+" (classid int,classname varchar(20),classtime varchar(50))");
			st.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("admin/chooseadd.jsp");
	}

}

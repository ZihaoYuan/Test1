package com.project.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.driver.ConnectionManager;
import com.project.javabean.Student;

/**
 * Servlet implementation class CheckServlet
 */
public class CheckStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public CheckStudentServlet() {
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
		String u=request.getParameter("username");
		String p=request.getParameter("password");
		
		Student stu = new Student();
		stu.setUsername(u);
		
		Connection conn=ConnectionManager.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		
        try {
        	String sql="select * from student where username=? and password=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,u);
			ps.setString(2,p);
			rs=ps.executeQuery();
			
			if(rs.next()){//用户可以登录
				HttpSession session=request.getSession(true);
				session.setAttribute("username", u);
				response.sendRedirect("stu/main.jsp");
			}
			else{
				response.sendRedirect("login.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
        finally{
        	try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        	try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        	try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }
	}

}

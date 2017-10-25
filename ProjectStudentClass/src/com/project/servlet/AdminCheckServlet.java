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

/**
 * Servlet implementation class AdminCheckServlet
 */
public class AdminCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCheckServlet() {
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
		String a=request.getParameter("admin");
		String ap=request.getParameter("adminpassword");
		
		Connection conn=ConnectionManager.getConnection();
		PreparedStatement ps=null;
		ResultSet rs=null;
		
        try {
        	String sql="select * from admin where admin=? and adminpassword=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,a);
			ps.setString(2,ap);
			rs=ps.executeQuery();
			
			if(rs.next()){//管理员可以登录
				HttpSession session=request.getSession(true);
				session.setAttribute("admin", a);
				response.sendRedirect("admin/index.jsp");
			}
			else{
				response.sendRedirect("admin/adminlogin.jsp");
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

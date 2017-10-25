package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.project.driver.ConnectionManager;
import com.project.javabean.Teacher;

public class TeacherDao {
	
public void add(Teacher tea){
		
		Connection conn = ConnectionManager.getConnection();
		String sql="insert into teacher(id,teachername,realname,password,classname) values(default,?,?,?,?)";
		PreparedStatement ps=null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, tea.getTeachername());
			ps.setString(2, tea.getRealname());
			ps.setString(3, tea.getPassword());
			ps.setString(4, tea.getClassname());
			ps.execute();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
public void update(Teacher tea){
	Connection conn = ConnectionManager.getConnection();
	String sql = "update teacher set password=? where teachername=?";
	PreparedStatement ps = null;
	try {
		ps = conn.prepareStatement(sql);
		ps.setString(1, tea.getPassword());
		ps.setString(2, tea.getTeachername());
		ps.execute();
		ps.close();
		conn.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
public Teacher getTeacher(){
	return null;
}

}

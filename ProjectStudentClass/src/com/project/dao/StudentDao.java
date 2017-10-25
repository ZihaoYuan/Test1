package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.project.javabean.Student;
import com.project.driver.ConnectionManager;

public class StudentDao {

public void add(Student stu){
		
		Connection conn = ConnectionManager.getConnection();
		String sql="insert into student(id,username,realname,password) values(default,?,?,?)";
		PreparedStatement ps=null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, stu.getUsername());
			ps.setString(2, stu.getRealname());
			ps.setString(3, stu.getPassword());
			ps.execute();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
public void update(Student stu){
	Connection conn = ConnectionManager.getConnection();
	String sql = "update student set password=? where username=?";
	PreparedStatement ps = null;
	try {
		ps = conn.prepareStatement(sql);
		ps.setString(1, stu.getPassword());
		ps.setString(2, stu.getUsername());
		ps.executeUpdate();
		ps.close();
		conn.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
public Student getStudent(){
	return null;
}
	
}

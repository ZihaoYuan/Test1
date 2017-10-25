package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.project.javabean.Classes;
import com.project.driver.ConnectionManager;

public class ClassesDao {

	public void add(Classes cla){
		
		Connection conn = ConnectionManager.getConnection();
		String sql = "insert into class (classid,classname,classtime) values(default,?,?)";
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, cla.getClassname());
			ps.setString(2, cla.getClasstime());
			ps.execute();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public Classes getClasses(){
		return null;
	}
	
}

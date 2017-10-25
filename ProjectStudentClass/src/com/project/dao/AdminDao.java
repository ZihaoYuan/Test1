package com.project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.project.driver.ConnectionManager;
import com.project.javabean.Admin;

public class AdminDao {

	public void add(Admin adm){
		
		Connection conn = ConnectionManager.getConnection();
		String sql="insert into admin (id,admin,adminpassword) values (default,?,?)";
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, adm.getAdmin());
			ps.setString(2, adm.getAdminpassword());
			ps.execute();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void update(Admin adm){
		Connection conn = ConnectionManager.getConnection();
		String sql = "update admin set adminpassword=? where admin=?";
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, adm.getAdminpassword());
			ps.setString(2, adm.getAdmin());
			ps.execute();
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Admin getAdmin(){
		return null;
	}
	
}

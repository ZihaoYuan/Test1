package com.project.javabean;

import java.io.Serializable;

public class Admin implements Serializable {

	public Admin(){
		super();
	}
	
	private String admin;
	private String adminpassword;
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getAdminpassword() {
		return adminpassword;
	}
	public void setAdminpassword(String adminpassword) {
		this.adminpassword = adminpassword;
	}
	
	
}

package com.project.javabean;

import java.io.Serializable;

public class Classes implements Serializable {

	public Classes(){
		super();
	}
	
	private int classid;
	private String classname;
	private String classtime;
	public String getClasstime() {
		return classtime;
	}
	public void setClasstime(String classtime) {
		this.classtime = classtime;
	}
	public int getClassid() {
		return classid;
	}
	public void setClassid(int classid) {
		this.classid = classid;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	
}

package com.yc.bean;

public class User {
	private int uid;
	private String uname;
	private String pwd;
	private String email;
	private int status;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public User(int uid, String uname, String pwd, String email, int status) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.pwd = pwd;
		this.email = email;
		this.status = status;
	}
	public User() {
		super();
	}
	
}

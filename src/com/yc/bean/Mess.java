package com.yc.bean;

public class Mess {
	public int mid;
	public String pname;
	public String email;
	public String addr;
	public String mess;
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMess() {
		return mess;
	}
	public void setMess(String mess) {
		this.mess = mess;
	}
	public Mess(int mid, String pname, String email, String addr, String mess) {
		super();
		this.mid = mid;
		this.pname = pname;
		this.email = email;
		this.addr = addr;
		this.mess = mess;
	}
	public Mess() {
		super();
	}
}

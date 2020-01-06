package com.yc.bean;

public class Sight {
	private int sid;
	private String sname;
	private String sinfo;
	private int price;
	private String photo;
	private int cid;
	private String cname;
	private int pid;
	private String pname;
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSinfo() {
		return sinfo;
	}
	public void setSinfo(String sinfo) {
		this.sinfo = sinfo;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Sight(int sid, String sname, String sinfo, int price, String photo, int cid, String cname, int pid,
			String pname) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.sinfo = sinfo;
		this.price = price;
		this.photo = photo;
		this.cid = cid;
		this.cname = cname;
		this.pid = pid;
		this.pname = pname;
	}
	public Sight() {
		super();
	}
	
	
	
}

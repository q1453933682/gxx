package com.yc.bean;

public class Order {
	private String pname;
	private String cname;
	private String sname; 
	private int price;
	private int uid;
	private int did;
	private int sid;
	private String goday;
	private String backday;
	private int room;
	private int adult;
	private int children;
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getGoday() {
		return goday;
	}
	public void setGoday(String goday) {
		this.goday = goday;
	}
	public String getBackday() {
		return backday;
	}
	public void setBackday(String backday) {
		this.backday = backday;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getChildren() {
		return children;
	}
	public void setChildren(int children) {
		this.children = children;
	}
	public Order(String pname, String cname, String sname, int price, int uid, int did, int sid, String goday,
			String backday, int room, int adult, int children) {
		super();
		this.pname = pname;
		this.cname = cname;
		this.sname = sname;
		this.price = price;
		this.uid = uid;
		this.did = did;
		this.sid = sid;
		this.goday = goday;
		this.backday = backday;
		this.room = room;
		this.adult = adult;
		this.children = children;
	}
	public Order() {
		super();
	}
	
	
}

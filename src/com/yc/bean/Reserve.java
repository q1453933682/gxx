package com.yc.bean;

public class Reserve {
	public int did;
	public int uid;
	public int sid;
	public String goday;
	public String backday;
	public int room;
	public int adult;
	public int children;
	
	public Reserve() {
		super();
	}

	public Reserve(int did, int uid, int sid, String goday, String backday, int room, int adult, int children) {
		super();
		this.did = did;
		this.uid = uid;
		this.sid = sid;
		this.goday = goday;
		this.backday = backday;
		this.room = room;
		this.adult = adult;
		this.children = children;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
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
	
	
}

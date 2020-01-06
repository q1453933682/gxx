package com.yc.biz;

public interface ReserveBiz {
	/**
	 * @param uid
	 * @param sid
	 * @param goday
	 * @param backday
	 * @param room
	 * @param adult
	 * @param children
	 * @return
	 */
	public int purchase(int uid,int sid,String goday,String backday,int room,int adult,int children);


}

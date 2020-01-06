package com.yc.biz;

import java.util.List;

import com.yc.bean.Order;

public interface OrderBiz {
	/**
	 * 
	 * @param uid		用户id
	 * @param did		订单id
	 * @param sid		景点id
	 * @return
	 */
	public List<Order> userInfo(int uid);
	/**
	 * 
	 * @param uid
	 * @return
	 */
	public int del(int did);
}

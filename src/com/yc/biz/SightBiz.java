package com.yc.biz;

import java.util.List;

import com.yc.bean.Sight;

public interface SightBiz {
	/**
	 * 
	 * @param pid       地区编号                                若用不到设为0即可
	 * @param cid       国家编号                                若用不到设为0即可
	 * @param name      查询用到的关键字                  若用不到设为空即可
	 * @param start     限制查询的起始位置              不需要时可以设置成任意数值
	 * @param limitnum  限制查询的位数                     不需要时设置为0
	 * @return
	 */
	public List<Sight> findSight(int pid,int cid,String name,int start,int limitnum);
	
	public List<Sight> findAllsight();

	public List<Sight> findSight(int sid);
	
	public int setprice(int newprice,int sid);
}

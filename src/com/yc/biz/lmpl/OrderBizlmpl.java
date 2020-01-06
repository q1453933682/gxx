package com.yc.biz.lmpl;

import java.util.ArrayList;
import java.util.List;

import com.yc.bean.Order;
import com.yc.biz.OrderBiz;
import com.yc.dao.DBHelper;

public class OrderBizlmpl implements OrderBiz {
	DBHelper db=new DBHelper();
	


	@Override
	public List<Order> userInfo(int uid) {
		String sql="select p.pname,c.cname,s.sname,s.price,e.* from sights s,user u,end e,path p,country c where s.sid=e.sid and e.uid=u.uid and s.cid=c.cid and c.pid=p.pid and e.uid="+uid;
		List<Order> list=db.find(sql,null,Order.class );
		return list;
	}



	@Override
	public int del(int did) {
		String sql="delete from end where did=?";
		List<Object> params=new ArrayList<Object>();
		params.add(did);
		int result=db.doUpdate(sql, params);
		return result;
	}

}

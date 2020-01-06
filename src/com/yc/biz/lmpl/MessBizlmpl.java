package com.yc.biz.lmpl;

import java.util.ArrayList;
import java.util.List;


import com.yc.bean.User;
import com.yc.biz.MessBiz;

import com.yc.dao.DBHelper;

public class MessBizlmpl implements MessBiz {
	DBHelper db=new DBHelper();

	@Override
	public int sendmess(String pname, String email, String addr, String mess) {
		String sql="insert into message values(null,?,?,?,?)";
		List<Object> params=new ArrayList<Object>();
		params.add(pname);
		params.add(email);
		params.add(addr);
		params.add(mess);
		
		int result=db.doUpdate(sql, params);
		
		return result;
	}

}

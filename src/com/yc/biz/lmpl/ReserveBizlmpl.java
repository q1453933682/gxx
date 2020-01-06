package com.yc.biz.lmpl;

import java.util.ArrayList;
import java.util.List;

import com.yc.biz.ReserveBiz;
import com.yc.dao.DBHelper;

public class ReserveBizlmpl implements ReserveBiz {
	DBHelper db=new DBHelper();

	@Override
	public int purchase(int uid,int sid, String goday, String backday, int room, int adult, int children) {
		String sql="insert into end values(null,?,?,?,?,?,?,?)";
		List<Object> params=new ArrayList<Object>();
		params.add(uid);
		params.add(sid);
		params.add(goday);
		params.add(backday);
		params.add(room);
		params.add(adult);
		params.add(children);
		
		int result=db.doUpdate(sql, params);
		
		return result;
	}

}

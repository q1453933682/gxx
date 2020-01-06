package com.yc.biz.lmpl;

import java.util.ArrayList;
import java.util.List;

import com.yc.bean.Sight;
import com.yc.biz.SightBiz;
import com.yc.dao.DBHelper;

public class SightBizImpl implements SightBiz {
	DBHelper db=new DBHelper();
	
	@Override
	public List<Sight> findSight(int pid, int cid, String name,int start,int limitnum) {
		
		String sql ="";
		List<Object> params=new ArrayList<Object>();
		if(limitnum>0){
			sql="select p.pname,s.*,c.cname from sights s,country c,path p where s.cid=c.cid and c.pid=p.pid and c.pid=? limit ?,?";
			params.add(pid);
			params.add(start);
			params.add(limitnum);
		}else{
			if(name==""||name==null){
				if(pid==0&&cid!=0){
					sql="select p.pname,s.*,c.cname from sights s,country c,path p where s.cid=c.cid and c.pid=p.pid and s.cid=?";
					params.add(cid);
				}else if(pid!=0&&cid==0){
					sql="select p.pname,s.*,c.cname from sights s,country c,path p where s.cid=c.cid and c.pid=p.pid and c.pid=?";
					params.add(pid);
				}else if(pid!=0&&cid!=0){
					sql="select p.pname,s.*,c.cname from sights s,country c,path p where s.cid=c.cid and c.pid=p.pid and c.pid=? and s.cid=?";
					params.add(pid);
					params.add(cid);
				}
			}else{
				if(cid==0&&pid==0){
					sql="select p.pname,s.*,c.cname from sights s,country c,path p where s.cid=c.cid and c.pid=p.pid and p.pname=? or s.sname=? or c.cname=?";
					params.add(name);
					params.add(name);
					params.add(name);
				}else if(cid==0&&pid!=0){
					sql="select p.pname,s.*,c.cname from sights s,country c,path p where s.cid=c.cid and c.pid=p.pid and p.pname=? or s.sname=? or c.cname=? and c.pid=?";
					params.add(name);
					params.add(name);
					params.add(name);
					params.add(pid);
				}else if(cid!=0&&pid==0){
					sql="select p.pname,s.*,c.cname from sights s,country c,path p where s.cid=c.cid and c.pid=p.pid and p.pname=? or s.sname=? or c.cname=? and s.cid=?";
					params.add(name);
					params.add(name);
					params.add(name);
					params.add(cid);
				}
			}
		}
		List<Sight> list=db.find(sql, params, Sight.class);
		return list;
	}

	@Override
	public List<Sight> findAllsight() {
		String sql="select p.pname,s.*,c.cname from sights s,country c,path p where s.cid=c.cid and c.pid=p.pid";
		List<Sight> list=db.find(sql, null, Sight.class);
		return list;
	}
	
	@Override
	public List<Sight> findSight(int sid) {
		String sql="select p.pname,s.*,c.cname from sights s,country c,path p where s.cid=c.cid and c.pid=p.pid and sid="+sid;
		List<Sight> list=db.find(sql, null, Sight.class);
		
		return list;
	}

	@Override
	public int setprice(int newprice, int sid) {
		String sql="update sights set price=? where sid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(newprice);
		params.add(sid);
		int result=db.doUpdate(sql, params);
		return result;
	}
}

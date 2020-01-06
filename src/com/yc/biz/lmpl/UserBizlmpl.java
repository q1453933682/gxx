package com.yc.biz.lmpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.yc.bean.User;
import com.yc.biz.UserBiz;
import com.yc.dao.DBHelper;

public class UserBizlmpl implements UserBiz {

	DBHelper db=new DBHelper();

	@Override
	public int reg(String uname, String pwd ,String email) {
		String sql="insert into user values(null,?,?,?,null,0)";
		List<Object> params=new ArrayList<Object>();
		params.add(uname);
		params.add(pwd);
		params.add(email);
		
		int result=db.doUpdate(sql, params);
		
		return result;
	}

	@Override
	public User login(String email, String pwd) {
		String sql="select * from user where email=? and pwd=?";
		List<Object> params=new ArrayList<Object>();
		params.add(email);
		params.add(pwd);
		
		List<User> list=db.find(sql, params, User.class);
		if( list.size()>0 ){
			return list.get(0);
		}else{
			return null;
		}
	}

	@Override
	public int judge(String email, String pwd) {
		String sql="select * from user where email=? and pwd=?";
		List<Object> params=new ArrayList<Object>();
		params.add(email);
		params.add(pwd);
		
		List<User> list=db.find(sql, params, User.class);
		if( list.size()>0 ){
			return 0;
		}else{
			return 1;
		}
	}

	@Override
	public int changename(String newname, int uid) {
		String sql="update user set uname=? where uid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(newname);
		params.add(uid);
		int result=db.doUpdate(sql, params);
		return result;
	}

	@Override
	public int checkpwd(String oldpwd, int uid) {
		String sql="select * from user where uid="+uid;
		List<Map<String, String>> list=db.findAll(sql, null);
		String pwd=list.get(0).get("pwd");
		if(oldpwd.equals(pwd)){
			return 1;
		}else{
			return 0;
		}
	}

	@Override
	public int changepwd(String newpwd, int uid) {
		String sql="update user set pwd=? where uid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(newpwd);
		params.add(uid);
		int result=db.doUpdate(sql, params);
		return result;
	}

	@Override
	public List<User> findAlluser() {
		String sql="select * from user";
		List<User> list=db.find(sql, null, User.class);
		return list;
	}

	@Override
	public int changestatus(int uid) {
		String sql="select * from user where uid="+uid;
		List<User> user=db.find(sql, null, User.class);
		int status=user.get(0).getStatus();
		String sql1="";
		if(status==0){
			sql1="update user set status=2 where uid="+uid;
		}else if(status==2){
			sql1="update user set status=0 where uid="+uid;
		}
		int result=db.doUpdate(sql1, null);
		return result;
	}
	


    @Override
	public int reset(int uid, String pwd) {
		String sql="update user set pwd=? where uid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(pwd);
		params.add(uid);
		int result=db.doUpdate(sql, params);
		
		return result;
	}
    
    @Override
	public int xiugai(String uname,int uid) {
		String sql="update user set uname=? where uid=?";
		List<Object> params=new ArrayList<Object>();
		params.add(uname);
		params.add(uid);
		int result=db.doUpdate(sql, params);
		
		return result;
	}

}
package com.yc.biz;

import java.util.List;

import com.yc.bean.User;

public interface UserBiz{
	
	/**
	 * 
	 * @param uname  账号
	 * @param pwd	 密码
	 * @param email  邮箱
	 * @return
	 */
	public int reg(String uname,String pwd, String email);
	/**
	 * 
	 * @param email		登录邮箱
	 * @param pwd		登录密码
	 * @return
	 */
	public User login(String email,String pwd);
	/**
	 * 
	 * @param email     邮箱
	 * @param pwd       密码
	 * @return
	 */
	public int judge(String email,String pwd);
	/**
	 * 
	 * @param newname   新的用户名
	 * @param uid       用户的编号
	 * @return
	 */
	public int changename(String newname,int uid);
	/**
	 * 
	 * @param newpwd    旧的密码
	 * @param uid       用户编号
	 * @return
	 */
	public int checkpwd(String oldpwd,int uid);
	/**
	 * 
	 * @param newpwd    新的密码
	 * @param uid       用户编号
	 * @return
	 */
	public int changepwd(String newpwd,int uid);
	/**
	 * 
	 * @return
	 */
	public List<User> findAlluser();
	/**
	 * 
	 * @param uid   用户id
	 * @return
	 */
	public int changestatus(int uid);
	/**
	 * 
	 * @param uid
	 * @param pwd
	 * @return
	 */
	public int reset(int uid,String pwd);
	/**
	 * 
	 * @param uname
	 * @param uid
	 * @return
	 */
	public int xiugai(String uname, int uid);
}

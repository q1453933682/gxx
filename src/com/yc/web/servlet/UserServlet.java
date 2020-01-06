package com.yc.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yc.bean.User;
import com.yc.biz.UserBiz;
import com.yc.biz.lmpl.UserBizlmpl;
import com.yc.util.Data;
import com.yc.util.Email;

@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {
	UserBiz ub=new UserBizlmpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");		
		PrintWriter out=resp.getWriter();
		
		//获取到参数
		String op=req.getParameter("op");
		if("reg".equals(op)){
			reg(req,resp,out);
		}else if("login".equals(op)){
			login(req,resp,out);			
		}else if("sendcode".equals(op)){
			sendcode(req,resp,out);			
		}else if("judge".equals(op)){
			judge(req,resp,out);			
		}else if("changename".equals(op)){
			changename(req,resp,out);			
		}else if("checkpwd".equals(op)){
			checkpwd(req,resp,out);			
		}else if("changepwd".equals(op)){
			changepwd(req,resp,out);			
		}else if("findAlluser".equals(op)){
			findAlluser(req,resp,out);			
		}else if("changestatus".equals(op)){
			changestatus(req,resp,out);			
		}else if("reset".equals(op)){
			reset(req,resp,out);			
		}else if("xiugai".equals(op)){
			xiugai(req,resp,out);
		}
	}



	private void xiugai(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String uname=req.getParameter("newname");
		int uid=Integer.parseInt(req.getSession().getAttribute("uid")+"");

		int result=ub.xiugai(uname,uid);
		if(result>0){
			req.getSession().setAttribute("uname", uname);
		}
		out.print(result);
	}


	private void reset(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		int uid=Integer.parseInt(req.getSession().getAttribute("uid")+"");
		String pwd=req.getParameter("newpwd");

		int result=ub.reset(uid,pwd);
		out.print(result);
		
	}
	
	private void changestatus(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		int uid=Integer.parseInt(req.getParameter("uid"));
		int result=ub.changestatus(uid);
		out.print(result);
	}

	private void findAlluser(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		List<User> list=ub.findAlluser();
		Gson gson=new Gson();
		out.print(gson.toJson(list));
	}

	private void changepwd(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		int uid=Integer.parseInt(req.getSession().getAttribute("uid")+"");
		String newpwd=req.getParameter("newpwd");
		int result=ub.changepwd(newpwd, uid);
		out.print(result);
	}

	private void checkpwd(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		int uid=Integer.parseInt(req.getSession().getAttribute("uid")+"");
		String oldpwd=req.getParameter("oldpwd");
		int result=ub.checkpwd(oldpwd, uid);
		out.print(result);
	}

	private void changename(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String newname=req.getParameter("newname");
		int uid=Integer.parseInt(req.getSession().getAttribute("uid")+"");
		int result=ub.changename(newname, uid);
		if(result>0){
			req.getSession().setAttribute("uname", newname);
		}
		out.print(result);
	}

	private void judge(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String email=req.getParameter("email");
		String pwd=req.getParameter("pwd");
		
		int result=ub.judge(email, pwd);
		out.print(result);
	}

	private void sendcode(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String email=req.getParameter("email");
		Email.sendcode(email);
		if(Data.code!=0){
			out.print(Data.code);
			req.getSession().setAttribute("code",Data.code);
		}
	}

	private void login(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String email=req.getParameter("email");
		String pwd=req.getParameter("pwd");
		
		User user=ub.login(email, pwd);
		if( user==null ){
			out.print(-1);
		}else if(user.getStatus()==0){
			req.getSession().setAttribute("uid", user.getUid());
			req.getSession().setAttribute("uname", user.getUname());
			out.print(0);
		}else if(user.getStatus()==1){
			req.getSession().setAttribute("uid", user.getUid());
			req.getSession().setAttribute("uname", user.getUname());
			out.print(1);
		}else if(user.getStatus()==2){
			out.print(2);
		}else{
			out.print(-1);
		}
	}

	private void reg(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String uname=req.getParameter("uname");
		String pwd=req.getParameter("pwd");
		String email=req.getParameter("email");

		int result=ub.reg(uname, pwd ,email);
		out.print(result);
	}
}

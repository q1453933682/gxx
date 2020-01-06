package com.yc.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yc.bean.Sight;
import com.yc.biz.SightBiz;
import com.yc.biz.lmpl.SightBizImpl;

@WebServlet("/sightServlet")
public class SightServlet extends HttpServlet {
	SightBiz sb=new SightBizImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String op=req.getParameter("op");
		PrintWriter out=resp.getWriter();
		if("showpath".equals(op)){
			showpath(req,resp,out);
		}else if("findAllPath".equals(op)){
			findAllPath(req,resp,out);
		}else if("findAllsight".equals(op)){
			findAllsight(req,resp,out);
		}else if("setprice".equals(op)){
			setprice(req,resp,out);
		}
	}

	private void setprice(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		int sid=Integer.parseInt(req.getParameter("sid"));
		int newprice=Integer.parseInt(req.getParameter("newprice"));
		
		int result=sb.setprice(newprice, sid);
		out.print(result);
	}

	private void findAllsight(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		List<Sight> list=sb.findAllsight();
		Gson gson=new Gson();
		out.print(gson.toJson(list));
	}

	private void findAllPath(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		int pid=Integer.parseInt(req.getParameter("pid"));
		int start=Integer.parseInt(req.getParameter("start"));
		List<Sight> list=sb.findSight(pid, 0, null, start, 5);
		Sight sight=new Sight();
		int countpage=sb.findSight(pid, 0, null, 0, 0).size();
		countpage=countpage%5==0?countpage/5:(countpage/5)+1;
		sight.setSid(countpage);
		list.add(sight);
		
		Gson gson=new Gson();
		out.print(gson.toJson(list));
	}

	private void showpath(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		int pid=Integer.parseInt(req.getParameter("pid"));
		List<Sight> list=sb.findSight(pid, 0, null, 0 , 4);
		
		Gson gson=new Gson();
		out.print(gson.toJson(list));
	}

}

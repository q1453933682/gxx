package com.yc.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yc.bean.Sight;
import com.yc.biz.OrderBiz;
import com.yc.biz.SightBiz;
import com.yc.biz.lmpl.OrderBizlmpl;
import com.yc.biz.lmpl.SightBizImpl;
import com.yc.dao.DBHelper;

@WebServlet("/orderServlet")
public class OrderServlet extends HttpServlet {
	SightBiz sb=new SightBizImpl();
	OrderBiz ob=new OrderBizlmpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");		
		PrintWriter out=resp.getWriter();
		
		String op=req.getParameter("op");
		if("findInfo".equals(op)){
			findInfo(req,resp,out);
		}else if("del".equals(op)){
			del(req,resp,out);
		}
	}
	private void del(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		int did=Integer.parseInt(req.getParameter("did"));
		int list=ob.del(did);
		out.print(list);
	}

	private void findInfo(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		int sid=Integer.parseInt(req.getParameter("sid"));
		List<Sight> list=sb.findSight(sid);
		Gson gson=new Gson();
		out.print(gson.toJson(list));
	}
}

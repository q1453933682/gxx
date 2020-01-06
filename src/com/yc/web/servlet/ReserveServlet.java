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
import com.yc.bean.Order;
import com.yc.bean.Sight;
import com.yc.biz.OrderBiz;
import com.yc.biz.ReserveBiz;
import com.yc.biz.UserBiz;
import com.yc.biz.lmpl.OrderBizlmpl;
import com.yc.biz.lmpl.ReserveBizlmpl;
import com.yc.biz.lmpl.UserBizlmpl;

@WebServlet("/reserveServlet")
public class ReserveServlet extends HttpServlet {
	
	ReserveBiz rb=new ReserveBizlmpl();
	OrderBiz ob=new OrderBizlmpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");		
		PrintWriter out=resp.getWriter();
		
		String op=req.getParameter("op");
		if("purchase".equals(op)){
			purchase(req,resp,out);
		}else if("userInfo".equals(op)){
			userInfo(req,resp,out);
		}
	}

		private void userInfo(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
			int uid=Integer.parseInt(req.getSession().getAttribute("uid")+"");
			List<Order> list=ob.userInfo(uid);
			Gson gson=new Gson();
			out.print(gson.toJson(list));
	}

		private void purchase(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
			int uid=Integer.parseInt(req.getSession().getAttribute("uid")+"");
			int sid=Integer.parseInt(req.getParameter("sid"));
			String goday=req.getParameter("goday");
			String backday=req.getParameter("backday");
			int room=Integer.parseInt(req.getParameter("room"));
			int adult=Integer.parseInt(req.getParameter("adult"));
			int children=Integer.parseInt(req.getParameter("children"));
			
			int result=rb.purchase(uid,sid,goday,backday,room,adult,children);
			out.print(result);
	}

}

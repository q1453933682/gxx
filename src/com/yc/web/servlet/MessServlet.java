package com.yc.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yc.biz.MessBiz;
import com.yc.biz.lmpl.MessBizlmpl;

@WebServlet("/messServlet")
public class MessServlet extends HttpServlet {
	MessBiz mb=new MessBizlmpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");		
		PrintWriter out=resp.getWriter();
		
		//获取到参数
		String op=req.getParameter("op");
		if("sendmess".equals(op)){
			sendmess(req,resp,out);
		}
	}

	private void sendmess(HttpServletRequest req, HttpServletResponse resp, PrintWriter out) {
		String pname=req.getParameter("pname");
		String email=req.getParameter("email");
		String addr=req.getParameter("addr");
		String mess=req.getParameter("mess");
		
		int result=mb.sendmess(pname,email,addr,mess);
		out.print(result);
	}
	
	
}

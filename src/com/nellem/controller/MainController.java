package com.nellem.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nellem.command.BInsertCommand;
import com.nellem.command.BListCommand;
import com.nellem.command.BViewCommand;
import com.nellem.command.InterfaceCommand;
import com.nellem.command.MInsertCommand;
import com.nellem.command.MLoginCommand;
import com.nellem.command.MSelectCommand;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private void doHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String viewPage = null;
		InterfaceCommand command = null;
		
		String uri = request.getRequestURI(); 	//uri :/member-mvc/list.do
		String com= uri.substring(uri.lastIndexOf("/")+ 1, uri.lastIndexOf(".do")); //command :insert
		
		if(com !=null && com.trim().equals("index")) {
			viewPage = "/WEB-INF/view/index.jsp";
		}
		if(com !=null && com.trim().equals("signup")) {
			viewPage = "/WEB-INF/view/signup.jsp";
		}
		if(com !=null && com.trim().equals("signup_finish")) {
			command = new MInsertCommand();
			command.execute(request, response);
			viewPage = "index.do";
		}
		if(com !=null && com.trim().equals("login")) {
			command = new MLoginCommand();
			command.execute(request, response);
			viewPage = "index.do";
		}
		if(com !=null && com.trim().equals("logout")) {
			HttpSession session = request.getSession();
			session.invalidate();
			viewPage = "index.do";
		}
		if(com !=null && com.trim().equals("mypage")) {
			command = new MSelectCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/view/mypage.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);	
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {doHandler(request, response);}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {doHandler(request, response);}
}

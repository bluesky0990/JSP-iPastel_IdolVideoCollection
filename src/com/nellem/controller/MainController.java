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
import com.nellem.command.BSearchCommand;
import com.nellem.command.BTypeMainListCommand;
import com.nellem.command.BUpdateCommand;
import com.nellem.command.BUpdateFormCommand;
import com.nellem.command.BViewCommand;
import com.nellem.command.InterfaceCommand;
import com.nellem.command.MImgUpdateCommand;
import com.nellem.command.MInsertCommand;
import com.nellem.command.MLoginCommand;
import com.nellem.command.MSelectCommand;
import com.nellem.helper.HelperPaging;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	private void doHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String viewPage = null;
		InterfaceCommand command = null;
		
		String uri = request.getRequestURI(); 	//uri :/member-mvc/list.do
		String com= uri.substring(uri.lastIndexOf("/")+ 1, uri.lastIndexOf(".do")); //command :insert
		
//		// 페이징 부분
//		String pageString = request.getParameter("page");
//		String boardTypeString = request.getParameter("boardNo");
//		int page = 0;
//		int boardType = 0;
//		int blockStartNum = 0;
//		int blockLastNum = 0;
//		int lastPageNum = 0;
//		if(pageString != null && boardTypeString != null) {
//			page = Integer.parseInt(pageString);
//			boardType = Integer.parseInt(boardTypeString);
//			HelperPaging paging = new HelperPaging();
//			paging.makeBlock(page);
//			paging.makeLastPageNum(boardType);
//			blockStartNum = paging.getBlockStartNum();
//			blockLastNum = paging.getBlockLastNum();
//			lastPageNum = paging.getLastPageNum();
//		}
//		System.out.println(pageString+boardTypeString);
		

		if(com !=null && com.trim().equals("index")) {
			command = new BTypeMainListCommand();
			command.execute(request, response);
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
		if(com !=null && com.trim().equals("fBoardList")) {
			command = new BListCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/view/fBoard.jsp";
		}
		if(com !=null && com.trim().equals("iBoardList")) {
			command = new BListCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/view/iBoard.jsp";
		}
		if(com !=null && com.trim().equals("boardList")) {
			command = new BListCommand();
			command.execute(request, response);
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			if(boardNo != 1) {
				viewPage = "/WEB-INF/view/iBoardView.jsp";
			} else {
				viewPage = "/WEB-INF/view/fBoardView.jsp";
			}
		}
		if(com !=null && com.trim().equals("sBoardList")) {
			command = new BSearchCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/view/sBoard.jsp";
		}
		if(com !=null && com.trim().equals("imgUploadPage")) {
			viewPage = "/WEB-INF/view/imgUpload.jsp";
		}
		if(com !=null && com.trim().equals("imgUpload")) {
			command = new MImgUpdateCommand();
			command.execute(request, response);
			viewPage = "mypage.do";
		}
		if(com !=null && com.trim().equals("boardWriteForm")) {
			command = new BListCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/view/boardWrite.jsp";
		}
		if(com !=null && com.trim().equals("boardInsert")) {
			command = new BInsertCommand();
			command.execute(request, response);
			int boardNo = Integer.parseInt(request.getParameter("write_boardType"));
			if(boardNo != 1) {
				viewPage = "iBoardList.do?boardNo=" + boardNo;
			} else {
				viewPage = "fBoardList.do?boardNo=1";
			}
		}
		if(com !=null && com.trim().equals("boardView")) {
			command = new BViewCommand();
			command.execute(request, response);
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			if(boardNo != 1) {
				viewPage = "/WEB-INF/view/iBoardView.jsp";
			} else {
				viewPage = "/WEB-INF/view/fBoardView.jsp";
			}
			if(boardNo == 0) {
				// 요청게시판 주소 작성하시오
				//viewPage = "/WEB-INF/view/iBoardView.jsp";
			}
		}
		if(com !=null && com.trim().equals("boardUpdateForm")) {
			command = new BUpdateFormCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/view/boardUpdate.jsp";
		}
		if(com !=null && com.trim().equals("boardUpdate")) {
			command = new BUpdateCommand();
			command.execute(request, response);
			int boardNo = Integer.parseInt(request.getParameter("boardNo"));
			int no = Integer.parseInt(request.getParameter("no"));
			viewPage = "boardView.do?boardNo=" + boardNo + "&no=" + no;
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);	
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {doHandler(request, response);}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {doHandler(request, response);}
}

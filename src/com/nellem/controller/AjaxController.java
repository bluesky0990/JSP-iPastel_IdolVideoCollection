package com.nellem.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nellem.datoBoardType.BoardTypeDAO;
import com.nellem.datoBoardType.BoardTypeDTO;
import com.nellem.datoMember.MemberDAO;
import com.nellem.datoMember.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.on")
public class AjaxController extends HttpServlet {
	private void doHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI(); 	//uri :/member-mvc/list.do
		String com = uri.substring(uri.lastIndexOf("/")+ 1, uri.lastIndexOf(".on")); //command :insert

		
		
		if(com !=null && com.trim().equals("idCheck")) {
			MemberDAO dao = new MemberDAO();
			List<MemberDTO> dtos = dao.memberList();
			
			String signupID = request.getParameter("id");
			System.out.println(signupID);
			boolean chk = true;
			
			for(MemberDTO dto : dtos) {
				String dbID = dto.getId();
				if(dbID.equals(signupID)) {
					chk = false;
					System.out.println(signupID+dbID+chk);
				}
			}
			PrintWriter out = response.getWriter();
			out.print(chk);
		}
		
		if(com !=null && com.trim().equals("pwUpdate")) {
			String mypageID = request.getParameter("id");
			String mypagePW = request.getParameter("pw");
			
			MemberDTO dto = new MemberDTO();
			MemberDAO dao = new MemberDAO();
			dto.setId(mypageID);
			dto.setPw(mypagePW);
			dao.updatePwdMember(dto);

			boolean chk = true;
			PrintWriter out = response.getWriter();
			out.print(chk);
		}
		
		if(com !=null && com.trim().equals("addBoardType")) {
			String boardName = request.getParameter("boardName");
			System.out.println(boardName);
			
			BoardTypeDAO dao = new BoardTypeDAO();
			BoardTypeDTO dto = new BoardTypeDTO();
			dto.setBoardNo(0);
			dto.setBoardName(boardName);
			dao.boardTypeInsert(dto);

			boolean chk = true;
			PrintWriter out = response.getWriter();
			out.print(chk);
		}
		
		if(com !=null && com.trim().equals("profileImgRemove")) {
			String id = request.getParameter("id");

			MemberDTO dto = new MemberDTO();
			MemberDAO dao = new MemberDAO();
			dto.setId(id);
			dao.updateDelImgMember(dto);
			
			HttpSession session = request.getSession();
			session.setAttribute("session_profileImg", null);

			boolean chk = true;
			PrintWriter out = response.getWriter();
			out.print(chk);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {doHandler(request, response);}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {doHandler(request, response);}
}

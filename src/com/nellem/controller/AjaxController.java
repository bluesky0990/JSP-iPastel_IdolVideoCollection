package com.nellem.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.nellem.datoBoardType.BoardTypeDAO;
import com.nellem.datoBoardType.BoardTypeDTO;
import com.nellem.datoMember.MemberDAO;
import com.nellem.datoMember.MemberDTO;
import com.nellem.datoReply.ReplyDAO;
import com.nellem.datoReply.ReplyDTO;

@WebServlet("*.on")
public class AjaxController extends HttpServlet {
	private void doHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
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
		
		if(com !=null && com.trim().equals("insertReply")) {
			HttpSession session = request.getSession();
			int boardNo = Integer.parseInt(request.getParameter("no"));
			String writer = (String)session.getAttribute("session_id");
			String content = request.getParameter("content");

			ReplyDAO dao = new ReplyDAO();
			ReplyDTO dto = new ReplyDTO();
			dto.setBoardNo(boardNo);
			dto.setWriter(writer);
			dto.setContent(content);
			dao.insertReply(dto);
		}
		
		if(com !=null && com.trim().equals("reloadReply")) {
			int no = Integer.parseInt(request.getParameter("replyBoardNo"));
			ReplyDAO dao = new ReplyDAO();
			ReplyDTO dto = new ReplyDTO();
			JSONArray data = new JSONArray();
			SimpleDateFormat simple = new SimpleDateFormat("MM-dd HH:mm");
			
			List<ReplyDTO> dtos = dao.selectBoard(no);
			dto = dao.selectPartCount(no);
			
			for(ReplyDTO dtoOne : dtos) {
				JSONObject json = new JSONObject();
				json.put("no", dtoOne.getNo());
				json.put("boardNo", dtoOne.getBoardNo() + "");
				json.put("writer", dtoOne.getWriter() + "");
				json.put("content", dtoOne.getContent() + "");
				String regdate = simple.format(dtoOne.getRegdate());
				json.put("regdate", regdate + "");
				json.put("profile_img", dtoOne.getProfile_img() + "");
				data.add(json);
			}

			request.setAttribute("dto_countReply", dto);
			
			PrintWriter out = response.getWriter();
			out.println(data);
		}
		
		if(com !=null && com.trim().equals("removeReply")) {
			int no = Integer.parseInt(request.getParameter("replyNo"));
			ReplyDAO dao = new ReplyDAO();
			
			dao.deleteReply(no);
		}
		
		if(com !=null && com.trim().equals("updateReply")) {
			int no = Integer.parseInt(request.getParameter("replyNo"));
			String content = request.getParameter("replyContent");
			
			ReplyDAO dao = new ReplyDAO();
			ReplyDTO dto = new ReplyDTO();
			dto.setNo(no);
			dto.setContent(content);
			dao.updateReply(dto);
		}
		
		if(com !=null && com.trim().equals("countReply")) {
			int no = Integer.parseInt(request.getParameter("replyBoardNo"));
			ReplyDAO dao = new ReplyDAO();
			ReplyDTO dto = new ReplyDTO();
			
			dto = dao.selectPartCount(no);
			
			PrintWriter out = response.getWriter();
			out.println(dto.getCountReply());
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {doHandler(request, response);}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {doHandler(request, response);}
}

package com.nellem.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nellem.datoMember.MemberDAO;
import com.nellem.datoMember.MemberDTO;


public class MSelectCommand implements InterfaceCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("session_id");
		String pw = (String)session.getAttribute("session_pw");
		String name = (String)session.getAttribute("session_name");
		
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		
		request.setAttribute("dto_mypage", dto);
	}
}

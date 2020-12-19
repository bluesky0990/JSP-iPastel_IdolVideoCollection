package com.nellem.command;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nellem.datoMember.MemberDAO;
import com.nellem.datoMember.MemberDTO;


public class MInsertCommand implements InterfaceCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDTO dto = new MemberDTO();	//DB에 데이터를 저장하기 위해 DTO 객체 생성
		dto.setId(request.getParameter("signup_id"));
		dto.setPw(request.getParameter("signup_pw"));
		dto.setName(request.getParameter("signup_name"));
		dto.setRank(0);
		
		System.out.println(dto.getId() + dto.getPw() + dto.getName() + dto.getRank());
		
		MemberDAO dao = new MemberDAO();	
		dao.insertMember(dto);			//DB에 DTO객체를 저장하기 위한 메소드 insert 호출
	}
}
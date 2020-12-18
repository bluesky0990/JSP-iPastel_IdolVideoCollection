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
		int national = 0;
		String date = request.getParameter("birth");
		System.out.println(date);
		Date birth = Date.valueOf(date);
		int sex = 0;
		

		if(request.getParameter("national").equals("한국")) {
			national = 0;
		} else if(request.getParameter("national").equals("일본")) {
			national = 1;
		}
		if(request.getParameter("sex").equals("남성")) {
			sex = 0;
		} else if(request.getParameter("sex").equals("여성")) {
			sex = 1;
		}
		

		dto.setId(request.getParameter("id"));
		dto.setNational(national);
		dto.setPwd(request.getParameter("pwd"));
		dto.setName(request.getParameter("name"));
		dto.setNickname(request.getParameter("nickname"));
		dto.setEmail(request.getParameter("email"));
		dto.setBirth(birth);
		dto.setSex(sex);
		
		System.out.println(dto.getId() + dto.getNational() + dto.getPwd() + dto.getPwd() + dto.getName() + dto.getNickname() + dto.getEmail());
		
		MemberDAO dao = new MemberDAO();	
		dao.insert(dto);			//DB에 DTO객체를 저장하기 위한 메소드 insert 호출
	}
}
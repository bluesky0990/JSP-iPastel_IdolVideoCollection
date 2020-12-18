package com.nellem.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nellem.datoBoard.BoardDAO;
import com.nellem.datoBoard.BoardDTO;

public class BInsertCommand implements InterfaceCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDTO dto = new BoardDTO();
		HttpSession session = request.getSession();
		
		String boardStringType = request.getParameter("boardType");
		int boardIntType = 0;
		if(boardStringType.equals("kr")) {
			boardIntType = 1;
		} else if(boardStringType.equals("jp")) {
			boardIntType = 2;
		}
		
		dto.setNo(0);
		dto.setBoardNo(boardIntType);
		dto.setHits(0);
		dto.setTitle(request.getParameter("title"));
		dto.setWriter((String)session.getAttribute("nickname"));
		dto.setContent(request.getParameter("content"));
		dto.setRegdate(null);
		dto.setMainImage(null);
		dto.setImage(null);
		
		System.out.println(dto.getBoardNo()+dto.getTitle()+dto.getWriter()+dto.getContent());
		
		BoardDAO dao = new BoardDAO();	
		dao.boardInsert(dto);			//DB에 DTO객체를 저장하기 위한 메소드 insert 호출
	}
}
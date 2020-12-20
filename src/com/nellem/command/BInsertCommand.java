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
		System.out.println(11);
		BoardDTO dto = new BoardDTO();
		BoardDAO dao = new BoardDAO();
		HttpSession session = request.getSession();

		int boardNo = Integer.parseInt(request.getParameter("write_boardType"));
		String title = request.getParameter("write_title");
		String writer = (String)session.getAttribute("session_id");
		String content = request.getParameter("content");
		
		// 자유게시판(boardNo = 1)의 경우 내용이 미리 보이기 때문에 HTML 태그를 삭제 후 insert한다.
		if(boardNo == 1) {
			content = "<p>" + content.replaceAll("<[^>]*>", "") + "</p>";
		}
		
		dto.setBoardNo(boardNo);
		dto.setTitle(title);
		dto.setWriter(writer);
		dto.setContent(content);
		
		System.out.println(dto.getBoardNo()+dto.getTitle()+dto.getWriter()+dto.getContent());
		dao.boardInsert(dto);			//DB에 DTO객체를 저장하기 위한 메소드 insert 호출
	}
}
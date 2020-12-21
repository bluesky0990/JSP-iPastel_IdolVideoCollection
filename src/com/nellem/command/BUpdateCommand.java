package com.nellem.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nellem.datoBoard.BoardDAO;
import com.nellem.datoBoard.BoardDTO;

public class BUpdateCommand implements InterfaceCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(11);
		BoardDTO dto = new BoardDTO();
		BoardDAO dao = new BoardDAO();

		int no = Integer.parseInt(request.getParameter("write_no"));
		int boardNo = Integer.parseInt(request.getParameter("write_boardType"));
		String title = request.getParameter("write_title");
		String content = request.getParameter("content");
		System.out.println(no +""+boardNo+title+content);
		
		// 자유게시판(boardNo = 1)의 경우 내용이 미리 보이기 때문에 HTML 태그를 삭제 후 insert한다.
		if(boardNo == 1) {
			content = "<p>" + content.replaceAll("<[^>]*>", "") + "</p>";
		}
		
		dto.setNo(no);
		dto.setTitle(title);
		dto.setContent(content);
		
		System.out.println(dto.getNo()+dto.getTitle()+dto.getContent());
		dao.updateBoard(dto);
		System.out.println("pass");
	}
}
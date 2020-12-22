package com.nellem.paging2;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nellem.command.InterfaceCommand;
import com.nellem.datoBoard.BoardDAO;
import com.nellem.datoBoard.BoardDTO;

public class ListBoardCommand2 implements InterfaceCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		
		
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		System.out.println(page);
		

		int boardType = Integer.parseInt(request.getParameter("boardNo"));
		dao.selectBoardCount(boardType);
		System.out.println(boardType);
		
		
		List<BoardDTO> dtos = dao.boardListInnerJoin(boardType);
		System.out.println(dtos.size());
		
		//3. dtos를 request scope에 저장하여 View가 화면출력할 수 있도록 준비한다.
		request.setAttribute("dtos_board", dtos);//아이템 데이터
		request.setAttribute("boardCount", dtos.size());//총 아이템 갯수
		request.setAttribute("page", page);//페이지 확인을 위해 다시 보냄
		request.setAttribute("boardNo", boardType);
	}
}

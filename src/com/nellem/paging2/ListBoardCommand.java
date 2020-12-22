package com.nellem.paging2;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nellem.command.InterfaceCommand;
import com.nellem.datoBoard.BoardDAO;
import com.nellem.datoBoard.BoardDTO;

public class ListBoardCommand implements InterfaceCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));//P가 있다면 p를 생성
		String page = request.getParameter("page");
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();

		int boardType = Integer.parseInt(request.getParameter("boardNo"));
		System.out.println(boardType);
		
		dao.selectBoardCount(boardType);
		int totalCount = dto.getCountBoard();
		
		List<BoardDTO> dtos = dao.boardListInnerJoin(boardType);
		System.out.println(dtos.size());
		
		//3. dtos를 request scope에 저장하여 View가 화면출력할 수 있도록 준비한다.
		request.setAttribute("dtos_board", dtos);//아이템 데이터
		request.setAttribute("itemN", dtos.size());//총 아이템 갯수
		request.setAttribute("P", page);//페이지 확인을 위해 다시 보냄
		request.setAttribute("boardNo", boardType);
	}
}

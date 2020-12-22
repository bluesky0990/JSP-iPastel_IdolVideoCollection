package com.nellem.paging;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nellem.command.InterfaceCommand;
import com.nellem.datoBoard.BoardDAO;
import com.nellem.datoBoard.BoardDTO;

public class PagingCommand implements InterfaceCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		int boardType = Integer.parseInt(request.getParameter("boardNo"));
		dao.selectBoardCount(boardType);
		int totalCount = dto.getCountBoard();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		int start = 0;
		int end = 0;
		PagingDTO paging = new PagingDTO();
		paging.setPageNo(page);
		paging.setPageSize(24); // 한 페이지에 불러낼 게시물의 개수 지정
		paging.setPageSize(totalCount);
//		dto.setStartRow(page);
//		dto.setEndRow(paging.getPageSize());
		dto.setStartRow(start);
		dto.setEndRow(end);
		List<BoardDTO> list = dao.selectBoardPaging(dto);
		
		start = (page - 1) * 24 + 1;	// select 해오는 기준을 구한다.
		end = page * 24;
		

		request.setAttribute("dtos_board", list);
		request.setAttribute("paging", paging);
	}
}

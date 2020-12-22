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
		List<BoardDTO> list;
		
		int boardType = Integer.parseInt(request.getParameter("boardNo"));
		dao.selectBoardCount(boardType);
		int totalCount = dto.getCountBoard();
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		
		PagingDTO paging = new PagingDTO();
		paging.setPageNo(page);
		paging.setPageSize(24); // 한 페이지에 불러낼 게시물의 개수 지정
		paging.setPageSize(totalCount);
		
		page = (page - 1) * 24;	// select 해오는 기준을 구한다.
		
		dto.setStartRow(page);
		dto.setEndRow(paging.getPageSize());
		list = dao.selectBoardPaging(dto);

		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
	}
}

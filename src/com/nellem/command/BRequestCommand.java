package com.nellem.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nellem.datoBoard.BoardDAO;
import com.nellem.datoBoard.BoardDTO;
import com.nellem.datoBoardType.BoardTypeDAO;
import com.nellem.datoBoardType.BoardTypeDTO;
import com.nellem.datoReply.ReplyDAO;
import com.nellem.datoReply.ReplyDTO;

public class BRequestCommand implements InterfaceCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardTypeDTO dtoBoardType = new BoardTypeDTO();
		BoardTypeDAO daoBoardType = new BoardTypeDAO();
		BoardDTO dtoBoard = new BoardDTO();
		BoardDAO daoBoard = new BoardDAO();
		ReplyDTO dtoReply = new ReplyDTO();
		ReplyDAO daoReply = new ReplyDAO();
		
		int no = Integer.parseInt(request.getParameter("no"));
		daoBoard.updateHitsBoard(no);
		dtoBoard = daoBoard.selectView(no);
		List<BoardTypeDTO> dtosBoardType = daoBoardType.boardTypeList();

		int boardType = Integer.parseInt(request.getParameter("boardNo"));
		dtoReply = daoReply.selectPartCount(no);
		List<ReplyDTO> dtosReply = daoReply.selectBoard(no);
		
		request.setAttribute("dtos_boardType", dtosBoardType);
		request.setAttribute("dto_board", dtoBoard);
		request.setAttribute("dto_countReply", dtoReply);
		request.setAttribute("dtos_reply", dtosReply);
	}
}
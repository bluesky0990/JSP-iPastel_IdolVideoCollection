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

public class BUpdateFormCommand implements InterfaceCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardTypeDTO dtoBoardType = new BoardTypeDTO();
		BoardTypeDAO daoBoardType = new BoardTypeDAO();
		BoardDTO dtoBoard = new BoardDTO();
		BoardDAO daoBoard = new BoardDAO();

		int no = Integer.parseInt(request.getParameter("no"));
		dtoBoard = daoBoard.selectView(no);
		List<BoardTypeDTO> dtosBoardType = daoBoardType.boardTypeList();
		
		request.setAttribute("dtos_boardType", dtosBoardType);
		request.setAttribute("dto_board", dtoBoard);
	}
}
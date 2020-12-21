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
import com.nellem.datoMember.MemberDAO;
import com.nellem.datoMember.MemberDTO;

public class BSearchCommand implements InterfaceCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDTO dtoBoard = new BoardDTO();
		BoardDAO daoBoard = new BoardDAO();
		BoardTypeDTO dtoBoardType = new BoardTypeDTO();
		BoardTypeDAO daoBoardType = new BoardTypeDAO();
		
		String searchKwd = request.getParameter("search_entry");
		
		List<BoardTypeDTO> dtosBoardType = daoBoardType.boardTypeList();
		List<BoardDTO> dtosBoard = daoBoard.selectSearchAllBoard("%"+searchKwd+"%");
		
		request.setAttribute("dtos_board", dtosBoard);
		request.setAttribute("dtos_boardType", dtosBoardType);
	}
}
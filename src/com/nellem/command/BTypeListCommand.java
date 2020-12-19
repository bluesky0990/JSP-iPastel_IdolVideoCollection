package com.nellem.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nellem.datoBoardType.BoardTypeDAO;
import com.nellem.datoBoardType.BoardTypeDTO;

public class BTypeListCommand implements InterfaceCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardTypeDTO dto = new BoardTypeDTO();
		BoardTypeDAO dao = new BoardTypeDAO();
		
		List<BoardTypeDTO> dtos = dao.boardTypeList();
		request.setAttribute("dtos_boardType", dtos);
	}
}
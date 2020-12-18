package com.nellem.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nellem.datoBoard.BoardDAO;
import com.nellem.datoBoard.BoardDTO;

public class BViewCommand implements InterfaceCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDTO dto = new BoardDTO();
		BoardDAO dao = new BoardDAO();
		
		dto = dao.selectView(Integer.parseInt(request.getParameter("no")));
		request.setAttribute("dto", dto);
	}
}
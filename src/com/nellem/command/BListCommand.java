package com.nellem.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nellem.datoBoard.BoardDAO;
import com.nellem.datoBoard.BoardDTO;

public class BListCommand implements InterfaceCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDTO dto = new BoardDTO();
		BoardDAO dao = new BoardDAO();
		
		String uri = request.getRequestURI(); 	//uri :/member-mvc/insert.do
		String com= uri.substring(uri.lastIndexOf("/")+ 1, uri.lastIndexOf(".do")); //command :insert
		int boardType = 0;
		
		if(com !=null && com.trim().equals("japBoard")) {
			boardType = 2;
		}
		if(com !=null && com.trim().equals("korBoard")) {
			boardType = 1;
		}
		
		List<BoardDTO> dtos = dao.boardList(boardType);
		request.setAttribute("dtos", dtos);
	}
}
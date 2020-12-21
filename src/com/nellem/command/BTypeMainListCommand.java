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

public class BTypeMainListCommand implements InterfaceCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardTypeDTO boardTypeDTO = new BoardTypeDTO();
		BoardTypeDAO boardTypeDAO = new BoardTypeDAO();
		BoardDTO boardDTO = new BoardDTO();
		BoardDAO boardDAO = new BoardDAO();
		
		List<BoardTypeDTO> boardTypeDTOS = boardTypeDAO.boardTypeList();
		request.setAttribute("dtos_boardType", boardTypeDTOS);
		
		
		List<BoardDTO> boardDTOS = boardDAO.boardMainPageList();
		
		String codeUrl = null;
		String content = null;
		for(BoardDTO dto : boardDTOS) {
			content = dto.getContent();
			if(content.contains("https://www.youtube.com/embed/")) {
				//<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/kS3FFlFOQMo?rel=0" width="640"></iframe></p>
				//<a href="https://www.youtube.com/embed/am8mLH41iDU?rel=0"><img src="https://img.youtube.com/vi/am8mLH41iDU/sddefault.jpg" style="height:360px; width:640px" /></a></p>
				codeUrl= dto.getContent().substring(dto.getContent().indexOf("=\"https://www.youtube.com/embed/") + 32, dto.getContent().indexOf("=\"https://www.youtube.com/embed/") + 43); //command :insert
			} else {
				// 유튜브주소 없음
				codeUrl = "SdcS0avMrXQ";
			}
			dto.setYoutubeCode(codeUrl);
		}
		request.setAttribute("dtos_mainPage", boardDTOS);
	}
}
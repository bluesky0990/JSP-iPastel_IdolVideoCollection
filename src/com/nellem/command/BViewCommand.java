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

public class BViewCommand implements InterfaceCommand {
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
		List<BoardDTO> dtosBoard = daoBoard.boardListInnerJoin(boardType);
		// 게시글 내의 유튜브 링크 추출
		if(boardType != 1 && boardType != 0) {
			for(BoardDTO dto : dtosBoard) {
				//<p><iframe allowfullscreen="" frameborder="0" height="360" src="https://www.youtube.com/embed/kS3FFlFOQMo?rel=0" width="640"></iframe></p>
				//<a href="https://www.youtube.com/embed/am8mLH41iDU?rel=0"><img src="https://img.youtube.com/vi/am8mLH41iDU/sddefault.jpg" style="height:360px; width:640px" /></a></p>
				String codeUrl= dto.getContent().substring(dto.getContent().indexOf("=\"https://www.youtube.com/embed/") + 32, dto.getContent().indexOf("=\"https://www.youtube.com/embed/") + 43); //command :insert
				dto.setYoutubeCode(codeUrl);
			}
		}
		dtoReply = daoReply.selectPartCount(no);
		List<ReplyDTO> dtosReply = daoReply.selectBoard(no);
		
		
		
		request.setAttribute("dtos_boardType", dtosBoardType);
		request.setAttribute("dto_board", dtoBoard);
		request.setAttribute("dtos_board", dtosBoard);
		request.setAttribute("dto_countReply", dtoReply);
		request.setAttribute("dtos_reply", dtosReply);
	}
}
package com.nellem.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nellem.datoMember.MemberDAO;
import com.nellem.datoMember.MemberDTO;


public class MLoginCommand implements InterfaceCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tryID = request.getParameter("login_id");
		String tryPW = request.getParameter("login_pw");
		String dbID = null;
		String dbPW = null;
		String dbName = null;
		int dbRank = 0;
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.selectMember(tryID);

		HttpSession session = request.getSession();
		if(dto != null) {
			dbID = dto.getId();
			dbPW = dto.getPw();
			dbName = dto.getName();
			dbRank = dto.getRank();
			
			if(tryID.equals(dbID) && tryPW.equals(dbPW)) {
				session.setAttribute("faildLogin", "null");
				session.setAttribute("state", "login");
				session.setAttribute("session_id", dbID);
				session.setAttribute("session_pw", dbPW);
				session.setAttribute("session_name", dbName);
				session.setAttribute("session_rank", dbRank);
			} else {
				session.setAttribute("faildLogin", "fail");
			}
		}
	}
}

package com.nellem.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nellem.datoMember.MemberDAO;
import com.nellem.datoMember.MemberDTO;


public class MIdCheckCommand implements InterfaceCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		List<MemberDTO> dtos = dao.memberList();
		
		String signupID = request.getParameter("id");
		boolean chk = false;
		
		for(int i = 0; i < dtos.size(); i++) {
			String dbID = dtos.get(0).toString();
			if(signupID.equals(dbID)) {
				chk = true;
				System.out.println(signupID + dbID + chk);
			}
		}
		
		request.setAttribute("idCheckResult", chk);
	}
}

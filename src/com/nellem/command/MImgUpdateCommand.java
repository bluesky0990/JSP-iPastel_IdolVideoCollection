package com.nellem.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nellem.datoMember.MemberDAO;
import com.nellem.datoMember.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class MImgUpdateCommand implements InterfaceCommand {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int maxSize = 40*40*5;
		String dir = request.getSession().getServletContext().getRealPath("/img/userProfile/");//세션에서 주소가져오기
		File f = new File(dir);
		if(!f.exists()) f.mkdir();

		MultipartRequest multi = new MultipartRequest(request, dir, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		HttpSession session = request.getSession();
		String userID = (String)session.getAttribute("session_id");

		MemberDTO dto = new MemberDTO();	//DB에 데이터를 저장하기 위해 DTO 객체 생성
		dto.setId(userID);
		
		String fileName = multi.getFilesystemName("mypage_file");
		dto.setProfile_img(fileName);

		MemberDAO dao = new MemberDAO();	
		dao.updateImgMember(dto);			//DB에 DTO객체를 저장하기 위한 메소드 insert 호출
		
		session.setAttribute("session_profileImg", fileName);
	}
}
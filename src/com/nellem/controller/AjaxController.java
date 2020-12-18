package com.nellem.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.nellem.datoMember.MemberDAO;
import com.nellem.datoMember.MemberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.on")
public class AjaxController extends HttpServlet {
	private void doHandler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI(); 	//uri :/member-mvc/list.do
		String com = uri.substring(uri.lastIndexOf("/")+ 1, uri.lastIndexOf(".on")); //command :insert

		
		
		if(com !=null && com.trim().equals("idCheck")) {
			MemberDAO dao = new MemberDAO();
			List<MemberDTO> dtos = dao.memberList();
			
			String signupID = request.getParameter("id");
			System.out.println(signupID);
			boolean chk = true;
			
			for(MemberDTO dto : dtos) {
				String dbID = dto.getId();
				if(dbID.equals(signupID)) {
					chk = false;
					System.out.println(signupID+dbID+chk);
				}
			}
			PrintWriter out = response.getWriter();
			out.print(chk);
		}
		
		
		
		if(com !=null && com.trim().equals("imageUploadOnForm")) {
			String savePath = request.getServletContext().getRealPath("img/boardImage");
			File file = new File(savePath);
			if(!file.exists()) { file.mkdir(); }
			int sizeLimit = 1024 * 1024 * 5;
			String fileName = UUID.randomUUID().toString();	
			String url = "downloadImage.action?file=" + fileName;
			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
			
			JSONObject json = new JSONObject();
			json.put("uploaded", 1);
			json.put("fileName", fileName);
			json.put("url", url);
			
			PrintWriter out = response.getWriter();
			System.out.println(json);
			out.println(json);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {doHandler(request, response);}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {doHandler(request, response);}
}

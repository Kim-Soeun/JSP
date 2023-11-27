package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.JSFunction;
import model.memberDAO;
import model.memberDTO;

public class UpdateMemberServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		ServletContext application = req.getServletContext();
		
		String saveDirectory = application.getRealPath("./resources/img");
		int maxPostSize = 5 * 1024 * 1024;
		String encoding = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		
		String id = mr.getParameter("id");
		String pw = mr.getParameter("pw");
		String name = mr.getParameter("name");
		String birthDate = mr.getParameter("birthDate");
		
		// 이메일 수정하지 않으면 기존 이메일 주소 그대로 db에 넣고 아니면 수정된 이메일 넣음
		String newEmail = "";
		String email1 = mr.getParameter("email1");
		String email2 = mr.getParameter("email2");
		String emailList = mr.getParameter("emailList");
		
		if(email1.equals("")) {
			newEmail = mr.getParameter("originalEmail");
		} else {
			if(email2.equals("")) {
				newEmail += email1 + "@" + emailList;
			} else {
				newEmail += email1 + "@" + email2;
			}
			
			
		}
		
		String phone = mr.getParameter("phone");
		String nickname = mr.getParameter("nickname");
		
		// 위치 정보가 수정되지 않았으면 기존 위치 db에 넣음
		String newLocation = "";
		String location = mr.getParameter("location");
		if(location == null) {
			newLocation = mr.getParameter("originalLocation");
		} else {
			newLocation = location;
		}
		
		// 프로필 사진 수정 안했으면 기존 파일 db에 넣음
		String newProfileImg = "";
		String newImg = mr.getParameter("newImg");
		
		if(newImg == null) {
			newProfileImg = mr.getParameter("originalImg");
		} else {
			newProfileImg = newImg;
		}
		
		
		memberDTO dto = new memberDTO();
		dto.setId(id);
		dto.setPassword(pw);
		dto.setName(name);
		dto.setBirthDate(birthDate);
		dto.setEmail(newEmail);
		dto.setPhone(phone);
		dto.setNickname(nickname);
		dto.setLocation(newLocation);
		dto.setProfileImg(newProfileImg);
		
		int result = new memberDAO().updateMember(dto);
		if(result == 1) {
			JSFunction.alertLocation(resp, "정보가 수정되었습니다", "main.jsp");
			System.out.println("회원정보 수정 성공");
		} else {
			System.out.println("회원정보 수정 실패");
		}
	}
	
}
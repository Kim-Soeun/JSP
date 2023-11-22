package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;
import model.memberDAO;
import model.memberDTO;

public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String birthDate = req.getParameter("birthDate");
		
		// 이메일 한 주소로 합치기(직접입력 or 선택)
		String email = "";
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		String emailList = req.getParameter("emailList");
		
		if(email2 == null) {
			email += email1 + "@" + emailList;
		} else {
			email += email1 + "@" + email2;
		}
		
		String nickname = req.getParameter("nickname");
		if(nickname == "") {
			nickname = id;
		}
		String phone = req.getParameter("phone");
		
		// 가입날짜 설정
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String registerDate = formatter.format(now);
		
		// 마지막 접속일
		Date date = new Date();
		SimpleDateFormat formatter2 = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
		String lastVisitDate = formatter2.format(date);
		
		memberDTO dto = new memberDTO();
		dto.setId(id);
		dto.setPassword(pw);
		dto.setName(name);
		dto.setBirthDate(birthDate);
		dto.setEmail(email);
		dto.setNickname(nickname);
		dto.setPhone(phone);
		dto.setRegisterDate(registerDate);
		dto.setLastVisitDate(lastVisitDate);
		
		int result = new memberDAO().registerMember(dto);
		
		if(result == 1) {		// 회원가입 성공했을 경우 유저 정보 세션에 저장 후 로그인 상태로 메인페이지 이동
			req.getSession().setAttribute("memberDTO", dto);
			resp.sendRedirect("main.jsp");
			System.out.println("회원가입 성공");
			
		} else {				// 회원가입 실패했을 경우
			JSFunction.alertBack(resp, "회원가입에 실패했습니다");
			System.out.println("회원가입 실패");
		}
	}
	
	
}

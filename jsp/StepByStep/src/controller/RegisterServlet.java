package controller;

import java.io.IOException;

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

		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		
		memberDTO dto = new memberDTO();
		dto.setId(id);
		dto.setPassword(pw);
		dto.setName(name);
		
		int result = new memberDAO().RegisterMember(dto);
		
		if(result == 1) {		// 회원가입 성공했을 경우 메인페이지로 이동
			resp.sendRedirect("main.jsp?id=" + id);
			System.out.println("회원가입 성공");
			
		} else {				// 회원가입 실패했을 경우
			JSFunction.alertBack(resp, "회원가입에 실패했습니다");
			System.out.println("회원가입 실패");
		}
	}
	
	
}

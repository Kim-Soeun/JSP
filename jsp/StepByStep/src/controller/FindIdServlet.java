package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;
import model.memberDAO;

public class FindIdServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
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
		
		String id = new memberDAO().findId(name, email, birthDate);
		
		if(id == null) {	// 정보와 맞는 아이디가 없을 경우 뒤로 페이지 이동하고 메시지 출력
			JSFunction.alertBack(resp, "다시 입력해주세요");
		} else {			// 정보와 맞는 아이디가 있을 경우 페이지 이동 후 아이디 알려줌
			resp.sendRedirect("FindResult.jsp?id=" + id);
		}
	}
	
}
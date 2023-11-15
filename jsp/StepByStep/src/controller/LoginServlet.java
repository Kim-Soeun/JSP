package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;
import model.memberDAO;

public class LoginServlet extends HttpServlet {
	
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		memberDAO dao = new memberDAO();
		int result = dao.LoginCheck(id, pw);
		
		if(result == 1) {			// 로그인 성공시 아이디 세션에 저장 후 메인화면으로 이동
			req.getSession().setAttribute("user_id", id);
			resp.sendRedirect("main.jsp?id=" + id);
			System.out.println("로그인 성공");
			
		} else {					// 로그인 실패시
			
			int result2 = dao.CheckDuplicateId(id);
			
			if(result2 == 0) {		// 아이디가 존재하지 않을 경우
				JSFunction.alertBack(resp, "아이디가 존재하지 않습니다");
			} else {				// 비밀번호가 틀릴 경우
				JSFunction.alertBack(resp, "비밀번호를 다시 확인해주세요");
			}
				
		}
	
		dao.close();
	}
	
	
	
	
}

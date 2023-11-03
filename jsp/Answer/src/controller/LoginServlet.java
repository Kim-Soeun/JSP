package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.memberDAO;

public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		memberDAO dao = new memberDAO();
		int loginResult = dao.LoginCheck(id, pw);
		int IdCheckResult = dao.CheckDuplicateId(id);
		
		if(loginResult == 1) {			// 아이디 비밀번호 일치할 경우
			req.getSession().setAttribute("user_id", id);
			resp.sendRedirect("home.jsp?id=" + id);
		
		} else {						// 아이디 비밀번호 일치하지 않을 경우
			
			if(IdCheckResult == 0) {	// 아이디 없을 경우
				req.getSession().setAttribute("message", "존재하지 않는 아이디입니다");
				resp.sendRedirect("login.jsp");
			} else {					// 비밀번호 틀렸을 경우
				req.getSession().setAttribute("message", "비밀번호가 일치하지 않습니다");
				resp.sendRedirect("login.jsp");
			}
		
		}
		
		
	
	}
	
	
}

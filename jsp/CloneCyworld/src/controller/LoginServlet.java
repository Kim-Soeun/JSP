package controller;

import java.io.IOException;
import java.sql.SQLException;

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
		
		memberDAO cyMemberDao = new memberDAO();
		
		int result = cyMemberDao.LoginCheck(id, pw);
		
		if(result == 1) {
			req.getSession().setAttribute("user_id", id);
			resp.sendRedirect("home.jsp?id=" + id);
		} else {
			try {
				int result2 = cyMemberDao.CheckDuplicateId(id);
				if(result2 == 0) {
					req.getSession().setAttribute("errorMsg", "존재하지 않는 아이디입니다");
					resp.sendRedirect("login.jsp?errorCode=1");
				} else {
					req.getSession().setAttribute("errorMsg", "비밀번호가 맞지 않습니다");
					resp.sendRedirect("login.jsp?errorCode=2");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		cyMemberDao.close();
	}
	
}

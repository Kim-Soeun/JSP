package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.memberDAO;

public class IdCheckServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		
		memberDAO dao = new memberDAO();
		int result = 0;
		
		result = dao.CheckDuplicateId(id);
		
		req.setAttribute("userId", id);
		req.setAttribute("result", result);
		req.getRequestDispatcher("idCheck.jsp").forward(req, resp);
		dao.close();
	}
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
	}
	
	
}

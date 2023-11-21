package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.memberDTO;
import model.recommendDAO;

public class RecommendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no =  Integer.parseInt(request.getParameter("no"));
		memberDTO member = (memberDTO)request.getSession().getAttribute("memberDTO");
		String id = member.getId();
		
		int result = new recommendDAO().UpdateRecommendCount(no, id);
		
		if(result == 1) {
			response.sendRedirect("boardList.jsp");
			System.out.println("추천 업데이트 성공");
		} else {
			response.sendRedirect("boardList.jsp");
			System.out.println("추천 업데이트 실패");
		}
		
	}

}

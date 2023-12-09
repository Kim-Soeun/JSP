package controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberDTO;
import model.RecommendDAO;

public class RecommendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no =  Integer.parseInt(request.getParameter("no"));
		String id = (String) request.getSession().getAttribute("userId");
		int result = new RecommendDAO().updateRecommendCount(no, id);
		
		
//		if(result == 1) {
//			crewName = URLEncoder.encode(crewName, "UTF-8");
//			// response.sendRedirect("crewBoardList.jsp?crewName=" + crewName);
//			System.out.println("추천 업데이트 성공");
//		} else {
//			crewName = URLEncoder.encode(crewName, "UTF-8");
//			// response.sendRedirect("crewBoardList.jsp?crewName=" + crewName);
//			System.out.println("추천 업데이트 실패");
//		}
		
	}

}
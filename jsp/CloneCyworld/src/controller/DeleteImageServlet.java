package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.imageDAO;

public class DeleteImageServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		int no = Integer.parseInt(req.getParameter("no"));
		
		imageDAO dao = new imageDAO();
		int result = dao.DeleteImage(id, no);
		
		if(result == 1) { 	// 사진 삭제 성공
			System.out.println("사진 삭제 성공");
			resp.sendRedirect("photolist.jsp?id=" + id);
		} else {			// 사진 삭제 실패
			System.out.println("사진 삭제 실패");
			resp.sendRedirect("photolist.jsp?id=" + id);
		}
	
	}

}

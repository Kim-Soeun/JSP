package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.guestbookDAO;

public class DeleteServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int b_no = Integer.parseInt(req.getParameter("b_no"));
		String id = req.getParameter("id");
		int result = new guestbookDAO().DeleteGuestbook(b_no);
		
		if(result == 1) {
			System.out.println("방명록 삭제 성공");
			resp.sendRedirect("guestbook.jsp?id="+id);
		} else {
			System.out.println("방명록 삭제 실패");
			resp.sendRedirect("guestbook.jsp?id="+id);
		}
		
	}
	
	
}

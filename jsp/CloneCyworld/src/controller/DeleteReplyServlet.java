package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReplyDAO;

public class DeleteReplyServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String ownerId = req.getParameter("id");
		String userId = (String)req.getSession().getAttribute("user_id"); 
		int no = Integer.parseInt(req.getParameter("no"));
		
		int result = new ReplyDAO().DeleteReply(no, userId);
		
		if(result == 1) {
			System.out.println("댓글 삭제 성공");
			resp.sendRedirect("guestbook.jsp?id=" + ownerId);
		} else {
			System.out.println("댓글 삭제 실패");
			resp.sendRedirect("guestbook.jsp?id=" + ownerId);
		}
	
	}
	
	
}

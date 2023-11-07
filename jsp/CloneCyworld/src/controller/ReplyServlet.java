package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Reply;
import model.ReplyDAO;

public class ReplyServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String ownerId = req.getParameter("id");
		String content = req.getParameter("content");
		String id = (String)req.getSession().getAttribute("user_id");
		int b_no = Integer.parseInt(req.getParameter("b_no"));
		
		LocalDateTime currentTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd hh:mm:ss");
		String created = currentTime.format(formatter);
		
		ReplyDAO dao = new ReplyDAO();
		Reply dto = new Reply();
		
		dto.setB_no(b_no);
		dto.setContent(content);
		dto.setCreated(created);
		dto.setId(id);
		int result = dao.InsertReply(dto);
		dao.close();
		
		if(result == 1) {		// 댓글 등록 성공
			resp.sendRedirect("guestbook.jsp?id=" + ownerId);
		} else {				// 댓글 등록 실패
			resp.sendRedirect("guestbook.jsp?id=" + ownerId);
		}
	
	}
	
	
	
}

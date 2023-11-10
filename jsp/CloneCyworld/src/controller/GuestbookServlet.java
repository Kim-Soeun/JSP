package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import common.JSFunction;
import model.guestbook;
import model.guestbookDAO;
import model.member;

public class GuestbookServlet extends HttpServlet {
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		guestbookDAO cyGuestbookDAO = new guestbookDAO();
		
		// id : 로그인한 유저(방명록 작성하는 사람)
		// ownerId : 홈페이지 주인
		String id = (String)req.getSession().getAttribute("user_id");
		String ownerId = req.getParameter("ownerId");
		
		
		LocalDateTime currentTime = LocalDateTime.now().withNano(0);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd hh:mm");
		String formattedTime = currentTime.format(formatter);
		String content = req.getParameter("content");

		guestbook dto = new guestbook();
		dto.setId(id);
		dto.setOwner_id(ownerId);
		dto.setCreated(formattedTime);
		dto.setContent(content);
		
		int result = cyGuestbookDAO.InsertGuestbook(dto);
		if(result == 1) {			// 방명록 글 입력 성공
			resp.sendRedirect("guestbook.jsp?id=" + ownerId);
			
		} else {					// 방명록 글 입력 실패
			resp.sendRedirect("guestbook.jsp?id=" + ownerId);
		}
		
		
	}
	
	
}

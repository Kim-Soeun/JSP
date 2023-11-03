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
		guestbookDAO cyGuestbookDAO = new guestbookDAO();
		
		
		String id = (String)req.getSession().getAttribute("user_id");
		member memDTO = (member)req.getSession().getAttribute("dto");
		String ownerId = memDTO.getId();
		
		
		LocalDateTime currentTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd hh:mm:ss");
		String formattedTime = currentTime.format(formatter);
		//String created = new SimpleDateFormat("yyyy.MM.dd hh:mm").format(currentTime);
		String content = req.getParameter("guestbook");

		guestbook dto = new guestbook();
		dto.setId(id);
		dto.setOwner_id(ownerId);
		dto.setCreated(formattedTime);
		dto.setContent(content);
		
		int result = cyGuestbookDAO.InsertGuestbook(dto);
		if(result == 1) {			// 방명록 글 입력 성공
			resp.sendRedirect("guestbook.jsp");
			
		} else {					// 방명록 글 입력 실패
			resp.sendRedirect("guestbook.jsp");
		}
		
		
	}
	
	
}

package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.musicDAO;
import model.musicDTO;

public class AddMusicServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		LocalDateTime curreDateTime = LocalDateTime.now().withNano(0);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd hh:mm");
		String created = curreDateTime.format(formatter);
		
		String title = req.getParameter("title");
		String artist = req.getParameter("artist");
		String id = req.getParameter("id");
		String youtubeId = req.getParameter("youtubeId");

		musicDTO dto = new musicDTO();
		
		dto.setTitle(title);
		dto.setArtist(artist);
		dto.setId(id);
		dto.setYoutubeId(youtubeId);
		dto.setCreated(created);
		
		int result = new musicDAO().AddMusic(dto);
		if(result == 1) {		// 음악이 등록된 경우
			System.out.println("음악 등록 성공");
			resp.sendRedirect("musicList.jsp?id=" + id);
		} else {				// 음악이 등록되지 않은 경우
			System.out.println("음악 등록 실패");
			resp.sendRedirect("addMusic.jsp?id=" + id);
		}
	
	}
	
	
}

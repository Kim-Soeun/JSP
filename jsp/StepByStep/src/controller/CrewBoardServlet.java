package controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.JSFunction;
import model.boardDAO;
import model.boardDTO;
import model.memberDTO;

public class CrewBoardServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; chatset=UTF-8");

		ServletContext application = req.getServletContext();
		
		String saveDirectory = application.getRealPath("./resources/img");
		int maxPostSize = 5 * 1024 * 1024;
		String encoding = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		
		memberDTO userDTO = (memberDTO)req.getSession().getAttribute("memberDTO");
		String id = userDTO.getId();				// 아이디
		String nickname = userDTO.getNickname();	// 닉네임
		
		LocalDateTime today = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
		String created = today.format(formatter);	// 작성일자
		
		String content = mr.getParameter("content");	// 내용
		String category = mr.getParameter("category");	// 카테고리
		
		String imgName = mr.getFilesystemName("fileImg");// 이미지파일
		
		File file = new File(saveDirectory + File.separator + imgName);
		
		boardDTO board = new boardDTO();
		board.setId(id);
		board.setNickname(nickname);
		board.setCreated(created);
		board.setContent(content);
		board.setCategory(category);
		board.setImgName(imgName);
		
		int result = new boardDAO().insertBoard(board);
		
		if(result == 1) {
			resp.sendRedirect("boardList.jsp");
			System.out.println("게시판 등록 성공");
		} else {
			JSFunction.alertBack(resp, "게시판을 다시 등록해주세요");
			System.out.println("게시판 등록 실패");
		}
		
		
	}
	
	
}

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

import model.imageDAO;
import model.imageDTO;

public class ImageServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; chatset=UTF-8");
		
		ServletContext application = req.getServletContext();
		
		String saveDirectory = application.getRealPath("./resources/img");
		int maxPostSize = 5 * 1024 * 1024;
		String encoding = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());

		LocalDateTime today = LocalDateTime.now().withNano(0);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd hh:mm");
		String created = today.format(formatter);
		
		String id = mr.getParameter("id");
		String title = mr.getParameter("title");
		String content = mr.getParameter("imgContent");
		String imgName = mr.getFilesystemName("fileImg");
		
		File file = new File(saveDirectory + File.separator + imgName);
		
		imageDTO image = new imageDTO();
		image.setId(id);
		image.setTitle(title);
		image.setContent(content);
		image.setCreated(created);
		image.setImgName(imgName);
		
		imageDAO dao = new imageDAO();
		int result = dao.InsertImage(image);
		dao.close();
		
		System.out.println(result);
		if(result == 1) {
			resp.sendRedirect("photolist.jsp?id=" + id);
			System.out.println("파일 등록 성공");
		} else {
			resp.sendRedirect("photobook.jsp?id=" + id);
			System.out.println("파일 등록 실패");
		}
		
		
	}
	
	
}

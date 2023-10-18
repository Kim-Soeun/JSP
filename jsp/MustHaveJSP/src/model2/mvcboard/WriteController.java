package model2.mvcboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

public class WriteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/14MVCBoard/Write.jsp").forward(request, response);
		
	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 파일 업로드 처리
		// 업로드 디렉토리의 물리적 경로 확인
		String saveDirectory = request.getServletContext().getRealPath("/Uploads");
		// application.getRealPath() 대신 request.getServletContext().getRealPath 쓰는 이유는 
		// java 파일이 아니기 때문에 application 내장객체가 없음
		// request.getServletContext().getRealPath  =  application.getRealPath()
		
		// 초기화 매개변수로 설정한 첨부파일 최대 용량 확인
		ServletContext application = getServletContext();
		// 웹에 설정한 값을 가져오기 위해 getServletContext(); 메소드 사용
		// 바로 java로 가져올 수 없기 때문에
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		// 파일 업로드
		MultipartRequest mr = FileUtil.uploadFile(request, saveDirectory, maxPostSize);
		
		if(mr == null) {	// 파일 업로드 실패
			JSFunction.alertLocation(response, "첨부파일 용량 초과", "../mvcboard/write.do");
			return;
		}
		
		
		
		// 2. 파일 업로드 외 처리
		// 폼값을 DTO에 저장
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setName(mr.getParameter("name"));
		dto.setTitle(mr.getParameter("title"));
		dto.setContent(mr.getParameter("content"));
		dto.setPass(mr.getParameter("pass"));
		
		
		// 원본 파일명과 저장된 파일 이름 설정
		String fileName = mr.getFilesystemName("ofile");
		if(fileName != null) {
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = now + ext;
			
			// 파일명 변경
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			dto.setOfile(fileName);
			dto.setSfile(newFileName);
		}
		
		// DAO를 통해 DB에 게시 내용 저장
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();
		
		// 성공 or 실패?
		if(result == 1) {
			response.sendRedirect("../mvcboard/list.do");
		} else {
			response.sendRedirect("../mvcboard/write.do");
		}

	}

}

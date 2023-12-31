<%@page import="fileupload.MyFileDAO"%>
<%@page import="fileupload.MyFileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String saveDirectory = application.getRealPath("/Uploads");	   // 저장할 디렉토리
	int maxPostSize = 1024 * 1000;				// 파일 최대 용량(1MB)
	String encoding = "UTF-8";					// 인코딩 방식
	
	try {
		// 1. MultipartRequest 객체 생성
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
		
		
		// 4. 다른 폼값 받기
		String name = mr.getParameter("name");    
		String title = mr.getParameter("title");
		String[] cateArray = mr.getParameterValues("cate");
		
		StringBuffer cateBuf = new StringBuffer(); 
		
		if(cateArray == null) {
			cateBuf.append("선택 없음");
		} else {
			for(String s : cateArray) {
				cateBuf.append(s + ", ");   // append : 선택된 요소의 마지막에 새로운 요소 추가
			}
		}
		
		
		// 2. 새로운 파일명 생성
		// 업로드한 파일 이름
		String fileName = mr.getFilesystemName("attachedFile");
		// 업로드한 파일 이름에서 확장자를 추출 (예. 장동건.jpg -> .jpg)
		String ext = fileName.substring(fileName.lastIndexOf("."));
		// 현재 날짜 시간 저장
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		// 신규 파일명 생성   예) 장동건.jpg  ->  20231012_33925.jpg
		String newFileName = now + ext;
		
		
		// 3. 파일명 변경
		File oldFile = new File(saveDirectory + File.separator + fileName);
		File newFile = new File(saveDirectory + File.separator + newFileName);
		oldFile.renameTo(newFile);
		
		// 5. DTO 생성
		MyFileDTO dto= new MyFileDTO();
		dto.setName(name);
		dto.setTitle(title);
		dto.setCate(cateBuf.toString());
		dto.setOfile(fileName);
		dto.setSfile(newFileName);
		
		
		// 6. DAO를 통해 데이터베이스에 반영
		MyFileDAO dao = new MyFileDAO();
		dao.insertFile(dto);
		dao.close();
		
		
		// 7. 파일 목록 JSP로 리다이렉션
		response.sendRedirect("FileList.jsp");
		
	} catch(Exception e) {
		e.printStackTrace();
		request.setAttribute("errorMessage", "파일 업로드 오류");
		request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
	}
	
%>

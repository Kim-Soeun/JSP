<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	<%
		String saveDirectory = application.getRealPath("/Uploads"); // 실제 저장 폴더 공간
		int maxPostSize = 5 * 1024 * 1024;		// 파일 최대 용량 5MB
		String encoding = "UTF-8";
		
		
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy()); 
		// DefaultFileRenamePolicy : 파일 업로드 시 서버에 이미 동일한 이름의 파일이 존재하면 덮어쓰기나 충돌을 방지하기 위해 사용
		// 업로드된 각 파일에 대해 새로운 이름을 생성하여 서버에 저장
		
		
		String id = mr.getParameter("id");
		String pw = mr.getParameter("pw");
		String name = mr.getParameter("name");
		String phone = mr.getParameter("phone");
		String address = mr.getParameter("address");
		String photoimage = mr.getFilesystemName("photoImage");
		
		// 디렉토리 경로, 파일 구분자, 파일 이름을 결합하여 전체 파일 경로를 생성
		// 아래 코드가 없으면 Uploads에 업로드된 파일들이 프로젝트 종료시 사라짐
		File photoFile = new File(saveDirectory + File.separator + photoimage);
		
		MemberDAO dao = new MemberDAO();
		
		String sql = "select * from member";
		PreparedStatement psmt = dao.con.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		
		String result = "";
		while(rs.next()) {
			String id2 = rs.getString(1);
			
			if(id.equals(id2)) {
				result = "기존회원입니다";
				request.getRequestDispatcher("addMember.jsp?error=1").forward(request, response);
				break;
			} 
		}
		dao.addMember(id, name, pw, phone, address, photoimage);
		result = "회원 가입을 환영합니다";
		dao.close();
		
		
	%>
	
	<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>
	
	<div class="container">
		<h1 class="display-5"><%= result %></h1>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>
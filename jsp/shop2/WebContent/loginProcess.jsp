<%@page import="dto.MemberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.MemberDAO"%>
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
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberDTO(id, pw);
		
		String result = "";
		if(dto.getId() != null) {
			session.setAttribute("UserId", dto.getId());
			session.setAttribute("UserPw", dto.getPw());
			session.setAttribute("UserName", dto.getName());
			result = dto.getName() + "님 환영합니다";
		} else {
			request.getRequestDispatcher("login.jsp?error=1").forward(request, response);
		}
	 	dao.close();	
		
	%>
	
	<%@ include file="menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인 처리</h1>
		</div>
	</div>
	
	<div class="container">
		<h1 class="display-5"><%=result %></h1>
		<a href="welcome.jsp" class="btn btn-secondary">돌아가기</a>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>
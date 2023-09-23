<%@page import="dao.MemberDAO"%>
<%@page import="dto.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String)session.getAttribute("UserId");
		String pw = request.getParameter("pw");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		
		MemberDAO dao = new MemberDAO();
		String result = dao.editMember(pw, phone, address, id);
		dao.close();
		
	
	%>
	
	<%@ include file="menu.jsp" %>
	
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원정보수정</h1>
		</div>
	</div>
	
	<div class="container">
		<h1 class="display-5"><%=result %></h1>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>
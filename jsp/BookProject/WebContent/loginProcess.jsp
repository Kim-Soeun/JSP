<%@page import="common.JSFunction"%>
<%@page import="dao.MembershipDAO"%>
<%@page import="dto.MembershipDTO"%>
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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MembershipDAO dao = new MembershipDAO();
		MembershipDTO dto = dao.selectMember(id, pw);
		
		String result = "" ;
		if(id.equals(dto.getMemberid())) {
			if(pw.equals(dto.getMemberpw())) {
				session.setAttribute("UserId", id);
				session.setAttribute("UserPw", pw);
				result = dto.getMembername() + "님 환영합니다";
			} else {
				JSFunction.alertBack("비밀번호가 존재하지 않습니다", out);
			} 
		} else {
			JSFunction.alertBack("아이디가 일치하지 않습니다", out);
		}
	
	%>
	
	<%@ include file="top.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인 처리</h1>
		</div>
	</div>
	
	<div class="container">
		<h1 class="display-5"><%= result %></h1>
	</div>
</body>
</html>
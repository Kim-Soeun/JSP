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
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		
		MembershipDTO dto = new MembershipDTO();
		MembershipDAO dao = new MembershipDAO();
		int result = dao.insertMember(id, pw, name, address, tel);
	
		String str = "";
		if(result == 1) {
			str = name + "님 회원가입이 완료되었습니다";
		} else {
			JSFunction.alertBack("회원가입을 다시 해주세요", out);
		}
	
	%>
	
	
	<%@ include file="top.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원가입 처리</h1>
		</div>
	</div>
	
	<div class="container">
		<h1 class="display-5"><%= str %></h1>
	</div>
	
	
</body>
</html>
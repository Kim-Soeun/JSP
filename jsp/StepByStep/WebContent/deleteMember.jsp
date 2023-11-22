<%@page import="model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>

<%
	memberDTO dto = (memberDTO)session.getAttribute("memberDTO");
	String id = dto.getId();
	String pw = dto.getPassword();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
	<form action="DeleteMemberServlet" method="post">
		<input type="hidden" name="id" value="<%=id%>">
		<input type="hidden" name="pw" value="<%=pw%>">
		<label>비밀번호 확인</label>
		<input type="password" name="pwCheck">
		<button type="submit">회원탈퇴</button>
	</form>
	

</body>
</html>
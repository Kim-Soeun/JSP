<%@page import="model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%
	memberDTO memberDTO = (memberDTO)session.getAttribute("memberDTO");
	String userId = memberDTO.getId();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크루 등록</title>
</head>
<body>

	<!-- 크루명이 기존에 있으면 경고창 뜨게 만들어야함 -->
	<form action="./crewRecruit.crew" method="post" name="frm">
		
		<label>크루명</label>
		<input type="text" name="crewName" required><br>

		<label>제목</label>
		<input type="text" name="title" required><br>
		
		<label>조건(내용)</label>
		<input type="text" name="content" placeholder="#24~28 여자만, #월 3회 참석 의무" required><br>
		
		<label>장소</label>
		<input type="text" name="location" required><br>
		
		<label>모집인원</label>
		<input type="text" name="memberNum" required><br>
		
		<label>모임날짜</label>
		<input type="text" name="gatherDate" required><br>

		<input type="hidden" name="adminId" value="<%=userId%>">

		<button type="submit">등록</button>
	</form>
	
	
</body>
</html>
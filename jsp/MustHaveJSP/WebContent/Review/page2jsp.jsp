<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="page.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		response.setIntHeader("Refresh", 1);
		// response : 웹 브라우저에 보내는 응답 정보를 담음
		// setIntHeader : name 헤더의 값을 정수 값 value로 지정
		// Refresh : 자동 새로고침
		// 1 : 1초마다 페이지 새로고침
		out.println("<br>");
		String nowTime = hour + ":" + minute + ":" + second;
		out.println("현재 접속 시간 " + nowTime);
	%>
	
</body>
</html>
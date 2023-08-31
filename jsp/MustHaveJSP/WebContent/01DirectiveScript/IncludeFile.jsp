<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		LocalDate today = LocalDate.now();						   
		// 오늘 날짜
	    // LocalDate : 날짜 형식
																   
		LocalDateTime tomorrow = LocalDateTime.now().plusDays(1);  
		// 내일 날짜
	    // LocalDateTime : 날짜 + 시간 형식
	%>
</body>
</html>
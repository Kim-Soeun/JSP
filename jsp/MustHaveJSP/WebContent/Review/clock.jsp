<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
		response.setIntHeader("Refresh", 5);
		// 5초에 한번 새로고침
		
		// Date로 날짜 시간 추출
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		String dateFormat = sdf.format(today);
		out.print("Date 방식 : " +  dateFormat);
		
		// LocalDateTime으로 날짜 시간 추출
		LocalDateTime now = LocalDateTime.now();
		String now2 = now.format(DateTimeFormatter.ofPattern("yyyy년 MM월 dd일 HH:mm:ss"));
	%>
	<h1>LocalDateTime 방식 : <%=now2 %></h1>
</body>
</html>
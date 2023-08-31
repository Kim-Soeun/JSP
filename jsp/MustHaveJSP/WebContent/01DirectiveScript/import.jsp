<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		Date today = new Date();
		// 현재 날짜와 시간 가져옴
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		// 날짜를 "yyyy-MM-dd" 형식으로 포맷팅하는 포맷터 생성
		String todayStr = dateFormat.format(today);
		// 생성한 포맷터 사용하여 현재 날짜 포맷팅, 날짜 문자열은 todayStr 변수에 저장
		out.println("오늘 날짜 : " + todayStr);
	%>
</body>
</html>
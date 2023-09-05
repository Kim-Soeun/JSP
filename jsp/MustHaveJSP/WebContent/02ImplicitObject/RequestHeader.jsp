<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 3. 요청 헤더 정보 출력하기 </h2>
	<%
		Enumeration headers = request.getHeaderNames();
		// Enumeration : 열거형
		// getHeaderNames() : 헤더 이름들을 열거형 형태로 얻을 수 있음
		
		while(headers.hasMoreElements()) {
		// 출력할 요청 헤더명이 더 있는지 확인
			String headerName = (String) headers.nextElement();
			// 헤더명이 더 있다면 요청 헤더의 이름을 얻어옴
			String headerValue = request.getHeader(headerName);
			// getHeader() 메소드에 헤더명을 건네 헤더값을 얻어옴
			out.print("헤더명 : " + headerName + ", 헤더값 : " + headerValue + "<br>");
		}
		
	%>
</body>
</html>
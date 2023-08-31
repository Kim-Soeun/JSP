<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="IncludeFile2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.print(name + "님 " + todaytime.getHour() + "시 " 
				+ todaytime.getMinute() + "분에 출석하셨습니다.");
	%>
</body>
</html>
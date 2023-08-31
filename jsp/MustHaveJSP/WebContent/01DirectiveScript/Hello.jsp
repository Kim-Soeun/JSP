<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!String str1 = "JSP";%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>안녕하세요</p>
	<p>
		<%
			out.println(str1 + "입니다.");
		%>
	</p>
	
</body>
</html>
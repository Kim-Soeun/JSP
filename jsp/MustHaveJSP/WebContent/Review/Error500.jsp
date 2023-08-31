<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="er500.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int myAge = Integer.parseInt(request.getParameter("age")) + 10;
		out.println("10 년 후 당신의 나이 : " + myAge);
	%>
</body>
</html>
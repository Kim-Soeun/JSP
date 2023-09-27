<%@page import="common.JSFunction"%>
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
		String id = (String)session.getAttribute("UserId");
	
		if(id == null) {
			JSFunction.alertLocation("로그인이 필요합니다", "login.jsp", out);
		}
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>

	<h1>${memberDTO.name}님 환영합니다!</h1>
		<a href="LogoutServlet">로그아웃</a>
		<a href="onedayCrew.jsp">단기크루</a>
		<a href="longTermCrew.jsp">장기크루</a>
		<a href="myInfo.jsp">나의기록</a>
		
	
</body>
</html>
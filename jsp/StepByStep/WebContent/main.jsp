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
		<a href="crewBoard.jsp">게시판 등록</a>
		<a href="boardList.jsp">크루 게시판</a>
	
</body>
</html>
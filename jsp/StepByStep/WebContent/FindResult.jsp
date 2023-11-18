<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 / 비밀번호 찾기</title>
</head>
<body>

	<c:if test="${not empty param.id}">
		<h3>아이디 : ${param.id}</h3>
	</c:if>
	<c:if test="${not empty param.pw}">
		<h3>비밀번호 : ${param.pw}</h3>
	</c:if>
	<a href="login.jsp">로그인하기</a>
</body>
</html>
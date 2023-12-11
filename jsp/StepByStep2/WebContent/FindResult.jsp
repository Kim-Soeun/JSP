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
	<c:if test="${not empty pw}">
		<h3>비밀번호 : ${pw}</h3>
		<form action="PwResetServlet" method="post" onsubmit="return pwCheck(this)">
		
			
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="prevPw" value="${pw}" />
			
			<label>비밀번호 재설정</label>
			<input type="password" name="pw" id="pw"/><br>
			
			<label>비밀번호 확인</label>
			<input type="password" name="pwCheck" id="pwCheck"/><br>
			
			<button type="submit" >재설정</button>
		</form>	
	</c:if>
	<script type="text/javascript" src="./resources/js/pwCheck.js"></script>
	<a href="login.jsp">로그인하기</a>
</body>
</html>
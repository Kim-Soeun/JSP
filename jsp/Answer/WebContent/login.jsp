<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css">
<link rel="stylesheet" href="./resources/css/index.css">
<link rel="stylesheet" href="./resources/css/login.css">
<title>로그인 페이지</title>
</head>
<body class="center-layout-column">
	<div class="center-layout-column">
		<img class="logo" alt="logo" src="./resources/img/cyworld.jpg">
		<div class="center-layout-column">
			<form class="login-wrapper" action="LoginServlet" method="post">
				<div class="input-wrapper">
					<label>아이디</label>
					<input type="text" name="id">			
				</div>
				<div class="input-wrapper">
					<label>비밀번호</label>
					<input type="password" name="pw">			
				</div>
				<span style="color: red;">${message}</span>
				<div class="center">
				<button class="btn" type="submit">로그인</button>
				</div>
			</form>
		</div>
		<div class="right" style="width: 300px;">
		<p>계정이 없으신가요?<a href="Register.jsp" class="point">회원가입</a></p>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>
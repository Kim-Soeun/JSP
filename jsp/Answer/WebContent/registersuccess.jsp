<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css">
<link rel="stylesheet" href="./resources/css/index.css">
<title>Insert title here</title>
</head>
<body class="center-layout-column">
	<div class="center-layout-column">
		<img class="logo" alt="logo" src="./resources/img/cyworld.jpg">
		<h3> 아이디 : ${id}</h3>
		<h3>${id}님 가입을 환영합니다!</h3>
		<button type="button" onclick="location.href='login.jsp'">로그인</button>
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>
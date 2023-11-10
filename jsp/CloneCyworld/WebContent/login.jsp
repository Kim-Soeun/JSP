<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/index.css" />
<link rel="stylesheet" href="./resources/css/login.css" />
<title>로그인 페이지</title>
</head>
<body class="center-layout-column">
	<div class="center-layout-column">
		<img class="logo" alt="logo" src="./resources/img/cyworld.png" />
		<div class="center-layout-column">
			<form action="LoginServlet" method="post">
				<div class="box">
					<div class="input-wrapper">
						<label>아이디</label>
						<input type="text" name="id" required/>
					</div>
					<div class="input-wrapper">
						<label>비밀번호</label>
						<input type="password" name="pw" required/>
					</div>
					<c:if test="${param.errorCode==1}">
						<span style="color: red;">${errorMsg}</span>
						<%session.removeAttribute("errorMsg"); %>
					</c:if>
					<c:if test="${param.errorCode==2}">
						<span style="color: red;">${errorMsg}</span>
						<%session.removeAttribute("errorMsg"); %>
					</c:if>
					<div class="right">
						<button type="submit">로그인</button>
					</div>
					
				</div>
			</form>
			<p class="register right">
				계정이 없으신가요? <a href="Register.jsp" class="point">회원가입</a>
			</p>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
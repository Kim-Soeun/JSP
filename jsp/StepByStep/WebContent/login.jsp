<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="LoginServlet" method="post">
		<label>아이디</label>
		<input type="text" name="id" required/>

		<label>비밀번호</label>
		<input type="password" name="pw" required/>
		
		<button type="submit">로그인</button>
	</form>

		<a href="Register.jsp">회원가입</a>
		
</body>
</html>
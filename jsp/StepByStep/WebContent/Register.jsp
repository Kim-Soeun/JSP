<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="RegisterServlet" method="post">
		<label>아이디</label>
		<input type="text" name="id" required/>
		
		<label>비밀번호</label>
		<input type="password" name="pw" required/>
		
		<label>이름</label>
		<input type="text" name="name" required/>
	</form>
	
	
	
</body>
</html>
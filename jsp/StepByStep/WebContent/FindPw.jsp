<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<form action="FindPwServlet" method="post">
		<label>아이디</label>
		<input type="text" name="id" required/>

		<label>이름</label>
		<input type="text" name="name" required/>

		<label>이메일</label>
		<input type="text" name="email" required/>

		<label>생년월일</label>
		<input type="text" name="birthDate" required/>
		
		<button type="submit">비밀번호 찾기</button>
	</form>

</body>
</html>
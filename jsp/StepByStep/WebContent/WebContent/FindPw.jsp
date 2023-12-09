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
		<input type="text" name="id" required/><br>

		<label>이름</label>
		<input type="text" name="name" required/><br>

		<label>이메일</label>
		<input type="text" name="email1" required/>@
		<input type="text" name="email2" value="" required/>
		<select name="emailList" size="1" onchange="email_check()">
			<option id="write">직접입력</option>
			<option value="naver.com">naver.com</option>
			<option value="gmail.com">gmail.com</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="nate.com">nate.com</option>
		</select><br>

		<label>생년월일</label>
		<input type="text" name="birthDate" required/><br>
		
		<button type="submit">비밀번호 찾기</button>
	</form>

</body>
</html>
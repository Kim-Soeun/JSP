<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="./resources/js/register.js"></script>
<script type="text/javascript" src="./resources/js/updateNicknameValue.js"></script>
<title>회원가입</title>
</head>
<body>
	<form action="RegisterServlet" method="post" name="frm">
		<label>아이디</label>
		<input type="text" name="id" id="id" oninput="updateNicknameValue()" required/><br>
		
		<label>비밀번호</label>
		<input type="password" name="pw" required/><br>
		
		<label>이름</label>
		<input type="text" name="name" required/><br>

		<label>생년월일(주민번호 앞자리)</label>
		<input type="text" name="birthDate" required/><br>

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
		
		<label>닉네임</label>
		<input type="text" name="nickname" id="nickname" /><br>
		
		<label>전화번호</label>
		<input type="text" name="phone"/><br>
		
		<button type="submit">회원가입</button>
	</form>
	
	
	
</body>
</html>

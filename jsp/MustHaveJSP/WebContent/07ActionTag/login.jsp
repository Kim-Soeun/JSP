<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
		width: 300px;
		height: 300px;
		margin: 0 auto;
	}
	
</style>
</head>
<body>
	<div>
	<form action="loginProcess.jsp" method="post">
	<!-- loginProcess로 아이디와 비밀번호 값 넘김 -->
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw"></td>
			</tr>
		</table>
		<input id="login" type="submit" value="로그인">
	</form>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="memberStyle.css">
</head>
<body>
	<div>
		<h2>회원 가입</h2>
		<form action="addProcess.jsp" method="post">
			<table>

				<tr>
					<td>아이디 </td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>이름 </td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>비밀번호 </td>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<td>비밀번호 확인 </td>
					<td><input type="password" name="pw2"></td>
				</tr>
				<tr>
					<td>전화번호 </td>
					<td><input type="tel" name="phone" placeholder="010-1234-5678">
						</td>
				</tr>
				<tr>
					<td>이메일 </td>
					<td><input type="text" name="email"> @ 
					<select	name="domain">
							<option value="">직접 입력</option>
							<option value="@naver.com">naver.com</option>
							<option value="@daum.net">daum.net</option>
							<option value="@google.com">google.com</option>
					</select></td>
				</tr>
				<tr>
					<td>문자수신 여부 </td>
					<td><input type="radio" name="msg" value="예" checked>예
						<input type="radio" name="msg" value="아니오">아니오 <br></td>
				</tr>
				<tr>
					<td>가입 경로 </td>
					<td><input type="checkbox" name="path" value="친구 소개">친구
						소개 <input type="checkbox" name="path" value="인터넷 검색">인터넷
						검색 <input type="checkbox" name="path" value="블로그">블로그 <input
						type="checkbox" name="path" value="기타">기타 <br></td>
				</tr>
				<tr>
					<td>가입하기 </td>
					<td><input type="submit" value="전송"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
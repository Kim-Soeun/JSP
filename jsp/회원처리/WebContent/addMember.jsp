<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="top.jsp"/>
	<br><br>
	<%
		String error = request.getParameter("error");
		String result = "";
		if(error != null) {
			result = "아이디가 중복되었습니다";
		}
	%>
	
	<h2><%=result %></h2>
	
	<form action="addMemberProcess.jsp" method="post">
	<table>
		<tr>
			<td>아이디</td> 
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td> <input type="password" name="pw"></td>
		</tr>
		<tr>
			<td>이름</td> 
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="text" name="gender"></td>
		</tr>
		<tr>
			<td>생일</td> 
			<td><input type="text" name="birth"></td>
		</tr>
		<tr>
			<td>메일</td>
			<td><input type="text" name="mail"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<td>주소</td> 
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<td>가입일자</td> 
			<td><input type="text" name="registday"></td>
		</tr>
		<tr>
			<td></td>
			<td><input type="submit" value="회원가입"></td>
		</tr>
	</table>
	</form>
	
</body>
</html>
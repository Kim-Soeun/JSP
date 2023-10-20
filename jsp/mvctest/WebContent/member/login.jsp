<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:import url="/member/menu.jsp" />

	<c:if test="${not empty param.error}">
		<h2>다시 로그인해주세요</h2>
	</c:if>

	<form method="post" action="../member/loginServlet">
		아이디 <input type="text" name="id"> 
		비밀번호 <input type="password" name="pw"> 
		<input type="submit" value="전송">
	</form>


</body>
</html>
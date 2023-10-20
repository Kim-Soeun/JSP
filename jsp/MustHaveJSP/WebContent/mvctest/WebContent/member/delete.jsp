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
	
	<form method="post" action="../member/deleteServlet">
		비밀번호 <input type="password" name="pw">	
		<input type="submit" value="전송">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="car" class="common.Car" scope="request"></jsp:useBean>
	<jsp:forward page="paramForward2.jsp?carCompany=현대">
		<jsp:param value="300" name="carMaxSpeed"/>
	</jsp:forward>
</body>
</html>
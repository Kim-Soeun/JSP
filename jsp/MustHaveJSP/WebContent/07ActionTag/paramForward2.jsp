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
	<ul>
		<li>자동차 회사 : <%= request.getParameter("carCompany") %></li>
		<li>자동차 최고속도 : <%= request.getParameter("carMaxSpeed") %></li>
	</ul>
</body>
</html>
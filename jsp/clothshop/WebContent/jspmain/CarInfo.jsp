<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Car" %>
<%@ page import="dto.CarRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
		border: 2px solid black;
		display: inline-block;
}
</style>
</head>
<body>
	<%
	
		String id = request.getParameter("id");
		CarRepository dao = new CarRepository();
		Car car = dao.carById(id);
	%>
	
	<div>
		<img src="../resources/images/<%=car.getCarId() %>.png">
		<h3>아이디 : <%=car.getCarId() %></h3>
		<h3>자동차명 : <%=car.getCarName() %></h3>
		<h3>제조회사 : <%=car.getCarCompany() %></h3>
		<h3>색상 : <%=car.getCarColor() %></h3>
		<h3>가격 : <%=car.getCarCost() %>원</h3>
	</div>
</body>
</html>
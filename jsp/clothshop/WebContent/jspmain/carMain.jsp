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
</head>
<body>

<%
	CarRepository dao = new CarRepository();
	ArrayList<Car> listOfCars = dao.getAllCars();
	
	for(int i=0; i<listOfCars.size(); i++) {
		Car car = listOfCars.get(i);
	
%>
	<a href="CarInfo.jsp?id=<%=car.getCarId()%>"><img src="../resources/images/<%=car.getCarId()%>.png"></a>
	
	<% } %>
</body>
</html>
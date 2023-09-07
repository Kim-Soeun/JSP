<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Car" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>자동차 상품</h1>

	<%
		HashMap<Integer, Car> cars = new HashMap<>();
		cars.put(1111, new Car("랜드로버 디스커버리", 120000000, "ivory"));
		cars.put(1112, new Car("벤츠 E클래스", 90000000, "black"));
		cars.put(1113, new Car("포르쉐", 100000000, "navy"));
		
		application.setAttribute("cars", cars);
	
	%>
</body>
</html>
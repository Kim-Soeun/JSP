<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
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

	<h1>자동차 상품 목록</h1>
	<%
		HashMap<Integer, Car> cars = (HashMap<Integer, Car>)(application.getAttribute("cars"));
		Set<Integer> keys = cars.keySet();
		
		Iterator<Integer> iterator = keys.iterator();
		for(int i=0; i<cars.size(); i++) {
			Car car = cars.get(iterator.next());
			out.print("자동차 이름 : " + car.getCarName() + "<br> 자동차 가격 : " + car.getCarPrice() + "<br>");
		}
		
		for(int key : keys) {
			Car car = cars.get(key);
			out.print("자동차 이름 : " + car.getCarName() + "<br> 자동차 가격 : " + car.getCarPrice() + "<br>");
		}
	%>
</body>
</html>
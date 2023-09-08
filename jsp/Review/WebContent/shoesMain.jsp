<%@page import="java.util.ArrayList"%>
<%@page import="dto.ShoesRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Shoes" %>
<%@ page import="dto.ShoesRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
		display: inline-block;
</style>
</head>
<body>
	<%
		
		ShoesRepository dao = new ShoesRepository();
		ArrayList<Shoes> listOfShoes = dao.getAllShoes();
		
		for(int i=0; i<listOfShoes.size(); i++) {
			Shoes shoes = listOfShoes.get(i);
	%>		

		<div>
			<a href="shoesInfo.jsp?id=<%=shoes.getShoesId() %>"><img src="resources/images/<%=shoes.getShoesId() %>.png"></a>
			<h3><%=shoes.getShoesName() %></h3>
			<h3><%=shoes.getShoesId() %></h3>
			<h3><%=shoes.getShoesBrand() %></h3>
			<h3><%=shoes.getShoesColor() %></h3>
			<h3><%=shoes.getShoesPrice() %></h3>
		</div>
		
	<% 	} %>
	
	
</body>
</html>
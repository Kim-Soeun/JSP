<%@page import="java.util.ArrayList"%>
<%@page import="dto.ClothesRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Cloth" %>
<%@ page import="dto.ClothesRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	
	<%@ include file="head.jsp" %>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	
	<%
		ClothesRepository dao = new ClothesRepository();
		ArrayList<Cloth> clothes = dao.getAllProducts();
	%>
	
	<div class="container">
		<div class="row" align="center">
		
		
	
	<%
		for(int i=0; i<clothes.size(); i++) {
			Cloth cloth = clothes.get(i);
	%>
	
	<div>
		<img src="../resources/images/<%=cloth.getClothId() %>.png">
		<a href="clothesInfo.jsp?id=<%=cloth.getClothId() %>" 
		   class="btn btn-secondary" role="button">상세정보</a>
		<h3>상품명 : <%=cloth.getClothName() %></h3>
		<h3>상품 사이즈 : <%=cloth.getClothSize() %></h3>
		
	</div>
	
	<%} %>
		</div>
	</div>
	
</body>
</html>
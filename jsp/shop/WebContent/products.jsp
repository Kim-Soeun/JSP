<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dto.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
	<!-- 회색배경 -->
		<div class="container">
		<!-- 네모 박스 설정 -->
			<h1 class="display-3">상품목록</h1>
		</div>
	</div>
	
	<% 
		ProductRepository dao = new ProductRepository();
		ArrayList<Product> listOfProducts = dao.getAllProducts();
	%>
	<div class="container">
		<div class="row" align="center">
			<%
				for(int i=0; i<listOfProducts.size(); i++) {
					Product product = listOfProducts.get(i);
 			%>
	 			<div class="col-md-4">
	 				<h3><%=product.getPname() %></h3>
	 				<h3><%=product.getDescription() %></h3>
	 				<h3><%=product.getUnitPrice() %></h3>
	 			</div>
 			<% 
 				}
			%>
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
	
	
</body>
</html>
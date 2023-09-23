<%@page import="dto.ProductRepository"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
	
	<%@ include file="menu.jsp" %>
	<%@ include file="LoginCheck.jsp" %>
	<div class="jumbotron">
	<!-- 회색배경 -->
		<div class="container">
		<!-- 네모 박스 설정 -->
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	
	<% 
		ProductRepository dao = new ProductRepository();
		dao.selectProduct();
		ArrayList<Product> listOfProducts = dao.getAllProducts();
		dao.close();
	%>
	<div class="container">
		<div class="row" align="center">
	
			<%
				for(int i=0; i<listOfProducts.size(); i++) {
					Product product = listOfProducts.get(i);
 			%>
	 			<div class="col-md-4">
	 				<img src="resources/images/<%=product.getProductId() %>.png" style="width:100%">
	 				<h3><%=product.getPname() %></h3>
	 				<h3><%=product.getDescription() %></h3>
	 				<h3><%=product.getUnitPrice() %></h3>
	 				<p> 
	 				<a href="product.jsp?id=<%=product.getProductId() %>" 
	 				   class="btn btn-secondary" role="button">상세정보</a>
	 				<!-- form action을 사용할 때는 위처럼 파라미터를 보낼 수 없기 때문에 input에 따로 값을 넣어줘야 함 -->
	 				</p>
	 			</div>
 			<% 
 				}
			%>
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
	
	
</body>
</html>
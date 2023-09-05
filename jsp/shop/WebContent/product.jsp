<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dto.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 상세 정보</title>
</head>
<body>
	
	<%@ include file="menu.jsp" %>
	<div class="jumbotron">
	<!-- 회색배경 -->
		<div class="container">
		<!-- 네모 박스 설정 -->
			<h1 class="display-3">상품 상세 정보</h1>
		</div>
	</div>
	
	<%
		String id = request.getParameter("id");
		ProductRepository dao = new ProductRepository();
		Product product = dao.getProductById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="resources/images/<%=id %>.png" style="width:100%">
			</div>
	 			<div class="col-md-6">
	 				<h3><%=product.getPname() %></h3>
	 				<p><%=product.getDescription() %></p>
	 				
	 				<p>상품 코드 : <span class="badge badge-danger">
	 				<!-- 빨간 네모 상자 -->
	 				<%=product.getProductId()%></span></p>
	 				
	 				<p>제조사 : <%=product.getManufacturer() %></p>
	 				<p>구분 : <%=product.getCategory() %></p>
	 				<p>재고 : <%=product.getUnitsInStock() %>개</p>
	 				<p>가격 : <%=product.getUnitPrice() %>원</p>
	 				
	 				<p>
	 				<a href="#" class="btn btn-info">상품 주문</a>
	 				<a href="products.jsp" class="btn btn-secondary">상품 목록</a>
	 				</p>
	 			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
	
	
</body>
</html>
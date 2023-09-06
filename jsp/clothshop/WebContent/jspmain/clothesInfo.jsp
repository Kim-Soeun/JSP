<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Cloth" %>
<%@ page import="dto.ClothesRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		ClothesRepository dao = new ClothesRepository();
		Cloth cloth = dao.getProductById(id);
	%>
	
	<img src="../resources/images/<%=id %>.png">
	<h3>상품명 : <%=cloth.getClothName() %></h3>
	<h3>상품 아이디 : <%=cloth.getClothId() %></h3>
	<h3>상품 사이즈 : <%=cloth.getClothSize() %></h3>
	<h3>상품 색상 : <%=cloth.getClothColor() %></h3>
	<h3>상품 가격 : <%=cloth.getClothCost() %></h3>
</body>
</html>
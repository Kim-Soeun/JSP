<%@page import="java.io.DataOutput"%>
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
	}
</style>
</head>
<body>
	<%
		String id = request.getParameter("id");
		ShoesRepository dao = new ShoesRepository();
		Shoes shoes = dao.getShoesById(id);
	
	%>
	
	<div>
		<a href="shoesInfo.jsp?id=<%=id %>"><img src="resources/images/<%=id %>.png"></a>
		<h3> 제품명 : <%=shoes.getShoesName() %></h3>
		<h3>제품 아이디 : <%=shoes.getShoesId() %></h3>
		<h3>브랜드명 : <%=shoes.getShoesBrand() %></h3>
		<h3>색상 : <%=shoes.getShoesColor() %></h3>
		<h3>가격 : <%=shoes.getShoesPrice() %></h3>
	</div>
		
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ClothDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ClothDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ClothDAO dao = new ClothDAO();
	List<ClothDTO> lists = dao.selectList(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>

	<jsp:include page="menu.jsp"></jsp:include>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			<c:set var="clist" value="<%=lists%>"/> 
			<c:forEach items="${clist}" var="list">
				<div class="col-md-4">
					<img src="Uploads/${list.clothFile}" style="width: 300px; height: 200px;">
					<h3>${list.clothFile }</h3>
					<h3>상품코드 : ${list.clothId}</h3>
					<h3>상품타입 : ${list.clothType}</h3>
					<h3>사이즈 : ${list.clothSize}</h3>
					<h3>가격 : ${list.clothPrice}</h3>
				</div>
			</c:forEach>
		</div>
	</div>


</body>
</html>
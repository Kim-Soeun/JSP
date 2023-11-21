<%@page import="model.recommendDAO"%>
<%@page import="model.memberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.boardDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	List<boardDTO> boardlist = new boardDAO().SelectAllBoard();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 페이지</title>
</head>
<body>
	<c:forEach items="<%=boardlist%>" var="board">
		<div style="display: flex; flex-direction: column; justify-content: center; align-content: center;">
			<div>넘버 : ${board.no}</div>
			<div>${board.id}</div>
			<div>${board.nickname }</div>
			<div>${board.created}</div>
			<div>${board.content}</div>
			<div>${board.category}</div>
			<div>추천수 : ${board.count}</div>
			<form action="RecommendServlet">
				<input type="hidden" value="${board.no}" name="no">
				<button type="submit"> <img alt="하트" src="./resources/img/하트.jpg"> </button>
			</form>
			
			
			<p>추천수 : </p>
			
			<div><img style="width: 60px; height: 60px;" src="./resources/img/${board.imgName}" alt="${board.imgName}"></div>
		</div>
		
	</c:forEach>
</body>
</html>
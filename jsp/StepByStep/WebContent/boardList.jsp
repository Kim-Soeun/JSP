<%@page import="java.util.ArrayList"%>
<%@page import="model.boardDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="loginCheck.jsp" %>
    
<%
	List<boardDTO> boardlist = new boardDAO().selectAllBoard();

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
			<div><a href="boardPage.jsp?no=${board.no}">게시판넘버 : ${board.no}</a></div>
			<div>작성자 아이디 : ${board.id}</div>
			<div>작성자 닉네임 : ${board.nickname }</div>
			<div>작성일 : ${board.created}</div>
			<div>내용 : ${board.content}</div>
			<div>카테고리 : ${board.category}</div>
			<div>추천수 : ${board.count}</div>
			<form action="RecommendServlet">
				<input type="hidden" value="${board.no}" name="no">
				<button type="submit"> <img alt="하트" src="./resources/img/하트.jpg"> </button>
			</form>
			
			<!-- 이미지는 있으면 화면에 출력, 없으면 출력 x -->
			<c:if test="${not empty board.imgName}">
				<div><img style="width: 60px; height: 60px;" src="./resources/img/${board.imgName}" alt="${board.imgName}"></div>
			</c:if>
		</div>
		
	</c:forEach>
</body>
</html>
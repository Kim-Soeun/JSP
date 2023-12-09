<%@page import="model.BoardDAO"%>
<%@page import="model.BoardDTO"%>
<%@page import="model.PhotoDAO"%>
<%@page import="model.PhotoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	List<BoardDTO> boardList = new PhotoDAO().selectPhotos();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진첩</title>
</head>
<body>
	<!-- <a href="updatePhoto.jsp">사진 올리기 (앨범에서 바로 사진 올리기 할지 안할지)</a> -->
	<!-- 크루원 or 방장이 아니면 삭제튼과 사진업로드 버튼 안나오게 설정하기 -->
	
	<c:forEach items="<%=boardList%>" var="board">
	<c:if test="${not empty board.imgName}">
		<div style="width: 150px; height: 150px; margin: 10px;">
			<a href="photoPage.jsp?imgName=${board.imgName}"><img style="width: 60px; height: 60px;" src="./resources/img/${board.imgName}"></a>
			<a href="DeletePhotoServlet?no=${board.no}">삭제</a>
		</div>
	</c:if> 
	</c:forEach>
	
</body>
</html>
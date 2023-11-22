<%@page import="model.photoDAO"%>
<%@page import="model.photoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	List<photoDTO> photoList = new photoDAO().selectAllPhoto();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진첩</title>
</head>
<body>
	<a href="updatePhoto.jsp">사진 올리기</a>
	
	<!-- 크루원 or 방장이 아니면 삭제튼과 사진업로드 버튼 안나오게 설정 -->
	
	<c:forEach items="<%=photoList%>" var="photo">
		<div style="width: 150px; height: 150px; margin: 10px;">
			<a href="DeletePhotoServlet?p_no=${photo.p_no}">사진 삭제</a>
			<p>넘버 : ${photo.p_no}</p>
			<p>작성자 : ${photo.id}</p>
			<p>제목 : ${photo.title}</p>
			<p>내용 : ${photo.content}</p>
			<p>업로드일 : ${photo.created}</p>
			<img style="width: 60px; height: 60px;" src="./resources/img/${photo.imgName}">
		</div>
	</c:forEach>
</body>
</html>
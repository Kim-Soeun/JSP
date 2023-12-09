<%@page import="model.PhotoDAO"%>
<%@page import="model.BoardDAO"%>
<%@page import="model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
 	String crewName = request.getParameter("crewName");
 	List<BoardDTO> photoList = new PhotoDAO().selectPhotosByCrew(crewName);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특정 크루의 앨범</title>
</head>
<body>

	<c:forEach items="<%=photoList%>" var="photo">
	<c:if test="${not empty photo.imgName}">
		<div style="width: 150px; height: 150px; margin: 10px;">
			<a href="photoPage.jsp?imgName=${photo.imgName}"><img style="width: 60px; height: 60px;" src="./resources/img/${photo.imgName}"></a>
			<a href="DeletePhotoServlet?no=${photo.no}">삭제</a>
		</div>
	</c:if> 
	</c:forEach>


</body>
</html>
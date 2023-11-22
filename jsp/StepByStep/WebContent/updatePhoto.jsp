<%@page import="model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%
	memberDTO dto = (memberDTO)session.getAttribute("memberDTO");
	String userId = dto.getId();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 업로드</title>
</head>
<body>

	<form class="form" action="UpdatePhotoServlet" method="post" enctype="multipart/form-data">

			<input type="hidden" name="id" value="<%=userId%>"/>

			<label>제목</label>
			<input type="text" name="title" required><br>
			
			<label>파일첨부</label>
			<input type="file" name="fileImg" onchange="setThumbnail(event)">
		
			<div id="photo-container" style="height: 70px; margin: 10px 0;"></div><br>
			<textarea name="content" style="height: 70px;" rows="10" cols="50"></textarea>
			<button style="height: 5%; margin: 5px;" type="submit">등록</button>
	</form>
						
<script type="text/javascript" src="./resources/js/photobook.js"></script>
			
</body>
</html>
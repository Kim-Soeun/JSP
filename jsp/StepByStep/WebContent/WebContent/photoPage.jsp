<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String imgName = request.getParameter("imgName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진첩 상세보기</title>
</head>
<body>
	<div style="width: 200px; height: 200px; margin: 10px;">
		<img style="width: 60px; height: 60px;" src="./resources/img/<%=imgName%>">
	</div>
</body>
</html>
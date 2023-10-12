<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String rgba = "red,green,blue,black";
	%>
	
	<h3>토큰 태그 사용</h3>
	
	<c:forTokens items="<%=rgba%>" delims="," var="color">
		<span style="color: ${color};">${color}</span><br>
	</c:forTokens>
	<!-- items 속성에는 문자열만 사용할 수 있음, 배열이나 컬렉션 사용 x -->


</body>
</html>
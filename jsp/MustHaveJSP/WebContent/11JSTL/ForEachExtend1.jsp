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
	<h3> 향상된 for문 형태의 forEach 태그 </h3>
	<%
		String[] rgba = {"빨강", "녹색", "파랑", "검정"};
	%>
	
	
	<c:forEach items="<%=rgba%>" var="c">
		<span style="color: ${c};">${c}</span>
	</c:forEach>


	<!-- 향상된 for 문은 인덱스 번호 0부터 시작 -->
	<h3> varStatus 속성 보기 </h3>
	<c:forEach items="<%=rgba%>" var="c" varStatus="s">
		<span>${s.count}</span>
		<span>${s.index}</span><br>
	</c:forEach>
</body>
</html>
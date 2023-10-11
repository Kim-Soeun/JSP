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
	<h3> 일반 for문 형태의 forEach 태그 </h3>
	<c:forEach begin="1" end="3" step="1" var="i">
		<p> 반복 ${i} 입니다.</p>
	</c:forEach>



	<h3> 1 ~ 100까지 짝수의 합계 </h3>
	<c:forEach begin="1" end="100" step="1" var="i">
		<c:if test="${j mod 2 eq 0}">
			<c:set var="sum" value="${sum + i}"/>
			<!-- 자바와는 다르게 sum 초기값 설정해주지 않아도 됨 -->
		</c:if>
	</c:forEach>
	<p> 1부터 100까지 짝수의 합계는 ${sum} 입니다 </p>
</body>
</html>
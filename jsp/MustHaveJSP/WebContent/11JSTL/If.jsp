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
	<c:set var="number" value="99"/>
	<c:set var="string" value="JSP"/>
	
	<!-- test : if에서 사용할 조건을 지정 -->
	<h3> 짝 홀수 판단하기 </h3>
	<c:if test="${number % 2 == 0}" var="result"> 
		${number}는 짝수입니다.<br>
	</c:if>

	<c:if test="${not result}" var="result2">
		${number}는 홀수입니다.<br>
	</c:if>


	<form action="If2.jsp" method="get">
		숫자 : <input type="text" name="num">
		<input type="submit" value="전송"> 
	</form>

</body>
</html>
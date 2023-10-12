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
	<c:set var="iTag">
		i 태그는 <i>기울임</i>을 표현합니다.
	</c:set>
	
	<!-- escapeXml 기본값은 true, 특수기호를 그대로 출력  -->
	<c:out value="${iTag}"></c:out>
	<br>
	<!-- escapeXml false로 설정하면 html 적용됨 -->
	<c:out value="${iTag}" escapeXml="false"></c:out>
	<br>
	<!-- default : value에 값이 없으면 default 출력 -->
	<c:out value='${param.name}' default="넘겨온 값이 없습니다."/>
</body>
</html>
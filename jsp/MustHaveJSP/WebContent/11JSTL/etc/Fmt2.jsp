<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="today" value="<%=new java.util.Date() %>"/>
	
	<h4> 날짜 포맷 </h4>
	full : <fmt:formatDate value="${today}" type="date" dateStyle="full"/><br>
	long : <fmt:formatDate value="${today}" type="date" dateStyle="long"/><br>
	default : <fmt:formatDate value="${today}" type="date" dateStyle="default"/>
	
	<h4> 시간 포맷 </h4>
	full : <fmt:formatDate value="${today}" type="time" timeStyle="full"/><br>
	default : <fmt:formatDate value="${today}" type="time" timeStyle="default"/><br>
	
	<h4> 날짜 + 시간 포맷 </h4>
	<fmt:formatDate value="${today}" type="both" pattern="yyyy-MM-dd hh:mm:ss"/><br>
	
	<h4> 타임존 설정 </h4>
	<fmt:timeZone value="America/Chicago">
		<fmt:formatDate value="${today}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
	</fmt:timeZone>
	
	<h4> 로케일 설정 </h4>
	<!-- 국가별로 다른 통화 기호나 날짜를 표현할 때 사용 -->
	<fmt:setLocale value="ja_JP"/>
	<fmt:formatNumber value="99999" type="currency"></fmt:formatNumber>
	
	
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.CookieManager" %>

<%
 	CookieManager.makeCookie(response, "ELCookie", "쿠키좋아요", 10);
	String value = CookieManager.readCookie(request, "ELCookie");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3> 쿠키값 읽기 </h3>
	<ul>
		<li>EL 쿠키값 : ${cookie.ELCookie.value}</li>
		<li>기본방식 쿠키값 : <%=value%></li>
	</ul>
</body>
</html>
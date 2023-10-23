<%@page import="java.sql.Connection"%>
<%@page import="mvc.database.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="c" value="<%=DBConnection.getConnection() %>" />	
	<c:if test="${not empty c}">
		<h2>연결 성공</h2>
		${c.close()}
	</c:if>
</body>
</html>
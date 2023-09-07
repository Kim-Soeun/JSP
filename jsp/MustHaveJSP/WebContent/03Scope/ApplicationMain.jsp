<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>

<!-- application 영역에 한 번 저장된 정보는 페이지를 이동하거나, 웹 브라우저를 닫았다가 새롭게 접속해도 삭제되지 x -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 영역</title>
</head>
<body>
	<h2> 애플리케이션 영역의 공유 </h2>
	<%
		Map<String, Person> maps = new HashMap<>(); 
		maps.put("actor1", new Person("이수일", 30));		// HashMap에 키와 값 저장
		maps.put("actor2", new Person("심순애", 28));
		application.setAttribute("maps", maps);			// maps 라는 속성 변수명에 HashMap "maps" 저장
		
	%>
	application 영역에 속성이 저장되었습니다.
</body>
</html>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 애플리케이션 영역의 속성 읽기 </h1>
	<%
		Map<String, Person> maps = (Map<String, Person>)application.getAttribute("maps");
	
		Set<String> keys = maps.keySet();		// 키를 얻음
		for(String key : keys) {
			Person person = maps.get(key);		// 값을 얻음
			out.print(person.getName() + " : " + person.getAge() + "<br>");
		}
	%>
</body>
</html>
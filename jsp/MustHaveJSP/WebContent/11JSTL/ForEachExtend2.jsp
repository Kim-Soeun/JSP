<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3> List 컬렉션 사용하기 </h3>
	<%
	LinkedList<Person> lists = new LinkedList<>();
	lists.add(new Person("맹사성", 34));
	lists.add(new Person("장영실", 44));
	lists.add(new Person("신숙주", 54));
	%>

	<c:set var="lists" value="<%=lists%>" />
	<c:forEach var="list" items="${lists}">
		<!-- li태그 사용시 ul 태그 자동으로 생성됨 -->
		<li>
			이름 : ${list.name}, 나이 : ${list.age}
		</li>
	</c:forEach>



	<h3> Map 컬렉션 사용하기 </h3>
	<%
	Map<String, Person> maps = new HashMap<>();
	maps.put("1st", new Person("맹사성", 34));
	maps.put("2nd", new Person("장영실", 44));
	maps.put("3rd", new Person("신숙주", 54));
	%>

	<!-- Map은 순서가 보장되지 않기 때문에 반복문으로 출력했을 때도 순서대로 나오지 않을 수 있음 -->
	<c:set var="maps" value="<%=maps%>" />
	<c:forEach items="${maps}" var="map">
		<li>키 => ${map.key} <br>
			값 => 이름 : ${map.value.name}, 나이 : ${map.value.age}
		</li>
	</c:forEach>	
	
</body>
</html>
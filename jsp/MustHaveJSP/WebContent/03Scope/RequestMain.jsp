<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>
	<% 
		request.setAttribute("requestInteger", 8282);
		request.setAttribute("requestString", "리퀘스트 영역의 문자열");
		request.setAttribute("requestPerson", new Person("안중근",31));
	%>
	
	<!-- 클라이언트가 요청을 할 때마다 새로운 request 객체가 생성됨 -->
	<!-- 같은 요청을 처리하는데 사용되는 모든 jsp 페이지가 공유함 -->
	<!-- request 영역에 저장된 정보는 현재 페이지와 포워드된 페이지까지 공유할 수 있음 -->
	<!-- request는 하나의 요청에 대한 응답이 완료될 때 소멸하므로 page 영역보다는 접근범위 넓음 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 리퀘스트 영역에 설정된 값 읽기 </h2>
	<%
		int num1 = (Integer)(request.getAttribute("requestInteger"));
		Person nPerson = (Person)(request.getAttribute("requestPerson"));
	%>
	
	<ul>
		<li> Integer 객체 : <%=num1 %></li>
		<li> String 객체 : <%=request.getAttribute("requestString") %></li>
	</ul>
	
	<%
		 request.getRequestDispatcher("RequestForward.jsp?name="+nPerson.getName()).forward(request, response);
	%>
</body>
</html>
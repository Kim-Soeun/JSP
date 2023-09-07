<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.Person" %>
<!-- 외부 클래스 import -->

<%
	pageContext.setAttribute("pageInteger", 1000);
	pageContext.setAttribute("pageString", "페이지 영역의 문자열");
	pageContext.setAttribute("pagePerson", new Person("한석봉", 30));
 %>
 <!-- page 영역에 속성값 저장 -->
 
<!-- jsp 페이지는 page 영역을 사용하기 위한 pageContext 객체를 할당 받게 됨 -->
<!-- pageContext는 내장 객체 중 하나 -->
<!-- 이 객체에 저장된 정보는 해당 페이지에서만 사용 가능, 페이지 벗어나면 정보 소멸 -->
<!-- 하지만, 파일을 여기로 include하면 속성값 가져다 쓸 수 있음(ex.PageInclude.jsp) -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 영역</title>
</head>
<body>
	<h2> page 영역의 속성값 읽기 </h2>
	<% 	int pInteger = (Integer)(pageContext.getAttribute("pageInteger"));  
		String pString = pageContext.getAttribute("pageString").toString();
		Person nPerson = (Person)(pageContext.getAttribute("pagePerson"));
	%>
	
	<h1><%=pInteger %></h1>
	<h1><%=pString %></h1>
	<h1><%=nPerson.getName() %></h1>
	
	<h2> include된 파일에서 page 영역 읽어오기 </h2>
	<%@ include file="PageInclude.jsp" %>

	<h2> * 페이지 이동 후 page 영역 불러오기 *</h2>
	<a href="PageLocation.jsp">페이지 로케이션 불러오기</a>
	
</body>
</html>
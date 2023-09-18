<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="common.Person" scope="request"/>
	<ul>
		<li><jsp:getProperty property="name" name="person"/></li>
		<li> 나이 : <jsp:getProperty property="age" name="person"/></li>
		<li> 본명 : <%=request.getParameter("param1") %></li>
		<li> 출생 : <%=request.getParameter("param2") %></li>
		<li> 특징 : <%=request.getParameter("param3") %></li>
	</ul>
	<jsp:include page="Inc/ParamInclude.jsp">
		<jsp:param value="강원도 영월" name="loc1"/>
		<jsp:param value="김삿갓면" name="loc2"/>
	</jsp:include>
</body>
</html>
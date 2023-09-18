<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String carName = request.getParameter("carName");
		int carPrice = Integer.parseInt(request.getParameter("carPrice"));
		String carColor = request.getParameter("carColor");
	%>
	
	<!-- property는 변수명 입력해줄 때 첫글자를 소문자로 시작해야 함 -->
	<!-- Car 클래스에서 변수명 첫글자가 대문자일 때 property 첫글자를 소문자로 적어도 받아들임  -->
	<jsp:useBean id="Car" class="common.Car" scope="request"/>
	<jsp:setProperty name="Car" property="carName" value="<%=carName %>"/>
	<jsp:setProperty name="Car" property="carPrice" value="<%=carPrice %>"/>
	<jsp:setProperty name="Car" property="carColor" value="<%=carColor %>"/>
	
	
	<h2>자바빈즈 출력</h2>
	<ul>
		
		<li> 자동차 이름 : <jsp:getProperty name="Car" property="carName" /></li>
		<li> 자동차 가격 : <jsp:getProperty name="Car" property="carPrice" /></li>
		<li> 자동차 색상 : <jsp:getProperty name="Car" property="carColor" /></li>
	</ul>
	
</body>
</html>
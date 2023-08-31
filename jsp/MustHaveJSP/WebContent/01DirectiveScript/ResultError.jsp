<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>오류가 발생했음</h1>
	<h1>  오류명 : <%=exception.getClass().getName()%></h1>
	<!-- exception : 현재 발생한 예외 객체, 발생한 예외에 관련된 정보에 접근할 수 있음 
	     getClass : 객체의 클래스 정보를 가져오는 역할 
	     getName : 클래스 이름을 문자열로 반환 -->
	
</body>
</html>
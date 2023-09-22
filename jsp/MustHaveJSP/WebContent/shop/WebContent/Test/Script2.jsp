<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 메소드 생성, 두 개의 숫자를 파라미터
	두 숫자의 합계를 리턴하는 메소드 -->
	
<%!
	public int sum(int num1, int num2) {
		int result = num1 + num2;
		return result;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 스크립틀릿 해당 메소드 호출   ex) 5,7 -> 12 -->
	
	<%
		int sum = sum(10,7);
	%>
	
	<!--  표현식 이용하여 합계 결과를 화면에 출력 -->
	<h2> 합계 : <%=sum %></h2>
	
</body>
</html>
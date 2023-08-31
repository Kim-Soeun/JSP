<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	public int sum() {
	int result = 0;
	for(int i=1; i<=100; i++) {
		result += i;
	}
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
	<% int result = sum(); %>
	<h1> 합계 결과는 <%= result %> 입니다. </h1>
</body>
</html>
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
		try {
			int myAge = Integer.parseInt("age") + 10;
			out.println("당신의 10년 후 나이 : " + myAge);
		}
		catch(Exception e) {
			out.println("예외가 발생했습니다. age의 값이 null입니다.");
		}
	%>
</body>
</html>
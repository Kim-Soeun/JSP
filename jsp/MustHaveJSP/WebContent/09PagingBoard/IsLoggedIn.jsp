<%@page import="utils.JSFunction"%>
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
		if(session.getAttribute("UserId") == null) {
			JSFunction.alertLocation("로그인 후 이용해주십시오", "../06Session/LoginForm.jsp", out);
			return;
			// 위 조건에서 실행을 멈추기 위해 return문 사용
		}
	%>
</body>
</html>
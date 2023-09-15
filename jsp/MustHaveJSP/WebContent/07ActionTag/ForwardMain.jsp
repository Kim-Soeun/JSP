<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("pAttr", "김유신");
	request.setAttribute("rAttr", "계백");
	
	// 액션 태그 forward : 요청 전달
	// 액션 태그를 만나기까지의 모든 출력을 제거하고 포워드할 페이지로 요청을 전달
	// 이동된 페이지와 request 영역을 공유
	// URL이 변경되지 않음(ForwardSub.jsp로 이동했으나 url 변하지 않음)
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - forward</title>
</head>
<body>
	<h2> 액션 태그 - forward </h2>
	<jsp:forward page="/07ActionTag/ForwardSub.jsp"></jsp:forward>
</body>
</html>
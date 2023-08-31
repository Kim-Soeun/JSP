<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="IncludeFile.jsp" %>
<!-- 반복되는 부분을 별도의 파일에 작성해두고 
	 필요한 페이지에서 include 지시어로 포함시킴 -->
	 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.print("오늘 날짜 : " + today);
		out.print("<br>");
		out.print("내일 날짜 : " + tomorrow);
	%>
</body>
</html>
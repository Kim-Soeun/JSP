<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 쿠키값 확인하기 </h2>
	<%
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				String cookieName = cookies[i].getName();
				String cookieValue = cookies[i].getValue();
				out.print(cookieName + " : " + cookieValue + "<br>");
				// 기본적으로 sessionid가 설정되어 있기 때문에 cookieName, cookieValue 출력시 처음에 항상 sessionid가 출력됨
				// ex) JSESSIONID : 36C7890DF0278E83C85D5E1CDEC746E4
			}
		}
	%>
</body>
</html>
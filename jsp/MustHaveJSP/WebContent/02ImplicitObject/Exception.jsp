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
		
		// 에러 발생 시 웹에 출력할 페이지와 경로를 web.xml에 지정
	
		int status = response.getStatus();
		// 에러 코드 숫자 가져옴 ex) 404, 405
	
		if(status == 404) {
			out.print("404 에러가 발생했습니다. ");
			out.print("<br/>파일 경로를 확인해주세요");
		} else if(status == 405) {
			out.print("405 에러가 발생했습니다. ");
			out.print("<br/>요청 방식(method)을 확인해주세요");
		} else if(status == 500) {
			out.print("500 에러가 발생했습니다. ");
			out.print("<br/>소스 코드에 오류가 없는지 확인해주세요");
	%>
</body>
</html>
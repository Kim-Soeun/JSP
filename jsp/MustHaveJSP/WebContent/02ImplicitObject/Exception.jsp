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
		int status = response.getStatus();
		// 에러 코드 숫자 가져옴 ex) 404, 405
	
		if(status == 404) {
			out.print("404 에러가 발생했습니다. ");
			out.print("파일 경로를 확인해주세요");
		} else if(status == 405) {
			out.print("405 에러가 발생했습니다. ");
			out.print("파일 경로를 확인해주세요");
		} else if(status == 500) {
			out.print("500 에러가 발생했습니다. ");
			out.print("파일 경로를 확인해주세요");
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="InputResult.jsp" method="get">
	<!-- action="InputResult.jsp : 폼이 제출될 때 데이터가 전송되는 대상 페이지 지정 -->
	
		시작 숫자를 입력하세요 <input type="text" name="num1">
		<br>
		끝 숫자를 입력하세요 <input type="text" name="num2">
		<input type="submit" value="보내기">
	</form>
</body>
</html>
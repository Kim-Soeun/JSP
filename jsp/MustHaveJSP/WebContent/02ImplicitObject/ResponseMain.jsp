<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 1. 로그인 폼 </h2>
	<%
		String loginErr = request.getParameter("loginErr");
		// loginErr = 로그인 실패여부를 알려주는 매개변수
		if(loginErr != null) out.print("로그인 실패");
		// 매개변수에 값이 들어있으면 로그인에 실패했음을 뜻함 -> "로그인 실패" 출력
		
	%>
	
	<form action="ResponseLogin.jsp" method="post">
		아이디 : <input type="text" name="user_id"><br>
		패스워드 : <input type="password" name="user_pwd"><br>
		<input type="submit" value="로그인">
	</form>
	
	<h2> 2. HTTP 응답 헤더 설정하기 </h2>
	<form action="ResponseHeader.jsp" method="get">
		날짜 형식 : <input type="text" name="add_date" value="2021-10-25 09:00"> <br>
		숫자 형식 : <input type="text" name="add_int" value="8282"> <br>
		문자 형식 : <input type="text" name="add_str" value="홍길동"><br>
		<input type="submit" value="응답 헤더 설정 & 출력">
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 액션 태그로 받은 아이디와 비밀번호 출력 -->
	<!-- 액션 태그는 request는 공유하나 page는 공유하지 않기 때문에 비밀번호 출력 x -->
	<h2>로그인 포워드 결과</h2>
	<ul>
		<li>
			아이디 : <%=request.getAttribute("UserId") %>
		</li>
		<li>
			비밀번호 : <%=pageContext.getAttribute("UserPw") %>
		</li>
	</ul>
</body>
</html>
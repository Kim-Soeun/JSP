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
	// login에서 받은 아이디는 리퀘스트로, 비밀번호는 페이지로 저장
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		request.setAttribute("UserId", id);
		pageContext.setAttribute("UserPw", pw);
	
	// loginProcess2로 전달
	%>

		<jsp:forward page="loginProcess2.jsp" />
</body>
</html>
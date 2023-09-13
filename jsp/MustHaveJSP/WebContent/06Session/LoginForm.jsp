<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 로그인 페이지 </h2>
	<span style="color:red; font-size:1.2em;">
		<%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
	</span>
	<%
		if(session.getAttribute("UserId") == null) {		// 로그인 상태 확인
		// 로그아웃 상태
	%>
	
	<script>
		function validateForm(form) {
			if (!form.user_id.value) {
				// form에 아이디가 비어 있다면(입력되어 있지 않다면)
				alert("아이디를 입력하세요");
				return false;
			}
			if(form.user_pw.value == "") {
				// form에 패스워드가 비어 있다면(입력되어 있지 않다면)
				alert("패스워드를 입력하세요");
				return false;
			}
		}
	</script>
	
	<form action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this)">
	<!-- onsubmit : 사용자가 form 제출하면 validateForm 함수 호출, 유효성 검사하여 true나 false 반환해줌 -->
		아이디 : <input type="text" name="user_id"> <br>
		비밀번호 : <input type="password" name="user_pw"> <br>
		<input type="submit" value="로그인하기">
	</form>
	
	
	<% } else {
	// 로그인 상태
	%>  
	
		<%=session.getAttribute("UserName") %> 회원님, 로그인하셨습니다. <br>
		<a href="Logout.jsp">[로그아웃]</a>
	<% } %>
</body>
</html>
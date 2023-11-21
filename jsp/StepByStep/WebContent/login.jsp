<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="LoginServlet" method="post">
		<label>아이디</label>
		<input type="text" name="id" required/>

		<label>비밀번호</label>
		<input type="password" name="pw" required/>
		
		<button type="submit">로그인</button>
	</form>

		<a href="Register.jsp">회원가입</a><br>
		<a href="FindId.jsp">아이디 찾기</a><br>
		<a href="FindPw.jsp">비밀번호 찾기</a>
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=c7b94b35c8cafa45f1e66ddbdd4fe24e
		&redirect_uri=http://localhost:8081/StepByStep/main.jsp&response_type=code"><img src="./resources/img/kakao_login_medium_narrow.png"></a>
	
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	Kakao.init('eb646ff5e97a36124d6083defab9e3f9');
	
	
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }  
</script>
</body>
</html>
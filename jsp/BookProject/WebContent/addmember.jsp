<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	
	<%@ include file="top.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원가입</h1>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
		
			<form class="form-signin" action="addmemberProcess.jsp" method="post">
			
				<div class="form-group">
				<label for="inputUserId" class="sr-only">아이디 </label>
				<input type="text" class="form-control" placeholder="아이디" 
				name="id" required autofocus> <br>
				</div>

				<div class="form-group">
				<label for="inputUserPw" class="sr-only">비밀번호 </label>
				<input type="password" class="form-control" placeholder="비밀번호" 
				name="pw" required> <br>
				</div>
				
				<div class="form-group">
				<label for="inputUserName" class="sr-only">이름 </label>
				<input type="text" class="form-control" placeholder="이름" 
				name="name" required> <br>
				</div>
				
				<div class="form-group">
				<label for="inputUserTel" class="sr-only">주소 </label>
				<input type="text" class="form-control" placeholder="주소" 
				name="address" required> <br>
				</div>
				
				<div class="form-group">
				<label for="inputUserTel" class="sr-only">연락처 </label>
				<input type="text" class="form-control" placeholder="연락처" 
				name="tel" required> <br>
				</div>
				
				<button class="btn btn-log btn-success btn-block"
					type="submit">회원가입</button>
			</form>
		</div>
	</div>
	
	
	
</body>
</html>
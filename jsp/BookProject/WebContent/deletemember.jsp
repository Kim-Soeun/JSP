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
	<%@ include file="LoginCheck.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원탈퇴</h1>
		</div>
	</div>
	
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
	<%
		String error= request.getParameter("error");
		if(error != null) {
			out.print("<div class='alert alert-danger'>");
			out.print("비밀번호를 다시 입력해주세요");
			out.print("</div>");
		}
	%>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
		
			<form class="form-signin" action="deleteProcess.jsp" method="post">
			
				<div class="form-group">
				<label for="inputUserPw" class="sr-only">비밀번호 </label>
				<input type="password" class="form-control" placeholder="비밀번호" 
				name="pw" required autofocus> <br>
				</div>
				
				<button class="btn btn-log btn-success btn-block"
					type="submit">회원탈퇴</button>
			</form>	
		</div>
	</div>
</body>
</html>
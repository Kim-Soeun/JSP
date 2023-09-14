<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	
	<%@ include file="menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 탈퇴</h1>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
		
		<%
			String errorMsg = request.getParameter("error");
			if(errorMsg != null) {
				out.print("<div class='alert alert-danger'>");
				out.print("비밀번호를 확인해주세요");
				out.print("</div>");
				
			}
		%>
		<form class="form-signin" action="deleteProcess.jsp" method="post">
		<div class="form-group">
			<label for="inputPw" class="sr-only">비밀번호 </label>
			<input type="password" class="form-control" placeholder="비밀번호" 
			name="pw" required autofocus> <br>
			<button class="btn btn-log btn-success btn-block" type="submit">회원탈퇴</button>
		</div>
		</form>
		
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>
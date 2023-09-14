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

	<%@ include file="menu.jsp"%>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원가입</h1>
		</div>
	</div>


	<form name="login" class="form-signin" action="addMemberProcess.jsp"
		method="post">
	<%
		String error = request.getParameter("error");
	if (error != null) {
		out.print("<div class='alert alert-danger'>");
		out.print("아이디가 중복되었습니다");
		out.print("</div>");
	}
	%>
		<div class="container" align="center">
			<div class="col-md-4 col-md-offset-4">
				<div class="form-group">
					<label for="inputName" class="sr-only">아이디 </label> <input
						type="text" class="form-control" placeholder="아이디" name="id"
						id="inputUserId" required autofocus> <br>
				</div>

				<div class="form-group">
					<label for="inputPw" class="sr-only">비밀번호 </label> <input
						type="password" class="form-control" placeholder="비밀번호" name="pw"
						id="inputPassword" required> <br>
				</div>


				<div class="form-group">
					<label for="inputName" class="sr-only">이름 </label> <input
						type="text" class="form-control" placeholder="이름" name="name"
						id="inputName" required> <br>

				</div>
				<div class="form-group">
					<label for="inputPhone" class="sr-only">연락처 </label> <input
						type="text" class="form-control" placeholder="010-1111-2222"
						name="phone" id="inputPhone" required> <br>
				</div>

				<div class="form-group">
					<label for="inputAddress" class="sr-only">주소 </label> <input
						type="text" class="form-control" placeholder="주소" name="address"
						id="inputAddress" required> <br>
				</div>

				<button class="btn btn btn-lg btn-success btn-block" type="submit">회원가입</button>
			</div>
		</div>
	</form>
	<%@ include file="footer.jsp"%>



</body>
</html>
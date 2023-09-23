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
	
	<%@ include file="menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원정보수정</h1>
		</div>
	</div>
	
	<%
		String id = (String)session.getAttribute("UserId");
	%>
	
	
	<form name="editmember" class="form-signin" action="editProcess.jsp" method="post">
		<div class="container" align="center">
			<div class="col-md-4 col-md-offset-4">
			
				<div class="form-group">
					<input type="text" class="form-control" name="id" placeholder="<%=id %>(아이디)" readonly><br>
				</div>
				<div class="form-group">
					<input type="password" class="form-control" name="pw" placeholder="비밀번호" autofocus required><br>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="phone" placeholder="연락처" required><br>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="address" placeholder="주소" required><br>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">수정</button>
			</div>
		</div>
	</form>
	
	<%@ include file="footer.jsp" %>
</body>
</html>
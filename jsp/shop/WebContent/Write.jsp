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
	<%@ include file="LoginCheck.jsp" %>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">글쓰기</h1>
		</div>
	</div>


	<div class="container" align="center">
		<div class="col-md-6 col-md-offset-6">
		
			<form name="write" class="form-signin" action="WriteProcess.jsp"  method="post">
		

				<div class="form-group">
					<input type="text" class="form-control" placeholder="제목" name="title"
						 required autofocus> 
				</div>

				<div class="form-group">
					<textarea class="form-control" placeholder="내용" name="content"
						 required></textarea>
				</div>

				

				<button class="btn btn btn-lg btn-success btn-block" type="submit">글쓰기</button>
			</form>
		</div>
	</div>

	<%@ include file="footer.jsp"%>



</body>
</html>
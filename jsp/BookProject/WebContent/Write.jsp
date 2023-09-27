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
	
	<%@ include file="top.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 추가</h1>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="col-md-6 col-md-offset-6">
		
			<form name="write" class="form-signin" action="WriteProcess.jsp"  method="post">
		
				<div class="form-group">
					<input type="text" class="form-control" placeholder="도서아이디" name="bookid"
						 required autofocus> 
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="작가" name="author"
						 required> 
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="제목" name="title"
						 required> 
				</div>
				<div class="form-group">
					<textarea class="form-control" placeholder="내용" name="content"
						 required></textarea> 
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="가격" name="price"
						 required> 
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="날짜" name="date"
						 required> 
				</div>
				<button class="btn btn-log btn-success btn-block"
					type="submit">도서 추가</button>
				
			</form>
			
		</div>
	</div>
	
</body>
</html>
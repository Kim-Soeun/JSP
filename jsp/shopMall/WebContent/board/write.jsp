<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<div class="container">
		<form class="form-horizontal" name="newWrite" action="./BoardWriteAction.do" method="post">
		
			<div class="form-group row">
				<label class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" 
					value="${UserId}" readonly>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 control-label">이름</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" 
					value="${UserName}" readonly>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-3">
					<input name="subject" type="text" class="form-control" 
					value="제목" required>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-3">
					<input name="content" type="text" class="form-control" 
					value="내용" required>
				</div>
			</div>

			<div class="form-group row">
			<div class="col-sm-5">
				<button class="btn btn-log btn-success btn-block" type="submit">글쓰기</button>
			</div>
			</div>
		</form>
	</div>
</body>
</html>
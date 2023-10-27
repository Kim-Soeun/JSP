<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품추가</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	
	<jsp:include page="/menu.jsp"/>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 등록</h1>
		</div>
	</div>
	
	<div class="container">
		<form name="newProduct" action="ClothAddAction.do" method="post"
		enctype="multipart/form-data">
		
		
			<div class="form-group row">
				<label class="col-sm-2">상품코드</label>
				<div class="col-sm-3">
					<input type="text" name="clothId" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품종류</label>
				<div class="col-sm-3">
					<input type="text" name="clothType" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">사이즈</label>
				<div class="col-sm-3">
					<input type="text" name="clothSize" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" name="clothPrice" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제품사진</label>
				<div class="col-sm-3">
					<input type="file" name="clothImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
			</div>
		
		</form> 
	</div>
	
	
	
</body>
</html>
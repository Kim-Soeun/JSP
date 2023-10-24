<%@page import="mvc.model.BoardDTO"%>
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
			<h1 class="display-3">게시판 상세보기</h1>
		</div>
	</div>

	<div class="container">
		<form class="form-horizontal"  
		action="BoardUpdateAction.do?num=${num}&pageNum=${page}" method="post">
		
			<div class="form-group row">
				<label class="col-sm-2 control-label">성명</label>
				<div class="col-sm-3">
					<input name="name" class="form-control" 
					value="${board.name}" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-3">
					<input name="subject" type="text" class="form-control" 
					value="${board.subject}" required>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-3">
					<textarea name="content" class="form-control" 
					 required>${board.content}</textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">작성일자</label>
				<div class="col-sm-3">
					<input name="registDate" type="text" class="form-control" 
					value="${board.regist_day}" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" 
					value="${board.name}" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">조회수</label>
				<div class="col-sm-3">
					<input name="hit" type="text" class="form-control" 
					value="${board.hit}" readonly>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">주소</label>
				<div class="col-sm-3">
					<input name="ip" type="text" class="form-control" 
					value="${board.ip}" readonly>
				</div>
			</div>
			
			
			
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<c:set var="userId" value="${board.id}"/>
					<c:if test="${UserId==userId}">
					
						<a href="./BoardDeleteAction.do?num=${num}&pageNum=${page}" class="btn btn-danger">삭제</a>
						<input type="submit" class="btn btn-success" value="수정">
					
					</c:if>
					
					<a href="./BoardListAction.do?pageNum=${page}" class="btn btn-primary">목록</a>
				</div>
			</div>
			
		</form>
	</div>


</body>
</html>
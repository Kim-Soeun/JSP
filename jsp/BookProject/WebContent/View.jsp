<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
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
	
	<%
		String bookid = request.getParameter("bookid");
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.selectBook(bookid);
	
	%>
	
	<%@ include file="top.jsp" %>
	<%@ include file="LoginCheck.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서목록 상세보기</h1>
		</div>
	</div>
	
	
	<div class="container" align="center">
		<form action="Edit.jsp" method="post">
			<div class="row g-2 align-items-center">
				<div class="col-auto">
					<label for="bookid" class="col-form-label">도서 아이디</label>
				</div>
				<div class="cool-auto">
					<input type="text" name="bookid" class="form-control"
						value="<%=dto.getBookid()%>" readonly>
				</div>
			</div>
			<div class="row g-2 align-items-center">
				<div class="col-auto">
					<label for="author" class="col-form-label">작가</label>
				</div>
				<div class="cool-auto">
					<input type="text" name="author" class="form-control"
						value="<%=dto.getAuthor()%>" autofocus>
				</div>
			</div>
			<div class="row g-2 align-items-center">
				<div class="col-auto">
					<label for="title" class="col-form-label">제목</label>
				</div>
				<div class="cool-auto">
					<input type="text" name="title" class="form-control"
						value="<%=dto.getBooktitle()%>">
				</div>
			</div>
			<div class="row g-2 align-items-center">
				<div class="col-auto">
					<label for="content" class="col-form-label">내용</label>
				</div>
				<div class="cool-auto">
					<input type="text" name="content" class="form-control"
						value="<%=dto.getBookcontent()%>">
				</div>
			</div>
			<button type="submit">수정</button>
			<button type="button" onclick="location.href='Delete.jsp?bookId=<%=dto.getBookid()%>';">삭제</button>
		</form>
	</div>
	
</body>
</html>
<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String num = request.getParameter("num"); // boardmain.jsp에서 넘어온 num
	BoardDAO dao = new BoardDAO(); // 파라미터값으로 name,content를 사용할 수 없는 이유는
	BoardDTO dto = new BoardDTO(); // boardmain.jsp에서 가져올 파라미터값이 존재하지 않기 때문

	dao.updateVisitCount(num); 
	dto = dao.selectView(num); 
	dao.close();

// 게시물 조회수 증가 
// 세부 내용 가져오기
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<%@include file="LoginCheck.jsp"%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상세 게시물 보기</h1>
		</div>
	</div>

	<div class="container" align="center">
		<form action="Edit.jsp" method="post">
			<input type="hidden" name="id" value="<%=dto.getId()%>">
			<div class="row g-2 align-items-center">
				<div class="col-auto">
					<label for="num" class="col-form-label">게시물 번호</label>
				</div>
				<div class="cool-auto">
					<input type="text" name="num" class="form-control"
						value="<%=dto.getNum()%>" readonly>
				</div>
			</div>
			<div class="row g-2 align-items-center">
				<div class="col-auto">
					<label for="num" class="col-form-label">작성자 이름</label>
				</div>
				<div class="cool-auto">
					<input type="text" name="name" class="form-control"
						value="<%=dto.getName()%>" readonly>
				</div>
			</div>

			<div class="row g-2 align-items-center">
				<div class="col-auto">
					<label for="name" class="col-form-label">게시물 제목</label>
				</div>
				<div class="cool-auto">
					<input type="text" name="title" class="form-control"
						value="<%=dto.getTitle()%>">
				</div>
			</div>
			<div class="row g-2 align-items-center">
				<div class="col-auto">
					<label for="content" class="col-form-label"> 내용 </label>
				</div>
				<div class="cool-auto">
					<input type="text" name="content" class="form-control"
						value="<%=dto.getContent()%>">
				</div>
				<button type="submit">수정하기</button>
				<button type="button" onclick="location.href='Delete.jsp?num=<%=dto.getNum()%>';">삭제하기</button>
			</div>
		</form>
	</div>
</body>
</html>
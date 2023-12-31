<%@page import="model.BoardDAO"%>
<%@page import="model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDTO board = new BoardDAO().selectBoard(no);
	session.setAttribute("boardDTO", board);
	String content = board.getContent();
	String title = board.getTitle();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
</head>
<body>
	<form action="EditBoardServlet" name="frm" method="post" onsubmit="return categoryCheck()" enctype="multipart/form-data">
		
		<label>카테고리</label>
		<select name="category">
			<option id="choice">카테고리를 선택해주세요</option>
			<option value="notice">공지사항</option>
			<option value="board">자유게시판</option>
			<option value="greeting">가입인사</option>
		</select><br>
	
		<label>제목</label>
		<input type="text" name="title" value="<%=title%>"><br>
		
	
		<label>내용</label>
		<textarea name="content" rows="8" cols="50" required><%=content%></textarea><br>
		
		<label>파일첨부</label>
		<input type="file" name="fileImg" ><br>
		
		<button type="submit">수정</button>
	</form>
	
<script type="text/javascript" src="./resources/js/board.js"></script>

</body>
</html>
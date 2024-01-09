<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%
	String crewName = request.getParameter("crewName");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 업로드</title>
</head>
<body>

	<form action="./longCrewBoard.board" name="frm" method="post" onsubmit="return categoryCheck()" enctype="multipart/form-data">
		<input type="hidden" name="crewName" value="<%=crewName%>"/>
		
		<label>카테고리</label>
		<select name="category">
			<option id="choice">게시판을 선택해주세요</option>
			<option value="notice">공지사항</option>
			<option value="board">자유게시판</option>
			<option value="greeting">가입인사</option>
		</select><br>
	
		<label>제목</label>
		<input type="text" name="title" required><br>
	
		<label>내용</label>
		<textarea name="content" rows="8" cols="50"  placeholder="내용을 입력하세요" required></textarea><br>
		
	
		<label>파일첨부</label>
		<input type="file" name="fileImg" ><br>
	
		<div id="photo-container" style="width:60px; height: 60px;"></div>
		<button type="submit">등록</button>
		
	</form>
	
<script type="text/javascript" src="./resources/js/board.js"></script>
</body>
</html>
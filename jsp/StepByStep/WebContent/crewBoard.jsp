<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="CrewBoardServlet" name="frm" method="post" onsubmit="categoryCheck()" enctype="multipart/form-data">
		<label>카테고리</label>
		<select name="category">
			<option id="choice">게시판을 선택해주세요</option>
			<option value="notice">공지사항</option>
			<option value="board">자유게시판</option>
			<option value="greeting">가입인사</option>
		</select><br>
	
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
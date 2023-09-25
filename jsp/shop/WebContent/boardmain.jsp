<%@page import="dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> boardLists = dao.selectList();
		dao.close();
%>
		
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>

	<%@ include file="menu.jsp" %>
	<%@ include file="LoginCheck.jsp" %>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">게시판</h1>
			</div>
		</div>
		
		

		<div class="container">
			<div class="text-center">
			<table border="1" width="100%">
				<tr>
					<th width="10%">번호</th>
					<th width="50%">제목</th>
					<th width="15%">아이디</th>
					<th width="10%">조회수</th>
					<th width="15%">작성일</th>
				</tr>
				<%
					for(BoardDTO dto : boardLists) {
						
					
				%>
				<tr align="center">
					<td><%=dto.getNum() %>				
					<td><%=dto.getTitle() %>				
					<td><%=dto.getId() %>				
					<td><%=dto.getVisitcount() %>				
					<td><%=dto.getPostdate() %>				
				</tr>
				
				<% } %>
			</table>
			<br>
			<button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
			</div>
		</div>

	<%@ include file="footer.jsp" %>
	

</body>
</html>
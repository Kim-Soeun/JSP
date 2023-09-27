<%@page import="dto.BoardDTO"%>
<%@page import="java.util.List"%>
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
		BoardDAO dao = new BoardDAO();
		List<BoardDTO> booklists = dao.selectList();
		dao.close();
		
	%>

	<%@ include file="top.jsp" %>
	<%@ include file="LoginCheck.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서목록</h1>
		</div>
	</div>
	
	
	
	<div class="container">
		<div class="text-center">
		<h2> 도서 목록 보기 </h2>
		<table border="2" width="100%">
			<tr align="center">
				<th width="15%">도서아이디</th>
				<th width="15%">작가</th>
				<th width="30%">도서제목</th>
				<th width="40%">도서내용</th>
			</tr>
			<%
			for(BoardDTO dto : booklists) {
				%>
			
			<tr align="center">
				<td><%=dto.getBookid() %></td>
				<td><%=dto.getAuthor() %></td>
				<td><a href="View.jsp?bookid=<%=dto.getBookid()%>"><%=dto.getBooktitle() %></a></td>
				<td><%=dto.getBookcontent() %></td>
			</tr>
			<% } %>
		</table>
			<button type="button" onclick="location.href='Write.jsp';">도서추가</button>
		</div>
	</div>


</body>
</html>
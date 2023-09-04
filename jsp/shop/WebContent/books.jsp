<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="dto.Book" %>
<%@ page import ="dto.BookRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		BookRepository bp = new BookRepository();
		ArrayList<Book> listOfBooks = bp.getAllBooks();
		for(int i=0; i<listOfBooks.size(); i++) {
			Book book = listOfBooks.get(i);
	%>		
	
	<div class="col-md-4">
	<h2><%=book.getBookId() %></h2>
	<h2><%=book.getAuthor() %></h2>
	<h2><%=book.getBookName() %></h2>
	</div>
	
	<% 
		} 
	%>	
	
	

</body>
</html>
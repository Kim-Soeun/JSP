<%@page import="common.JSFunction"%>
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
		request.setCharacterEncoding("utf-8");
		String bookid = request.getParameter("bookid");
		String author = request.getParameter("author");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int price = Integer.parseInt(request.getParameter("price"));
		String date = request.getParameter("date");
		String memberid = (String)session.getAttribute("UserId");
		
		BoardDAO dao = new BoardDAO();
		int result = dao.insertBook(bookid, author, title, content, price, date, memberid);
		
		if(result == 1) {
			JSFunction.alertLocation("도서가 추가되었습니다", "bookmain.jsp", out);
		} else {
			JSFunction.alertBack("도서 추가를 다시 시도해주세요", out);
		}
	
	%>


</body>
</html>
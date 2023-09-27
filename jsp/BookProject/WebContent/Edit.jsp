<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		request.setCharacterEncoding("utf-8");
		String bookid = request.getParameter("bookid");
		String author = request.getParameter("author");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		 BoardDAO dao = new BoardDAO();
		int result = dao.updateBook(author, title, content, bookid);
		 
		if(result == 1) {
			JSFunction.alertLocation("도서 정보가 수정되었습니다", "bookmain.jsp", out);
		} else {
			JSFunction.alertBack("도서 정보 수정에 실패했습니다", out);
		} 
	
	%>


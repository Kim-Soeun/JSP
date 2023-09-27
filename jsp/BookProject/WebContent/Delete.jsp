<%@page import="dto.BoardDTO"%>
<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	request.setCharacterEncoding("utf-8");
	String bookid = request.getParameter("bookId");
	BoardDAO dao = new BoardDAO();
	int result = dao.deleteBook(bookid);
	
	
	
	if(result == 1) {
		JSFunction.alertLocation("도서가 삭제되었습니다", "bookmain.jsp", out);
	} else {
		JSFunction.alertBack("도서 삭제를 실패했습니다", out);
	}

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	
	
</body>
</html>
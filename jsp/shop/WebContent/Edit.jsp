<%@page import="dto.BoardDTO"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="LoginCheck.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String id2 = (String) session.getAttribute("user_id");
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	if (id.equals(id2)) {
		BoardDTO dto = new BoardDTO();
		dto.setNum(num);
		dto.setTitle(title);
		dto.setContent(content);
	
		BoardDAO dao = new BoardDAO();
		int result = dao.updateEdit(dto);
		dao.close();
	
		if (result == 1) {
			JSFunction.alertLocation("게시글이 수정되었습니다.", "View.jsp?num=" + dto.getNum(), out);
		}  else {
		JSFunction.alertBack("작성자만 편집 가능합니다.", out);
	}
	}
%>
<%@ include file="menu.jsp"%>
<%@ include file="LoginCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
</body>
</html>
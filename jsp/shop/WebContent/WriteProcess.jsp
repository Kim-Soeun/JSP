<%@page import="common.JSFunction"%>
<%@page import="java.util.Date"%>
<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<%
		
		request.setCharacterEncoding("utf-8");

			
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = (String)session.getAttribute("UserId");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String postdate = dateFormat.format(new Date());
	
		BoardDTO dto = new BoardDTO();
		// dto.setTitle(title);
		dto.setContent(content);
		dto.setId(id);
		dto.setPostdate(postdate);
		
		BoardDAO dao = new BoardDAO();
		
		// int result = dao.insertWrite(dto);
		
		int result = dao.insertWrite(dto);
		dao.close();
		
		if(result == 1) {
			response.sendRedirect("boardmain.jsp");
		} else {
			JSFunction.alertBack("게시판 글쓰기에 실패했습니다",  out);
		}
		
	%>
	
	
	
</body>
</html>
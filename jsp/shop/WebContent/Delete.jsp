<%@page import="dto.BoardDTO"%>
<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDAO"%>
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
	String num = request.getParameter("num");			// 삭제할 게시물 번호
	String id = (String)session.getAttribute("UserId"); // 현재 로그인한 아이디
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.selectView(num);
	String id2 = dto.getId();		// 글 작성한 아이디
	
	if(id.equals(id2)) {			// 로그인 아이디와 글작성 아이디가 일치하면 삭제
		int result = dao.updateDelete(num);
		if(result == 1) {
			JSFunction.alertLocation("게시물을 삭제했습니다", "boardmain.jsp", out);
		} else {
			JSFunction.alertBack("게시물 삭제에 실패했습니다", out);
		}
	} else {
		JSFunction.alertBack("작성자만 삭제 가능합니다", out);
		
	}


%>	

</body>
</html>
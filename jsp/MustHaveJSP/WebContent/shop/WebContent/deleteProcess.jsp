<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.MemberDAO"%>
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
		String id = (String)(session.getAttribute("UserId"));
		String pw = request.getParameter("pw");	
		
		MemberDAO dao = new MemberDAO();
		String result = dao.deleteMember(id, pw);
		
		if(result.equals("")) {
			request.getRequestDispatcher("deletemember.jsp?error=1").forward(request, response);
		} else {
			dao.close();
			response.sendRedirect("logout.jsp");
		}
		
	
		
		
	%>
</body>
</html>
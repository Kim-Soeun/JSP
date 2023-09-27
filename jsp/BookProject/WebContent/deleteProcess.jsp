<%@page import="common.JSFunction"%>
<%@page import="dao.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String)session.getAttribute("UserId");
		String pw = request.getParameter("pw");
		String pw2 = (String)session.getAttribute("UserPw");
		
		MembershipDAO dao = new MembershipDAO();
		String str = "";
		
		if(pw.equals(pw2)) {
			int result = dao.deleteMember(id, pw);
			
			if(result == 1) {
				JSFunction.alertLocation("회원탈퇴가 정상적으로 처리되었습니다", "login.jsp", out);
			} else {
				JSFunction.alertBack("회원탈퇴를 다시 시도해주세요", out);
			}
			
		} else {
			request.getRequestDispatcher("deletemember.jsp?error=1").forward(request, response);
		}
		
	%>
	
	
</body>
</html>
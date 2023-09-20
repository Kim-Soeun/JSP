<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="top.jsp"/>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String mail = request.getParameter("mail");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String registday = request.getParameter("registday");
		
		MemberDAO dao = new MemberDAO();
		String result = dao.checkMember(id);
		if(result.equals("기존회원")) {
			request.getRequestDispatcher("addMember.jsp?error=1").forward(request, response);
		} else {
			dao.insertMember(id, pw, name, gender, birth, mail, phone, address, registday);
			dao.close();
		}
		
	
	%>
	
	
	
	<h1><%=name %>님 회원가입을 환영합니다 </h1>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.removeAttribute("UserId");
	session.removeAttribute("UserName");
	// 특정 세션의 데이터만 삭제
	
	session.invalidate();
	// 세션 포함하여 모든 속성을 삭제
	
	response.sendRedirect("LoginForm.jsp");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();   // 모든 세션과 모든 데이터 삭제, 로그아웃 됨
	response.sendRedirect("welcome.jsp");
	
%>

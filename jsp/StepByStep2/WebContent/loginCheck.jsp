<%@page import="common.JSFunction"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO member = (MemberDTO)session.getAttribute("memberDTO");
	
	if(member == null) {
		JSFunction.alertLocation("로그인이 필요합니다", "login3.jsp", out);
		return;
	}
%>
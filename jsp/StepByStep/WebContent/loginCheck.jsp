<%@page import="common.JSFunction"%>
<%@page import="model.memberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	memberDTO member = (memberDTO)session.getAttribute("memberDTO");
	
	if(member == null) {
		JSFunction.alertLocation("로그인이 필요합니다", "login.jsp", out);
		return;
	}
%>
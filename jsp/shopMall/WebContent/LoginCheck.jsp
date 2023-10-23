<%@page import="common.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
 <%
 
 	if(session.getAttribute("UserId") == null) {
 		JSFunction.alertLocation("로그인 후 이용하세요", "login.jsp", out);
 		return;
 		// 메소드 종료 위해서 return 사용
 	}
 
 
 %>
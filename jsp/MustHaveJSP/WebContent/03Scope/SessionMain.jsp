<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<String> lists = new ArrayList<String>();
	lists.add("리스트");
	lists.add("컬렉션");
	session.setAttribute("lists", lists);
%>

<!-- 클라이언트가 웹 브라우저를 최초로 열고난 후 닫을 때딱지 요청되는 모든 페이지는 session 객체 공유 가능 -->
<!-- 세션이란 클라이언트가 서버에 접속해 있는 상태 혹은 단위 -->
<!-- 주로 회원인증 후 로그인 상태 유지 처리에 사용됨 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session 영역</title>
</head>
<body>
	<h2>페이지 이동 후 세션 영역의 속성 읽기</h2>
	<a href="SessionLocation.jsp">세션 이동하기</a>
</body>
</html>
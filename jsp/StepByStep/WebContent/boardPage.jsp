<%@page import="model.memberDTO"%>
<%@page import="model.boardDAO"%>
<%@page import="model.boardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>

<%
	memberDTO dto = (memberDTO)session.getAttribute("memberDTO");
	String userId = dto.getId();								// 로그인 유저
	int no = Integer.parseInt(request.getParameter("no"));		// 게시글 넘버
	boardDTO board = new boardDAO().selectBoard(no);
	pageContext.setAttribute("board", board);
	String writerId = board.getId();							// 게시물 작성자
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
</head>
<body>
	
	<!-- 작성자에게만 삭제 수정 버튼이 보이게 하기 -->
	
	<div>
		<div>작성자 아이디 : ${board.id}</div>
		<div>작성자 닉네임 : ${board.nickname }</div>
		<div>작성일 : ${board.created}</div>
		<div>내용 : ${board.content}</div>
		<div>카테고리 : ${board.category}</div>
		<div>추천수 : ${board.count}</div>
		<a href="DeleteBoardServlet?no=${board.no}&writerId=${board.id}&userId=<%=userId%>">삭제</a>
		<a href="editBoard.jsp?no=${board.no}">수정</a>
	</div>
	
</body>
</html>
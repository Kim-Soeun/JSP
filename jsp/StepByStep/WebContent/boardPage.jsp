<%@page import="model.ReplyDAO"%>
<%@page import="model.ReplyDTO"%>
<%@page import="model.MemberDTO"%>
<%@page import="model.BoardDAO"%>
<%@page import="model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>

<%
	int no = Integer.parseInt(request.getParameter("no"));		// 게시글 넘버
	BoardDTO board = new BoardDAO().selectBoard(no);			// 특정 게시물 불러오기
	pageContext.setAttribute("board", board);
	String writerId = board.getId();							// 게시물 작성자
	pageContext.setAttribute("writerId", writerId);
	List<ReplyDTO> replyList = new ReplyDAO().selectReplyByNo(no);
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
		<a href="DeleteBoardServlet?no=${board.no}&writerId=${board.id}&userId=${userId}">삭제</a>
		<a href="editBoard.jsp?no=${board.no}">수정</a>
		
		<!-- 댓글 출력 -->
		<c:forEach items="<%=replyList%>" var="reply">
			<div>
				<p>게시판 번호 : ${reply.b_no}</p>
				<p>댓글 번호 : ${reply.r_no}</p>
				<p>작성자 : ${reply.id}</p>
				<p>작성일자 : ${reply.created}</p>
				<p>댓글내용 : ${reply.content}</p>
			</div>
		</c:forEach>
	</div> 
	
	<!-- 게시물 작성자와 댓글 작성자가 다르면 댓글쓰기창 보이게 설정 -->
	<c:if test="${userId ne writerId}">
		<div>
			<form action="./registerReply.reply" method="post">
				<input type="hidden" name="id" value="${userId}"/>
				<input type="hidden" name="b_no" value="<%=no%>"/>
				<textarea name="content" rows="8" cols="50" placeholder="댓글" required></textarea>
				<button type="submit">등록</button>
			</form>
		</div>
	</c:if>
	
	
</body>
</html>
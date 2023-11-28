<%@page import="model.MemberDTO"%>
<%@page import="model.BoardDAO"%>
<%@page import="model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>

<%
	MemberDTO dto = (MemberDTO)session.getAttribute("memberDTO");
	String userId = dto.getId();								// 로그인 유저
	int no = Integer.parseInt(request.getParameter("no"));		// 게시글 넘버
	BoardDTO board = new BoardDAO().selectBoard(no);
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
		
		<c:forEach items="" var="">
			<div>
				<p>게시판 번호 : </p>
				<p>댓글 번호 : </p>
				<p>작성자 : </p>
				<p>작성일자 : </p>
				<p>댓글내용 : </p>
			</div>
		</c:forEach>
	</div>
	
	<!-- 홈피 주인과 접속자가 다를 때만 방명록 작성 가능하게 설정 -->
	<c:if test="${user_id ne param.id}">
		<div class="center-layout-column box">
			<form action="GuestbookServlet" method="post">
				<div class="center-layout left bar" style="width: inherit;">
						<input type="hidden" name="ownerId" value="<%=ownerId%>"/>
						<span class="left" style="width: inherit;">${dto.getId()}의 방명록</span>
				</div>
				<div style="width: inherit; display: flex;">
					<div class="write-div" style="width: 30%;">
						<img class="userProfile img" alt="userProfile" src="./resources/img/${dto.getImgName()}">
					</div>
					<div class="write-div" style="width: 70%;">
							<textarea name="content" rows="8" cols="50"  placeholder="방명록 글작성중" required></textarea>
							<div class="right">
								<button type="submit">등록</button>
							</div>
					</div>
				</div>
			</form>
		</div>
	</c:if>
	
	
</body>
</html>
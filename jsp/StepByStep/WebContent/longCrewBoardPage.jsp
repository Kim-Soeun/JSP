<%@page import="model.LongCrewMemberDTO"%>
<%@page import="model.LongCrewDAO"%>
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
	String userId = (String)session.getAttribute("userId");
	int no = Integer.parseInt(request.getParameter("no"));		// 게시글 넘버
	BoardDTO board = new BoardDAO().selectBoard(no);			// 특정 게시물 불러오기
	pageContext.setAttribute("board", board);
	String writerId = board.getId();							// 게시물 작성자
	pageContext.setAttribute("writerId", writerId);
	List<ReplyDTO> replyList = new ReplyDAO().selectReplyByNo(no);
	String crewName = board.getCrewName();						
	LongCrewDAO dao = new LongCrewDAO();
	String adminId = dao.selectAdminId(crewName);				// 크루 방장 id
	pageContext.setAttribute("adminId", adminId);
	List<LongCrewMemberDTO> memberList = dao.selectMemid(crewName);	// 특정 장기크루의 모든 memId + adminId 가져오기
	
	
	boolean boo = false;
	for(LongCrewMemberDTO mem : memberList) {
		if(mem.getMemId().equals(userId)) {
			boo = true;
		}
	}

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장기 크루 게시판 상세보기</title>
</head>
<body>
	
	<!-- 작성자&방장에게만 삭제 수정 버튼이 보이게 하기 -->
	
	<div>
		<div>크루명 : ${board.crewName}</div>
		<div>작성자 아이디 : ${board.id}</div>
		<div>작성자 닉네임 : ${board.nickname }</div>
		<div>작성일 : ${board.created}</div>
		<div>내용 : ${board.content}</div>
		<div>카테고리 : ${board.category}</div>
		<div>추천수 : ${board.count}</div>
		
		<!-- 이미지는 있으면 화면에 출력, 없으면 출력 x -->
		<c:if test="${not empty board.imgName}">
			<div><img style="width: 60px; height: 60px;" src="./resources/img/${board.imgName}" alt="${board.imgName}"></div>
		</c:if>
	
	
		<!-- 사용자가 작성자와 같거나 방장이면 수정, 삭제 버튼 보이게 설정하기 -->
		<c:if test="${board.id eq userId || userId eq adminId}">
			<a href="DeleteBoardServlet?no=${board.no}&writerId=${board.id}&userId=${userId}&crewName=${board.crewName}">삭제</a>
			<a href="editBoard.jsp?no=${board.no}">수정</a>
		</c:if>
		<!-- 댓글 출력 -->
		<c:forEach items="<%=replyList%>" var="reply">
			<div>
				<h3>댓글</h3>
				<p>게시판 번호 : ${reply.b_no}</p>
				<p>댓글 번호 : ${reply.r_no}</p>
				<p>작성자 : ${reply.id}</p>
				<p>작성일자 : ${reply.created}</p>
				<p>댓글내용 : ${reply.content}</p>
			</div>
		</c:forEach>
	</div> 
	
		<!-- 댓글쓰기창 -->
		<!-- 크루의 멤버가 맞으면 댓글쓰기창 보임 -->
		<c:if test="<%=boo%>">
			<form action="./registerReplyLong.reply" method="post">
				<input type="hidden" name="id" value="${userId}"/>
				<input type="hidden" name="b_no" value="<%=no%>"/>
				<textarea name="content" rows="8" cols="50" placeholder="댓글" required></textarea>
				<button type="submit">등록</button>
			</form>
		</c:if>
	

</body>
</html>
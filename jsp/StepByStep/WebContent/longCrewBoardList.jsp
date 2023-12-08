<%@page import="model.LongCrewMemberDTO"%>
<%@page import="model.LongCrewDAO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.BoardDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	String crewName = request.getParameter("crewName");
	pageContext.setAttribute("crewName", crewName);
	crewName = URLDecoder.decode(crewName, "UTF-8");
	BoardDAO dao = new BoardDAO();
	LongCrewDAO dao2 = new LongCrewDAO();			
	List<LongCrewMemberDTO> memberList = dao2.selectMemid(crewName);  // 특정 장기크루의 모든 memId + adminId 가져오기
	
	int pageSize = Integer.parseInt(application.getInitParameter("POST_PAGE"));		// 한 페이지 게시물 개수(8개)
	int blockSize = Integer.parseInt(application.getInitParameter("BLOCK_COUNT"));	// 하단표시 한 블록 개수(5개)
	int totalCount = dao.selectCount(crewName);										// 게시물 전체 개수
	int totalPage = (int) Math.ceil((double)(totalCount / pageSize));				// 게시물 페이지 전체 개수
	
	int pageNum = 1;
	String pn = request.getParameter("pageNum");
	if(pn != null) {
		pageNum = Integer.parseInt(pn);
	}

	int start = (pageNum - 1) * pageSize + 1;
	List<BoardDTO> boardList = dao.selectCrewBoardList(crewName, start);
	dao.close();
%> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특정 장기크루 게시판</title>
</head>
<body>
	
	<c:forEach items="<%=boardList%>" var="board">
		<form action="RecommendServlet" name="frm">
			<div style="display: flex; flex-direction: column; justify-content: center; align-content: center;">
				<div><a href="longCrewBoardPage.jsp?no=${board.no}">게시판넘버 : ${board.no}</a></div>
				<div>작성자 아이디 : ${board.id}</div>
				<div>작성자 닉네임 : ${board.nickname }</div>
				<div>작성일 : ${board.created}</div>
				<div>내용 : ${board.content}</div>
				<div>카테고리 : ${board.category}</div>
				<div id="count" class="count">${board.count}</div>
				<!-- 이미지는 있으면 화면에 출력, 없으면 출력 x -->
				<c:if test="${not empty board.imgName}">
					<div><img style="width: 60px; height: 60px;" src="./resources/img/${board.imgName}" alt="${board.imgName}"></div>
				</c:if>
				
				<input type="hidden" name="crewName" value="<%=crewName%>">
				<input type="hidden" value="${board.no}" name="no">
				<button type="button" onclick="updateCount(this)"><img alt="하트" src="./resources/img/하트.jpg"></button>
			</div>
		</form>
	</c:forEach>
	
	<c:set var="pageNum" value="<%=pageNum%>"/>
	<div>
		<c:forEach var="i" begin="1" end="<%=blockSize%>">
			<c:url value="/longCrewBoardList.jsp" var="url"/>
			
			<c:choose>
				<c:when test="${pageNum==i}">
					<a style="text-decoration: none;" href="${url}?pageNum=${i}&crewName=${crewName}"><font color='black'>${i}</font></a>
				</c:when>
				<c:otherwise>
					<a style="text-decoration: none;" href="${url}?pageNum=${i}&crewName=${crewName}"><font color='gray'>${i}</font></a>
				</c:otherwise>
			</c:choose>	
		</c:forEach>
	
	</div>
	
	<!-- 크루의 방장과 크루원만 게시판 등록 할 수 있게 설정 -->
	
	<c:forEach items="<%=memberList%>" var="member">
		<c:if test="${userId eq member.memId}">
			<h3><a href="longCrewBoard.jsp?crewName=<%=crewName%>">게시판 등록</a></h3>
		</c:if>
	</c:forEach>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript" src="./resources/js/recommend.js"></script>
</body>
</html>
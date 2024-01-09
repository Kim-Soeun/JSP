<%@page import="model.LongCrewMemberDTO"%>
<%@page import="model.LongCrewDAO"%>
<%@page import="model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="./resources/css/table.css" rel="stylesheet" type="text/css">
<script src="./resources/js/crewactivity.js"></script>
<meta charset="UTF-8">
<title>장기크루 게시판 페이지</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<%@include file="background.jsp"%>

	<div class="crew-table">
		<div class="table-header">
			<div class="crew-sort">
				<input type="button" class="sort" id="home" value="홈"> 
				<input type="button" class="sort" id="board" value="게시판">
				<input type="button" class="sort" id="date" value="일정"> 
				<input type="button" class="sort" id="photobook" value="앨범">
			</div>
		</div>
		<div class="table-container">
		<table class="table-board">
			<thead>
				<tr>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
					<th>작성일</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="<%=boardList%>" var="board">
				<tr>
				<form action="RecommendServlet" name="frm">
	               <td><a href="CrewBoardPage.jsp?no=${board.no}">${board.title}</a></td>  
	                <td>${board.content}
	                	<input type="hidden" name="crewName" value="<%=crewName%>">
	                	<button type="button" onclick="updateCount(this, ${board.no})"><img alt="하트" src="./resources/images/하트.jpg"></button>
	                </td>
	                <td>${board.id}</td>
	                <td>${board.created}</td>
          		</form>
	            </tr>
			</c:forEach>
			 
			</tbody>
		</table>
	</div>	
		<!-- 게시글 보여지는 곳 --> 
		<div class="search_bar">
	<form class="search-form" action="search.jsp" method="get" >
		<input type="text" name="query" placeholder="게시글 검색"> 
		<input type="submit" value="검색">
	</form>
	<div id="pagination">
		<c:set var="pageNum" value="<%=pageNum%>"/>
		<c:forEach var="i" begin="1" end="<%=blockSize%>">
			<c:url value="/table.jsp" var="url"/>
			
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
			<a href="tablewrite.jsp?crewName=<%=crewName%>" class="write-post-button">글쓰기</a>
		</div>
	</div>
	<%@include file="footer.jsp"%>
	
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="./resources/js/recommend.js"></script>
</body>
</html>
<%@page import="common.BoardPage"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
		request.setCharacterEncoding("utf-8");
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");


		BoardDAO dao = new BoardDAO();

		// 한 페이지 게시물 개수(20개)
		int pageSize = Integer.parseInt(application.getInitParameter("POST_PAGE"));
		// 하단 표시 페이지 개수(10개)
		int blockSize = Integer.parseInt(application.getInitParameter("BLOCK_COUNT"));
		// 게시물 전체 개수
		int totalCount = dao.selectCount(searchField, searchWord);
		// 게시물 페이지 전체 개수
		int totalPage = (int)Math.ceil((double)(totalCount/pageSize));
		
		// 기본 페이지 번호는 1로 세팅
		int pageNum = 1;
		String pn = request.getParameter("pageNum");
		if(pn != null) {
			pageNum = Integer.parseInt(pn);
		}
		int start = (pageNum - 1) * pageSize + 1;
		
		

		List<BoardDTO> boardLists = dao.selectList(start, searchField, searchWord);
		dao.close();
%>
		
		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>

	<%@ include file="menu.jsp" %>
	<%@ include file="LoginCheck.jsp" %>
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">게시판</h1>
			</div>
		</div>
		
		

		<div class="container">
			<div class="text-center">
			<table border="1" width="100%">
				<tr>
					<th width="10%">번호</th>
					<th width="50%">제목</th>
					<th width="15%">아이디</th>
					<th width="10%">조회수</th>
					<th width="15%">작성일</th>
				</tr>
				
				<c:forEach var="boardli" items="<%=boardLists%>">
				<tr align="center">
					<td>${boardli.num}</td>
					<td><a href="View.jsp?num=${boardli.num}">${boardli.title}</a></td>
					<td>${boardli.id}</td>
					<td>${boardli.visitcount}</td>
					<td>${boardli.postdate}</td>
				</tr>
				</c:forEach>
								
				<%-- <%
					for(BoardDTO dto : boardLists) {
					
				%>
				<tr align="center">
					<td><%=dto.getNum() %></td>
					<td><a href="View.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a></td>				
					<td><%=dto.getId() %></td>
					<td><%=dto.getVisitcount() %></td>				
					<td><%=dto.getPostdate() %></td>				
				</tr> 
				
				<% } %> --%>
				<tr align="center">
					<%-- <td colspan="5">
						<%=BoardPage.pagingStr(totalCount, pageSize, blockSize, pageNum, totalPage) %>
					</td> --%>
				
				
				<td colspan="5">
					<c:set var="pageNum" value="<%=pageNum%>"/>
					<c:forEach begin="1" end="<%=blockSize%>" var="i">
					
						<c:choose>
							<c:when test="${pageNum==i}">
								<a href="boardmain.jsp?pageNum=${i}"><font color="red">[${i}]</font></a>
							</c:when>
							<c:otherwise>
								<a href="boardmain.jsp?pageNum=${i}"><font color="black">[${i}]</font></a>
							</c:otherwise>
						</c:choose>
						
					</c:forEach>
				</td>
				
				</tr>

				<form action="boardmain.jsp" method="get">
				<tr align="center">
					<td colspan="5">
						<select name="searchField" class="txt">
							<option value="title">제목</option>
							<option value="id">아이디</option>
						</select>
						<input type="text" name="searchWord">
						<input type="submit" class="btn btn-primary" value="검색"> 
					</td>
				</tr>
				</form>
				
				
			</table>
			<br>
			<button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
			</div>
		</div>

	<%@ include file="footer.jsp" %>
	

</body>
</html>
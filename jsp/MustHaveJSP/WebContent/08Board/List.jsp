<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <!-- 게시판 목록을 출력하는 JSP -->
    
<%
	BoardDAO dao = new BoardDAO(application);	// db 연결
	Map<String, Object> param = new HashMap<String, Object>();
	
	// 사용자가 입력한 검색필드와 검색단어를 저장함
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	if(searchWord != null) {
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
		
	}
	
	int totalCount = dao.selectCount(param);			// 전체 게시물 개수 저장
	List<BoardDTO> boardLists = dao.selectList(param);  // 게시물 목록 받아서 저장
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록 보기</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp"/>
	
	<h2> 목록 보기 </h2>
	<form method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center">
					<select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchWord">
					<input type="submit" value="검색하기">
				</td>	
			</tr>
		</table>
	</form>
	
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		
		<%
			if(boardLists.isEmpty()) {
				// 게시물 목록이 비어있을 때 처리 구문
			
		%>
			<tr>
				<td colspan="5" align="center">
				게시물이 없습니다
			</tr>
		<% } else { 
			int virtualNum = 0;		
			// 가상 번호 생성(db에 있는 num x, 화면상에서의 번호)
			for(BoardDTO dto : boardLists) {
				virtualNum = totalCount--;
				
			%>
			<tr align="center">
				<td><%=virtualNum %></td>
				<td align="left">
					<a href="View.jsp?num=<%=dto.getNum()%>"><%=dto.getTitle() %></a>
				</td>	
				<td align="center"><%=dto.getId() %></td>
				<td align="center"><%=dto.getVisitcount() %></td>
				<td align="center"><%=dto.getPostdate() %></td>
			</tr>
			<%
				}
			
		    } %>
	</table>
	
	
	<table border="1" width="90%">
		<tr align="right">
			<td>
				<button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
			</td>
	</table>
</body>
</html>
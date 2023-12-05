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
	crewName = URLDecoder.decode(crewName, "UTF-8");
	BoardDAO dao = new BoardDAO();
	List<BoardDTO> boardList = dao.selectCrewBoardList(crewName);
	LongCrewDAO dao2 = new LongCrewDAO();			// 특정 장기크루의 모든 memId + adminId 가져오기
	List<LongCrewMemberDTO> memberList = dao2.selectMemid(crewName);
%> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특정 장기크루 게시판</title>
</head>
<body>
	
	<c:forEach items="<%=boardList%>" var="board">
		<div style="display: flex; flex-direction: column; justify-content: center; align-content: center;">
			<div><a href="longCrewBoardPage.jsp?no=${board.no}">게시판넘버 : ${board.no}</a></div>
			<div>게시판 넘버 : ${board.no}</div>
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
			
			<form action="RecommendServlet">
				<input type="hidden" value="${board.no}" name="no">
				<input type="hidden" name="crewName" value="<%=crewName%>">
				<button type="submit"> <img alt="하트" src="./resources/img/하트.jpg"> </button>
			</form>
			
		</div>
	</c:forEach>
	
	<!-- 크루의 방장과 크루원만 게시판 등록 할 수 있게 설정 -->
	
	<c:forEach items="<%=memberList%>" var="member">
		<c:if test="${userId eq member.memId}">
			<h3><a href="longCrewBoard.jsp?crewName=<%=crewName%>">게시판 등록</a></h3>
		</c:if>
	</c:forEach>
</body>
</html>
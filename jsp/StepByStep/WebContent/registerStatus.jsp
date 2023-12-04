<%@page import="model.CrewJoinDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.CrewJoinDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="loginCheck.jsp" %>
<%
	String userId = (String)session.getAttribute("userId");
	CrewJoinDAO dao = new CrewJoinDAO();
	List<CrewJoinDTO> joinList = dao.selectCrewJoin(userId);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입신청현황</title>
</head>
<body>

	<!-- 방장일 경우 -->
	<h3>승인대기 리스트</h3>
	
	<!-- 크루신청 대기중일 경우 -->
	<h3>승인현황 리스트</h3>
	
	<c:forEach items="<%=joinList%>" var="join">
			<div style="display: flex; flex-direction: column; justify-content: center; align-content: center;">
				<p><a href="longcrewRecruitDetail.jsp?crewName=${join.crewName}">크루명 : ${join.crewName}</a></p>
				<p>크루명 : ${join.crewName}</p>
				<p>방장ID : ${join.adminId}</p>
				<p>모집인원 : ${join.memberNum}</p>
				<c:if test="${empty join.isCheck}">
					<p>승인상태 : 승인대기중</p>
				</c:if>
				<c:if test="${join.isCheck eq 1}">
					<p>승인상태 : 승인완료</p>
				</c:if>
				<c:if test="${join.isCheck eq 0}">
					<p>승인상태 : 승인거절</p>
				</c:if>
			</div>
	</c:forEach>
	
	
</body>
</html>
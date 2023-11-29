<%@page import="model.CrewRecruitDAO"%>
<%@page import="model.CrewRecruitDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	MemberDTO dto = (MemberDTO)session.getAttribute("memberDTO");
	String userId = dto.getId();
	List<CrewRecruitDTO> mycrewList = new CrewRecruitDAO().selectCrewById(userId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참여중인 크루</title>
</head>
<body>
	
	<h3>참여중인 단기크루 리스트</h3>
	<c:forEach items="<%=mycrewList%>" var="crew">
		<div style="border: 1px solid black; width:300px; display: flex; flex-direction: column; justify-content: center; align-content: center;">
			<div><a href="crewRecruitDetail.jsp?crewName=${crew.crewName}">크루명 : ${crew.crewName}</a></div>
			<div>일정 제목 : ${crew.title}</div>
			<div>모임일자 : ${crew.gatherDate}</div>
			<div>모임장소: ${crew.location}</div>
			<div>모임내용 : ${crew.content}</div>
			<div>현재 참여인원 : ${crew.totalCount}</div>
			<div>전체 크루원 : ${crew.memberNum}</div>
			
		</div>
	</c:forEach>
	
	<h3>참여중인 장기크루 리스트</h3>
	
	
</body>
</html>
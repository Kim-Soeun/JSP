<%@page import="model.MemberDTO"%>
<%@page import="model.CrewRecruitDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.CrewRecruitDAO"%>
<%@ include file="loginCheck.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String userId = (String)session.getAttribute("userId");
	List<CrewRecruitDTO> scheduleList = new CrewRecruitDAO().selectPlannedSchedule(userId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예정된 일정</title>
</head>
<body>
	
	<c:forEach items="<%=scheduleList%>" var="crew">
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
	
	
</body>
</html>
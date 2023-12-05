<%@page import="model.LongCrewRecruitDTO"%>
<%@page import="model.CrewRecruitDAO"%>
<%@page import="model.CrewRecruitDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String userId = (String)session.getAttribute("userId");
	CrewRecruitDAO dao = new CrewRecruitDAO();
	List<CrewRecruitDTO> mycrewList = dao.selectCrewById(userId);
	List<LongCrewRecruitDTO> longCrewList = dao.selectLongCrewById(userId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 참여중인 크루 리스트</title>
</head>
<body>
	
	<h3>참여중인 단기크루 리스트</h3>
	<c:forEach items="<%=mycrewList%>" var="crew">
		<div style="border: 1px solid black; width:300px; display: flex; flex-direction: column; justify-content: center; align-content: center;">
			<div><a href="crewRecruitDetail.jsp?crewName=${crew.crewName}">크루명 : ${crew.crewName}</a></div>
			<div>크루장 : ${crew.adminId}</div>
			<div>현재 참여인원 : ${crew.totalCount}</div>
			<div>전체 크루원 : ${crew.memberNum}</div>
			
		</div>
	</c:forEach>
	
	<h3>참여중인 장기크루 리스트</h3>
	<c:forEach items="<%=longCrewList%>" var="longCrew">
		<div style="border: 1px solid black; width:300px; display: flex; flex-direction: column; justify-content: center; align-content: center;">
			<div><a href="longcrewRecruitDetail.jsp?crewName=${longCrew.crewName}">크루명 : ${longCrew.crewName}</a></div>
			<div>크루장 : ${longCrew.adminId}</div>
			<div>현재 참여인원 : ${longCrew.totalCount}</div>
			<div>전체 크루원 : ${longCrew.memberNum}</div>
			
		</div>
	</c:forEach>
	
	
</body>
</html>
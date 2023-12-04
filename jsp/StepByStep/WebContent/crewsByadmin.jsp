<%@page import="model.LongCrewRecruitDTO"%>
<%@page import="model.CrewRecruitDTO"%>
<%@page import="model.CrewRecruitDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String userId = (String)session.getAttribute("userId");
	CrewRecruitDAO dao = new CrewRecruitDAO();
	List<CrewRecruitDTO> crewList = dao.selectCrewsByAdmin(userId);
	List<LongCrewRecruitDTO> longCrewList = dao.selectLongCrewsByAdmin(userId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 개설한 크루</title>
</head>
<body>

	<h3>개설한 단기크루 리스트</h3>
	<c:forEach items="<%=crewList%>" var="crew">
		<div style="border: 1px solid black; width:300px; display: flex; flex-direction: column; justify-content: center; align-content: center;">
			<div><a href="crewRecruitDetail.jsp?crewName=${crew.crewName}">크루명 : ${crew.crewName}</a></div>
			<div>크루장 : ${crew.adminId}</div>
			<div>현재 참여인원 : ${crew.totalCount}</div>
			<div>전체 크루원 : ${crew.memberNum}</div>
			
		</div>
	</c:forEach>
	
	<h3>개설한 장기크루 리스트</h3>
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
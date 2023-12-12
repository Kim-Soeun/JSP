<%@page import="model.CrewRecruitDAO"%>
<%@page import="model.CrewRecruitDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String crewName = request.getParameter("crewName");
	CrewRecruitDAO dao = new CrewRecruitDAO();
	List<CrewRecruitDTO> scheduleList = dao.selectClosedSchedule2(crewName);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특정 크루의 마감된 일정</title>
</head>
<body>

	<c:forEach items="<%=scheduleList%>" var="schedule">
		<div style="border: 1px solid black; width:300px; display: flex; flex-direction: column; justify-content: center; align-content: center;">
			<div>크루명 : ${schedule.crewName}</div>
			<div>일정 제목 : ${schedule.title}</div>
			<div>모임일자 : ${schedule.gatherDate}</div>
			<div>모임장소: ${schedule.location}</div>
			<div>모임내용 : ${schedule.content}</div>
			<div>크루장 아이디 : ${schedule.adminId}</div>
			<div>현재 참여인원 : ${schedule.totalCount}</div>
			<div>전체 크루원 : ${schedule.memberNum}</div>
		</div>
	</c:forEach>


</body>
</html>
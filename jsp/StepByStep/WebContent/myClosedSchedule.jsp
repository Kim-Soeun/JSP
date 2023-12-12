<%@page import="model.CourseDTO"%>
<%@page import="model.CourseDAO"%>
<%@page import="model.CrewRecruitDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.CrewRecruitDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="loginCheck.jsp"%>
<%
	String userId = (String)session.getAttribute("userId");
	CrewRecruitDAO dao = new CrewRecruitDAO();
	List<CrewRecruitDTO> scheduleList = dao.selectClosedSchedule(userId);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 마감된 일정</title>
</head>
<body>

	<c:forEach items="<%=scheduleList%>" var="schedule">
		<form action="CourseServlet" method="post">
			<div style="border: 1px solid black; width:300px; display: flex; flex-direction: column; justify-content: center; align-content: center;">
				<div><a href="crewRecruitDetail.jsp?crewName=${schedule.crewName}">크루명 : ${schedule.crewName}</a></div>
				<div>크루명 : ${schedule.crewName}</div>
				<div>일정 넘버 : ${schedule.no}</div>
				<div>일정 제목 : ${schedule.title}</div>
				<div>모임일자 : ${schedule.gatherDate}</div>
				<div>모임장소: ${schedule.location}</div>
				<div>모임내용 : ${schedule.content}</div>
				<div>크루장 아이디 : ${schedule.adminId}</div>
				<div>현재 참여인원 : ${schedule.totalCount}</div>
				<div>전체 크루원 : ${schedule.memberNum}</div>
				
				<input type="hidden" name="no" value="${schedule.no}">
				<input type="hidden" name="courseId" value="${schedule.courseId}">
				
				<c:if test="${schedule.complete eq true}">
					<button type="submit">참여완료</button>
				</c:if>
				
				<%-- <c:forEach items="<%=courseList%>" var="list">
				<p>일정 넘버 : ${schedule.no}</p>
				<p>넘버 : ${list.no}</p>
					<c:if test="${list.no ne schedule.no}">
					</c:if>
				</c:forEach> --%>
			</div>
		</form>
	</c:forEach>


</body>
</html>
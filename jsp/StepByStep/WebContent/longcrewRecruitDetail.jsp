<%@page import="model.LongCrewMemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.LongCrewDAO"%>
<%@page import="model.LongCrewRecruitDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="loginCheck.jsp" %>
<%
	String userId = (String)session.getAttribute("userId");
	String crewName = request.getParameter("crewName");
	LongCrewRecruitDTO crew = new LongCrewDAO().selectRecruitDetail(crewName);
	String adminId = crew.getAdminId();
	pageContext.setAttribute("adminId", adminId);
	LongCrewDAO dao2 = new LongCrewDAO();			// 특정 장기크루의 모든 memId + adminId 가져오기
	List<LongCrewMemberDTO> memberList = dao2.selectMemid(crewName);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장기크루 모집글 상세보기</title>
</head>
<body>

	<form action="./joinCrew.long" method="post">
			<div style="display: flex; flex-direction: column; justify-content: center; align-content: center;">
				<p>크루명 : <%=crew.getCrewName() %></p>
				<p>모집내용(조건) : <%=crew.getContent() %></p>
				<p>모집인원 : <%=crew.getMemberNum() %></p>
				<p>현재크루원 : <%=crew.getTotalCount()%></p>
				<p>작성일 : <%=crew.getCreated()%></p>
				<p>방장ID : <%=crew.getAdminId()%></p>
				<p><a href="longCrewBoardList.jsp?crewName=<%=crew.getCrewName()%>">특정 크루 게시판으로 이동</a></p>
				<p><a href="registerLongcrewSchedule.jsp?crewName=<%=crew.getCrewName()%>">특정 크루의 일정 등록하기</a></p>
				<p><a href="crewPlannedSchedule.jsp?crewName=<%=crew.getCrewName()%>">특정 크루의 예정된 일정으로 이동</a></p>
				<p><a href="crewClosedSchedule.jsp?crewName=<%=crew.getCrewName()%>">특정 크루의 마감된 일정으로 이동</a></p>
				<p><a href="crewPhotobook.jsp?crewName=<%=crew.getCrewName()%>">특정 크루의 앨범으로 이동</a></p>
				
				<input type="hidden" name="crewName" value="<%=crew.getCrewName()%>">
				<input type="hidden" name="memberNum" value="<%=crew.getMemberNum()%>">
				<input type="hidden" name="userId" value="${userId}">
				<input type="hidden" name="adminId" value="<%=crew.getAdminId()%>">
				
				<!-- 접속자와 크루 방장이 같으면 크루참여 버튼 안보임 -->
				<c:forEach items="<%=memberList%>" var="member">
					<c:if test="${userId ne adminId || userId ne member.memId}">
						<button type="submit" style="width: 80px;">크루참여</button>
					</c:if>
				</c:forEach>
			</div>
		</form>


</body>
</html>
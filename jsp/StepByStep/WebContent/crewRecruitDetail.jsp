<%@page import="model.CrewScheduleMemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.CrewRecruitDAO"%>
<%@page import="model.CrewRecruitDTO"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="loginCheck.jsp" %>
<%
	String crewName = request.getParameter("crewName");
	CrewRecruitDTO crew = new CrewRecruitDAO().selectRecruitDetail(crewName);
	String userId = (String)session.getAttribute("userId");	// 로그인된 아이디
	String adminId = crew.getAdminId();
	pageContext.setAttribute("adminId", adminId);			// 크루방장 아이디
	CrewRecruitDAO dao = new CrewRecruitDAO();				// 특정 단기크루의 모든 memId 가져오기
	List<CrewScheduleMemberDTO> memberList = dao.selectMemid(crewName);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단기크루 모집글 상세보기</title>
</head>
<body>
	
	
	<!-- 이미 참여신청 했으면 크루참여버튼 비활성화하기 -->
		<form action="./joinCrew.crew" method="post">
			<div style="display: flex; flex-direction: column; justify-content: center; align-content: center;">
				<p>모일일정 no : <%=crew.getNo() %></p>
				<p>크루명 : <%=crew.getCrewName() %></p>
				<p>모집글 제목 : <%=crew.getTitle() %></p>
				<p>모집내용(조건) : <%=crew.getContent() %></p>
				<p>모임장소 : <%=crew.getLocation()%></p>
				<p>모집인원 : <%=crew.getMemberNum() %></p>
				<p>현재크루원 : <%=crew.getTotalCount()%></p>
				<p>작성일 : <%=crew.getCreated()%></p>
				<p>모임날짜 : <%=crew.getGatherDate()%></p>
				<p>방장ID : <%=crew.getAdminId()%></p>
				<p><a href="crewPlannedSchedule.jsp?crewName=<%=crew.getCrewName()%>">특정 크루의 예정된 일정으로 이동</a></p>
				<p><a href="crewClosedSchedule.jsp?crewName=<%=crew.getCrewName()%>">특정 크루의 마감된 일정으로 이동</a></p>
				<p><a href="crewPhotobook.jsp?crewName=<%=crew.getCrewName()%>">특정 크루의 앨범으로 이동</a></p>
				
				<input type="hidden" name="no" value="<%=crew.getNo()%>">
				<input type="hidden" name="crewName" value="<%=crew.getCrewName()%>">
				<input type="hidden" name="memberNum" value="<%=crew.getMemberNum()%>">
				<input type="hidden" name="adminId" value="<%=crew.getAdminId()%>">
				<input type="hidden" name="userId" value="<%=userId%>">
				
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
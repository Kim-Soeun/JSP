<%@page import="model.crewRecruitDAO"%>
<%@page import="model.crewRecruitDTO"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%
	String crewName = request.getParameter("crewName");
	/* if (crewName != null) {
	    crewName = URLDecoder.decode(crewName, "UTF-8");
	} */

	crewRecruitDTO crew = new crewRecruitDAO().selectRecruitDetail(crewName);
	memberDTO dto = (memberDTO)session.getAttribute("memberDTO");
	String userId = dto.getId();	// 로그인된 아이디
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크루 모집글 상세보기</title>
</head>
<body>
	
	<!-- 방장에게는 크루참여 버튼 안보이게 설정하기 -->
	<!-- 이미 참여신청 했으면 크루참여버튼 비활성화하기 -->
		<form action="./joinCrew.crew" method="post">
			<div style="display: flex; flex-direction: column; justify-content: center; align-content: center;">
				<p>크루명 : <%=crew.getCrewName() %></p>
				<p>모집글 제목 : <%=crew.getTitle() %></p>
				<p>모집내용(조건) : <%=crew.getContent() %></p>
				<p>모임장소 : <%=crew.getLocation()%></p>
				<p>모집인원 : <%=crew.getMemberNum() %></p>
				<p>작성일 : <%=crew.getCreated()%></p>
				<p>모임날짜 : <%=crew.getGatherDate()%></p>
				<p>방장ID : <%=crew.getAdminId()%></p>
				
				<input type="hidden" name="crewName" value="<%=crew.getCrewName()%>">
				<input type="hidden" name="memberNum" value="<%=crew.getMemberNum()%>">
				<input type="hidden" name="adminId" value="<%=crew.getAdminId()%>">
				<input type="hidden" name="userId" value="<%=userId%>">
				
				<button type="submit" style="width: 80px;">크루참여</button>
			</div>
		</form>
	
</body>
</html>
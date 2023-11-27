<%@page import="model.crewDAO"%>
<%@page import="model.memberDTO"%>
<%@page import="model.crewRecruitDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.crewRecruitDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="loginCheck.jsp" %>

<%
	crewRecruitDAO dao = new crewRecruitDAO();
	List<crewRecruitDTO> crewList = dao.selectAllRecruit();
	for(int i=0; i<crewList.size(); i++) {
		crewRecruitDTO dto = crewList.get(i);
		dao.deleteCrew(dto.getCrewName(), dto.getCreated());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크루 모집글 전체보기</title>
</head>
<body>
	
	<!-- 방장에게는 크루참여 버튼 안보이게 설정하기 -->
	<c:forEach items="<%=crewList%>" var="crew">
			<div style="display: flex; flex-direction: column; justify-content: center; align-content: center;">
				<p><a href="crewRecruitDetail.jsp?crewName=${crew.crewName}">크루명 : ${crew.crewName}</a></p>
				<p>모집글 제목 : ${crew.title}</p>
				<p>모집내용(조건) : ${crew.content}</p>
				<p>모임장소 : ${crew.location}</p>
				<p>모집인원 : ${crew.memberNum}</p>
				<p>현재크루원 : ${crew.totalCount}</p>
				<p>작성일 : ${crew.created}</p>
				<p>모임날짜 : ${crew.gatherDate}</p>
				<p>방장ID : ${crew.adminId }</p>
			</div>
	</c:forEach>
	
	
</body>
</html>
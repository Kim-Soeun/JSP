<%@page import="model.LongCrewRecruitDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.LongCrewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	LongCrewDAO dao = new LongCrewDAO();
	List<LongCrewRecruitDTO> crewList = dao.selectAllRecruit();	// 모든 장기크루 가져오기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장기크루모집 모두보기</title>
</head>
<body>
	
	<c:forEach items="<%=crewList%>" var="crew">
			<div style="display: flex; flex-direction: column; justify-content: center; align-content: center;">
				<p><a href="longcrewRecruitDetail.jsp?crewName=${crew.crewName}">크루명 : ${crew.crewName}</a></p>
				<p>크루명 : ${crew.crewName}</p>
				<p>모집내용(조건) : ${crew.content}</p>
				<p>모집인원 : ${crew.memberNum}</p>
				<p>현재크루원 : ${crew.totalCount}</p>
				<p>작성일 : ${crew.created}</p>
				<p>방장ID : ${crew.adminId}</p>
			</div>
	</c:forEach>
	
	
	
</body>
</html>
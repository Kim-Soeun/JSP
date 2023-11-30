<%@page import="model.CrewRecruitDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.CrewRecruitDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="loginCheck.jsp" %>
<%
	String userId = (String)session.getAttribute("userId");
	CrewRecruitDAO dao = new CrewRecruitDAO();
	List<CrewRecruitDTO> cNameList = dao.selectCrewName();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장기크루 등록</title>
</head>
<body>
	<!-- 단기크루와 장기크루 모두에서 불러와 크루명 비교해서 중복검사해야함 -->
	<form action="./longcrewRecruit.long" method="post" name="frm" onsubmit="return isResult()">
		
		<div id="existingCrews" style="display: none;"><c:forEach items="<%=cNameList%>" var="crew">${crew.crewName} </c:forEach></div>
		
		<label>크루명</label>
		<input type="text" id="crewName" name="crewName" required>
		<button type="button" onclick="crewNameCheck()">중복확인</button>
		<div id="warningMessageContainer"></div>
		
		
		<label>조건(내용)</label>
		<input type="text" name="content" placeholder="#24~28 여자만, #월 3회 참석 의무" required><br>
		
		<label>모집인원</label>
		<input type="text" name="memberNum" required><br>
		
		<input type="hidden" name="adminId" value="<%=userId%>">

		<button type="submit">등록</button>
	</form>
	
<script type="text/javascript" src="./resources/js/crew.js"></script>
</body>
</html>
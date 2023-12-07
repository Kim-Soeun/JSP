<%@page import="model.CrewJoinDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.CrewJoinDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="loginCheck.jsp" %>
<%
	String userId = (String)session.getAttribute("userId");
	CrewJoinDAO dao = new CrewJoinDAO();
	List<CrewJoinDTO> joinList = dao.selectJoinByAdmin(userId);// 내가 방장인 단기크루 승인대기 리스트
	List<CrewJoinDTO> joinList2 = dao.selectCrewJoin(userId);	// 내가 신청 대기중인 단기크루 리스트
	List<CrewJoinDTO> longList = dao.selectJoinByAdmin2(userId);//내가 방장인 장기크루 승인대기 리스트
	List<CrewJoinDTO> longList2 = dao.selectLongCrewJoin(userId);// 내가 신청 대기중인 장기크루 리스트
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입신청현황</title>
</head>
<body>

	<!-- 방장일 경우 -->
	<h3>승인수락할 리스트</h3>
	
	<h3>단기크루</h3>
	<c:forEach items="<%=joinList%>" var="join">
		<form action="./joinCrew.join" method="post" name="frm" style="display: flex; flex-direction: column; justify-content: center; align-content: center; border: 1px solid black; width: 250px;">
			<p>크루명 : ${join.crewName}</p>
			<p>방장ID : ${join.adminId}</p>
			<p>신청ID : ${join.memId}</p>
			<p>모집인원 : ${join.memberNum}</p>
			
			<input type="hidden" name="crewName" value="${join.crewName}">
			<input type="hidden" name="adminId" value="${join.adminId}">
			<input type="hidden" name="memId" value="${join.memId}">
			<input type="hidden" name="memberNum" value="${join.memberNum}">
			<input type="hidden" name="isShortCrew" value="${join.isShortCrew}">
			<input type="hidden" name="isPermit">
			
			
			<c:if test="${join.isCheck eq 1}">
				<button type="button" onclick="check(this, true)" style="width: 50px; height: 30px;">수락</button>
				<button type="button" onclick="check(this, false)" style="width: 50px; height: 30px;">거절</button>
			</c:if>
		</form>
	</c:forEach>
	
	<h3>장기크루</h3>
	<c:forEach items="<%=longList%>" var="join">
		<form action="./joinCrew.join" method="post" name="frm" style="display: flex; flex-direction: column; justify-content: center; align-content: center; border: 1px solid black; width: 250px;">
			<p>크루명 : ${join.crewName}</p>
			<p>방장ID : ${join.adminId}</p>
			<p>신청ID : ${join.memId}</p>
			<p>모집인원 : ${join.memberNum}</p>
			
			<input type="text" name="crewName" value="${join.crewName}">
			<input type="text" name="adminId" value="${join.adminId}">
			<input type="text" name="memId" value="${join.memId}">
			<input type="text" name="memberNum" value="${join.memberNum}">
			<input type="text" name="isShortCrew" value="${join.isShortCrew}">
			<input type="text" name="isPermit">
			
			<c:if test="${join.isCheck eq 1}">
				<button type="button" onclick="check(this, true);" style="width: 50px; height: 30px;">수락</button>
				<button type="button" onclick="check(this, false);" style="width: 50px; height: 30px;">거절</button>
			</c:if>
		</form>
	</c:forEach>
	
	
	
	
	<!-- 크루신청 대기중일 경우 -->
	<h3>나의 승인현황 리스트</h3>
	
	<h3>단기크루</h3>
	<c:forEach items="<%=joinList2%>" var="join">
			<div style="display: flex; flex-direction: column; justify-content: center; align-content: center; border: 1px solid black; width: 250px;">
				<p>크루명 : ${join.crewName}</p>
				<p>방장ID : ${join.adminId}</p>
				<p>신청ID : ${join.memId}</p>
				<p>모집인원 : ${join.memberNum}</p>
				<c:choose>
					<c:when test="${join.isCheck eq 1}">
						<p>승인상태 : 승인대기중</p>
					</c:when>
					<c:otherwise>
						<c:if test="${join.isCheck eq 2}">
							<p>승인상태 : 승인완료</p>
						</c:if>
						<c:if test="${join.isCheck eq 3}">
							<p>승인상태 : 승인거절</p>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
	</c:forEach>

	<h3>장기크루</h3>
	<c:forEach items="<%=longList2%>" var="join">
			<div style="display: flex; flex-direction: column; justify-content: center; align-content: center; border: 1px solid black; width: 250px;">
				<p>크루명 : ${join.crewName}</p>
				<p>방장ID : ${join.adminId}</p>
				<p>신청ID : ${join.memId}</p>
				<p>모집인원 : ${join.memberNum}</p>
				<c:choose>
					<c:when test="${join.isCheck eq 1}">
						<p>승인상태 : 승인대기중</p>
					</c:when>
					<c:otherwise>
						<c:if test="${join.isCheck eq 2}">
							<p>승인상태 : 승인완료</p>
						</c:if>
						<c:if test="${join.isCheck eq 3}">
							<p>승인상태 : 승인거절</p>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
	</c:forEach>
	
	<!-- 수락 or 거절 버튼 확인 -->
	<script>
		var fr;
		function check(th, bool) {
			fr = th.parentNode;
			console.log(fr);
			fr.querySelector('input[name=isPermit]').value = bool;
			console.log(fr);
			fr.submit();
		}
	</script>
	
</body>
</html>
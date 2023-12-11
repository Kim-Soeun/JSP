<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<%@include file="background.jsp"%>
<link href="resources/css/crewactivity.css" rel="stylesheet"
	type="text/css">
<div class="crew-activity">
	<div class="activity-header">
		<div class="crew-sort">
			<input type="button" class="sort" id="home" value="홈"> 
			<input type="button" class="sort" id="board" value="게시판"> 
			<input type="button" class="sort" id="date" value="일정"> 
			<input type="button" class="sort" id="photobook" value="앨범">
		</div>
		<div class="activity-background">
			<img src="./resources/images/back.jpg" alt="Background Image"
				width="300" height="200">
		</div>
	</div>
	<div class="activity-details">
		<p>크루 제목 :</p>
		<p>일정 :</p>
		<p>장소 :</p>
		<p>모집 인원 :</p>
		<p>참가 비용 :</p>
		<p>가입 조건 :</p>
	</div>
</div>

<%@include file="footer.jsp"%>
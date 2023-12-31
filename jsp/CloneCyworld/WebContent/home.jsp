<%@page import="model.guestbookDTO"%>
<%@page import="model.imageDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.imageDAO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="model.guestbookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ownerId = request.getParameter("id");
	LocalDateTime today = LocalDateTime.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");
	String created = today.format(formatter);
	int gResult = new guestbookDAO().UpdateNewCount(ownerId, created);
	pageContext.setAttribute("gResult", gResult);
	int iResult = new imageDAO().ImageCount(ownerId, created);
	pageContext.setAttribute("iResult", iResult);
	List<imageDTO> imgList = new imageDAO().SelectImages(ownerId);
	pageContext.setAttribute("imgList", imgList);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/index.css" />
<link rel="stylesheet" href="./resources/css/home.css" />
<link rel="stylesheet" href="./resources/css/color.css" />
<script type="text/javascript" src="./resources/js/home.js"></script>

<title>미니홈피</title>
</head>
<body class="center-layout">
	<div class="center-layout-column white box-1">
	<div class="center-layout blue box-2">
		<div class="container center-layout">
			<!-- 왼쪽 프로필 박스 -->
			<div class="left-box center-layout-column" style="height: 100%;">
				<div class="box-radius-5 center today-div-1"><h3 style="color: #004080;">${dto.getId()} 님의 미니홈피</h3></div>
				<div class="box-radius-5 center today-div-2">Today 222 || Total 1111</div>
				<div class="box-radius-5 center-layout-column" style="height: 90%; margin: 0 5px; padding: 35px;">
	
					<img class="profile" alt="profile"
						src="./resources/img/${dto.getImgName()}"/>
					<hr />
					<div class="dot-line"></div>
					<div class="center-layout-column" style="height: 40%;">
						<div class="box-radius-5 today-div-3 center">TODAY IS... 화이팅!!</div>
						<div class="today-div-4">${dto.getId()} 님의 미니홈피에 오신 것을 환영합니다!</div>
					</div>
					<div class="dot-line"></div>
					<div class="center">
						<div class="center-layout">
							<p>짱구</p>
						</div>
						<select class="select" id="pageSelect" onchange="openPage()">
							<option value="">파도타기</option>
							<option value="https://www.naver.com">네이버</option>
							<option value="https://www.google.com">구글</option>
						</select>
						<form style="margin: 5px;" action="LogoutServlet" method="post">
							<input type="submit" value="로그아웃"/>
						</form>
					</div>
				</div>
			</div>
			
			<!-- 오른쪽 홈박스 -->
			<div class="right-box" style="height: 100%;">
				<div class="box-radius-5 logo-wrapper" style="height: 10%; width: 100%;">
					<img class="literal-logo" alt="cy-literal-logo"
						src="./resources/img/Cyworld-literal.svg">
				</div>
				<div class="box-radius-5 center-layout-column" style="height: 90%;">
					<div class="bgm-wrapper">
						<p>BGM</p>
					</div>
					<div class="right-box-content">
						<div class="update">
							<p> ● ${imgList[0].title}</p>
							<p> ● 그간의 일기</p>
						</div>
						<div style="border: 1px solid black; margin: 5px;">
							<div class="menu-wrapper" style="display: flex;">
								<div class="menu">투데이</div>
								<div class="menu">주크박스</div>
							</div>
							<div class="menu-wrapper" style="display: flex;">
								<div class="menu">
									<a href="photolist.jsp?id=<%=ownerId%>">사진첩</a>
									<c:if test="${iResult gt 0}">
										<img src="./resources/img/newIcon.png"/>
									</c:if>
								</div>
								<div class="menu">
									<a href="guestbook.jsp?id=<%=ownerId%>">방명록</a>
									<c:if test="${gResult gt 0}">
										<img src="./resources/img/newIcon.png">
									</c:if>
								</div>
							</div>
						</div>
					</div>
	
					<img class="big-img" alt="big" src="./resources/img/cyworldImg.jpeg">
	
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="center-layout-column">
		<div class="category">
			<div><a href="home.jsp?id=<%=ownerId%>" class="c-white">홈</a></div>
			<div class="c-white">프로필</div>
			<div class="c-white">다이어리</div>
			<div><a href="musicList.jsp?id=<%=ownerId%>" class="c-white">쥬크박스</a></div>
			<div><a href="photolist.jsp?id=<%=ownerId%>" class="c-white">사진첩</a></div>
			<div class="c-white">게시판</div>
			<div><a href="guestbook.jsp?id=<%=ownerId%>" class="c-white">방명록</a></div>
			<div class="c-white">즐겨찾기</div>
		</div>
	</div>
		
</body>
</html>
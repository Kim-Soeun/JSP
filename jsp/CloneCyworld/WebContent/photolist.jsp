<%@page import="model.imageDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.imageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ownerId = request.getParameter("id");
	imageDAO dao = new imageDAO();
	List<imageDTO> imageList = dao.SelectImages(ownerId);
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css" />
<link rel="stylesheet" href="./resources/css/index.css" />
<link rel="stylesheet" href="./resources/css/home.css" />
<link rel="stylesheet" href="./resources/css/color.css" />
<link rel="stylesheet" href="./resources/css/photobook.css" />
<script type="text/javascript" src="./resources/js/home.js"></script>
<script type="text/javascript" src="./resources/js/photobook.js"></script>

<title>사진첩 - 불러오기</title>
</head>
<body class="center-layout">
	<div class="center-layout-column white box-1">
	<div class="center-layout blue box-2">
		<div class="container center-layout">
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
			
			<div class="right-box" style="height: 100%;">
				<div class="box-radius-5 logo-wrapper" style="height: 10%; width: 100%;">
					<img class="literal-logo" alt="cy-literal-logo"
						src="./resources/img/Cyworld-literal.svg">
				</div>
				<div class="box-radius-5 center-layout-column overflow" style="height: 90%;">
					<div class="bgm-wrapper">
						<p>BGM</p>
					</div>
					<div class="right-box-content flex-col" style="width: 90%; height: 80%;" >
					
						<!-- 홈피 주인과 접속자가 같으면 사진올리기 아이콘 보이게 설정 -->
						<c:if test="${param.id eq user_id}">
							<div style="width: 100%;">
								<div style="width: 100%; height: 10%;">
									<a href="photobook.jsp?id=<%=ownerId%>"><img src="./resources/img/icon.png"></a>
								</div>
							</div>
						</c:if>
						
						<!-- 사진 모두 불러오기 -->
						<c:set var="imageList" value="<%=imageList %>" />
						<c:forEach items="${imageList}" var="images">
							<div style="width: 100%;">
								<div class="center-layout-column border" style="height: 90%;">
									<div style="width: 100%; display: flex;">
										<span class="center lightgray" style="width: 100%;">${images.getTitle()}</span>
										<button style="width: 40px;" type="button" onclick="location.href='DeleteImageServlet?id=${images.id}&no=${images.no}'">삭제</button>
									</div>
									<div class="flex" style="width: 100%; height: 10%;">
										<p class="c-deepblue" style="padding: 3px;">${images.id}</p>
										<p class="c-gray" style="padding: 3px;">${images.created}
									</div>
									<img style="width: 100%; height: 75%;" src="./resources/img/${images.imgName}">
									<span class="center" style="margin: 10px; width: 40%; height: 10%;">${images.content}</span>
								</div>
							</div>
						</c:forEach>
						
						<!-- 사진이 없을 경우 -->
						<c:if test="${empty imageList}">
							<c:choose>
								<c:when test="${param.id eq user_id}">
									<div style="width: 100%;">
										<div class="center-layout-column" style="height: 90%;">
											<img style="width: 40%; height: 40%;" src="./resources/img/uploadImageIcon.svg">
											<p class="center" style="margin: 10px; width: 40%;">사진 올리기</p>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div style="width: 100%;">
										<div class="center-layout-column" style="height: 100%;">
											<p class="center" style="margin: 10px; width: 40%;">사진이 없습니다</p>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</c:if>
					</div>
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
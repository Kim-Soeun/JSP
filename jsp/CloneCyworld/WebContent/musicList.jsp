<%@page import="model.musicDAO"%>
<%@page import="model.musicDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<%
	String id = request.getParameter("id");
	List<musicDTO> musicList = new musicDAO().SelectMusicList(id);
	
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

<title>쥬크박스 - 음악 리스트</title>
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
				<%
					
				%>
				<div class="box-radius-5 flex-align overflow" style="height: 90%; width: 100%;">
					<form class="box-radius-5 flex-align" style="height: 100%; width: 100%;" action="RegisterBgmServlet.jsp" method="post">
						<div style="display: flex; width: 100%; justify-content: end;">
							<button style="margin: 5px;" type="button" onclick="location.href='addMusic.jsp?id=<%=id%>'">음악 등록</button>
							<button style="margin: 5px;" type="button">배경음악 등록</button>
						</div>
						
						<c:set var="list" value="<%=musicList%>"/>
						<div style="width: 90%;">
							<div class="lightgray" style="display: flex; justify-content: space-between; border-bottom: 1px dotted lightgray;">
								<input type="checkbox" name="picked">
								<span>번호</span>
								<span>곡명</span>
								<span>아티스트</span>
							</div>
							<c:forEach items="${list}" var="music" varStatus="i">
								<div style="display: flex; justify-content: space-between; border-bottom: 1px dotted lightgray;">
									<input type="checkbox" name="picked"/>
									<div>${list.size()-i.index}</div>
									<div>${music.title}</div>	
									<div>${music.artist}</div>	
									
								</div>
							</c:forEach>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="center-layout-column">
		<div class="category">
			<div><a href="home.jsp?id=<%=id%>" class="c-white">홈</a></div>
			<div class="c-white">프로필</div>
			<div class="c-white">다이어리</div>
			<div><a href="musicList.jsp?id=<%=id%>" class="c-white">쥬크박스</a></div>
			<div><a href="photolist.jsp?id=<%=id%>" class="c-white">사진첩</a></div>
			<div class="c-white">게시판</div>
			<div><a href="guestbook.jsp?id=<%=id%>" class="c-white">방명록</a></div>
			<div class="c-white">즐겨찾기</div>
		</div>
	</div>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
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

<title>쥬크박스 - 음악 등록</title>
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
					<form class="center-layout-column" action="AddMusicServlet" method="post">
						<input type="hidden" name="id" value="<%=id%>">
						<label>곡명</label>
						<input type="text" name="title">
						<label>아티스트</label>
						<input type="text" name="artist">
						<label>유튜브 아이디</label>
						<input type="text" name="youtubeId">
						<button type="submit">등록</button>		
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
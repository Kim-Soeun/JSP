<%@page import="model.imageDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.imageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ownerId = request.getParameter("id");	
	imageDAO dao = new imageDAO();
	List<imageDTO> imageList = dao.SelectImages(ownerId);
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

<title>사진첩 - 업로드</title>
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
				<div class="box-radius-5 center-layout-column" style="height: 90%;">
					<div class="bgm-wrapper">
						<p>BGM</p>
					</div>
					<div class="right-box-content" style="width: 90%; height: 80%;" >
						<form class="form" action="ImageServlet" method="post" enctype="multipart/form-data">
							<div class="file-wrapper lightgray">
								<label>제목</label>
								<input type="text" name="title" required>
								<input type="hidden" name="id" value="<%=ownerId%>"/>
							</div>
							<div class="file-wrapper lightgray">
								<label>파일첨부</label>
								<input type="file" name="fileImg" onchange="setThumbnail(event)">
							</div>
							<div id="photo-container" style="height: 65%; margin: 10px 0;"></div>
							<div>
								<textarea name="imgContent" style="height: 20%;" rows="4" cols="95"></textarea>
							</div>
							<div class="right">
								<button style="height: 5%; margin: 5px;" type="submit">등록</button>
							</div>
						</form>
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
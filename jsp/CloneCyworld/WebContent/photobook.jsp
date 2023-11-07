<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ownerId = request.getParameter("id");	
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

<title>사진첩</title>
</head>
<body class="center-layout">
	<div class="center-layout-column white box-1">
	<div class="center-layout blue box-2">
		<div class="container center-layout">
			<div class="left-box" style="height: 100%;">
				<div class="box-radius-5 center today-div-1">${dto.getId()} 님의 미니홈피</div>
				<div class="box-radius-5 center today-div-2">Today 222 || Total 1111</div>
				<div class="box-radius-5 center-layout-column" style="height: 90%;">
	
					<img class="profile" alt="profile"
						src="./resources/img/${dto.getImgName()}"/>
					<hr />
					<div>
						<div class="box-radius-5" style="margin: 10px;">today is... </div>
						<div style="margin: 10px;">${user_id} 님의 미니홈피에 오신 것을 환영합니다!</div>
					</div>
					<div class="dot-line"></div>
					<div>
						<div class="center-layout">
							<p>짱구</p>
						</div>
						<select id="pageSelect" onchange="openPage()">
							<option value="">파도타기</option>
							<option value="https://www.naver.com">네이버</option>
							<option value="https://www.google.com">구글</option>
						</select>
					</div>
				</div>
				<form action="LogoutServlet" method="post">
					<input type="submit" value="로그아웃"/>
				</form>
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
						<form action="FileUploadServlet" method="post" enctype="multipart/form-data">
							<div>
								<label>제목</label>
								<input type="text" name="title" required>
							</div>
							<div>
								<label>파일</label>
								<input type="file" name="fileImg">
							</div>
							<button type="submit">등록</button>
						</form>
					</div>
	
				</div>
			</div>
		</div>
	</div>
	</div>
	<div class="category center-layout-column">
		<div><a href="home.jsp?id=<%=ownerId%>">홈</a></div>
		<div>프로필</div>
		<div>다이어리</div>
		<div><a href="photobook.jsp?id=<%=ownerId%>">사진첩</a></div>
		<div><a href="guestbook.jsp?id=<%=ownerId%>">방명록</a></div>
	</div>
	
</body>
</html>
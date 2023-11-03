<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css">
<link rel="stylesheet" href="./resources/css/index.css">
<link rel="stylesheet" href="./resources/css/guestbook.css">
<title>Insert title here</title>
</head>
<body class="center-layout-column">
	<div class="center-layout-column box">
		<div class="center-layout left bar" style="width: inherit;">
			<span class="left" style="width: inherit;">작성 유저 id</span>
			<input type="hidden" >
		</div>
		<div style="width: inherit; display: flex;">
			<div class="write-div" style="width: 30%;">
				<img class="userProfile img" alt="userProfile" src="./resources/img/${dto.getImgName()}">
			</div>
			<div class="write-div" style="width: 70%;">
				<form action="GuestbookServlet" method="post">
					<textarea name="guestbook" rows="8" cols="57"  placeholder="방명록 글작성중" required></textarea>
					<div class="right">
						<button type="submit">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="center-layout-column box">
		<div class="left bar" style="width: inherit;">
			<span style="width: inherit;">no.153</span>
		</div>
		<div>
			<div>
				<img class="img" >
			</div>
			<div>
				<span>방명록</span>
			</div>
		</div>
	</div>
</body>
</html>
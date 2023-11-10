<%@page import="model.ReplyDAO"%>
<%@page import="model.Reply"%>
<%@page import="model.guestbookDTO"%>
<%@page import="model.guestbookDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.guestbook"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ownerId = request.getParameter("id");
	String userId = (String)session.getAttribute("user_id");
	guestbookDAO dao = new guestbookDAO();
	List<guestbookDTO> lists = dao.SelectGuestbook(ownerId);
	session.setAttribute("lists", lists);
	ReplyDAO replyDAO = new ReplyDAO();
	List<Reply> rLists = replyDAO.SelectReply();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/layout.css">
<link rel="stylesheet" href="./resources/css/index.css">
<link rel="stylesheet" href="./resources/css/color.css">
<link rel="stylesheet" href="./resources/css/home.css">
<link rel="stylesheet" href="./resources/css/guestbook.css">
<script type="text/javascript" src="./resources/js/home.js"></script>

<title>방명록</title>
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
				<div class="box-radius-5 overflow flex-align" style="height: 90%;">
		
					<!-- 홈피 주인과 접속자가 다를 때만 방명록 작성 가능하게 설정 -->
					<c:if test="${user_id ne param.id}">
						<div class="center-layout-column box">
							<form action="GuestbookServlet" method="post">
								<div class="center-layout left bar" style="width: inherit;">
										<input type="hidden" name="ownerId" value="<%=ownerId%>"/>
										<span class="left" style="width: inherit;">${dto.getId()}의 방명록</span>
								</div>
								<div style="width: inherit; display: flex;">
									<div class="write-div" style="width: 30%;">
										<img class="userProfile img" alt="userProfile" src="./resources/img/${dto.getImgName()}">
									</div>
									<div class="write-div" style="width: 70%;">
											<textarea name="content" rows="8" cols="50"  placeholder="방명록 글작성중" required></textarea>
											<div class="right">
												<button type="submit">등록</button>
											</div>
									</div>
								</div>
							</form>
						</div>
					</c:if>
					
					<!-- 방명록 불러오기 -->
					<c:set var="lists" value="<%=lists%>"/>
					<c:forEach items="${lists}" var="guestbook" varStatus="i">
						<div class="center-layout-column box">
							<div class="left bar" style="width: inherit;">
								<span style="width: 8%;">NO. ${lists.size()-i.index}</span>
								<span style="margin: 0 5px;">${guestbook.id}</span>
								<div>
									<a href="home.jsp?id=${guestbook.id}"><img style="margin: 0 5px;" alt="home" src="./resources/img/homeIcon.png"></a>
								</div>
								<span>(${guestbook.created})</span>
							</div>
							<div class="content-div">
								<div class="content-wrapper" style="width: 30%;">
									<img class="writerImg img" alt="writerImg" src="./resources/img/${guestbook.getImgName()}" >
								</div>
								<div class="content-wrapper" style="width: 70%">
									<span>${guestbook.getContent()}</span>
								</div>
								<c:if test="${user_id eq param.id || user_id eq guestbook.getId()}">
									<div class="content-wrapper" style="width: 10%;">
										<button type="button" onclick="location.href='DeleteServlet?b_no=${guestbook.getNo()}&id=${param.id}'">삭제</button>
									</div>
								</c:if>
								
							</div>
						</div>
						<%-- <%
							guestbookDTO dto = (guestbookDTO)pageContext.getAttribute("lists");
						%>
						<%=dto.getNo() %> --%>
						
						<%
							pageContext.setAttribute("ownerId", ownerId);
						%>
						
						<!-- 댓글창 -->
						<c:set var="rLists" value="<%=rLists%>"/>
						<c:forEach items="${rLists}" var="reply">
						<c:if test="${guestbook.getNo() eq reply.getB_no()}">
							<div class="reply-div" style="width: 600px;">
								<div class="reply-wrapper">
									<p>${reply.getId()} : </p>
								</div>
								<div class="reply-wrapper">
									<span>${reply.getContent()}</span>
								</div>
								<div class="reply-wrapper">
									<p>(${reply.getCreated()})</p>
								</div>
								<c:if test="${user_id eq param.id || user_id eq reply.getId()}">
									<a href="DeleteReplyServlet?no=${guestbook.no}&id=${param.id}"><img src="./resources/img/deletebutton.png"/></a>
								</c:if>
							</div>
						</c:if>
						</c:forEach>
					
						
						<div class="reply-div" style="width: 600px;">
							<form class="center-layout" action="ReplyServlet" method="post">
								<input type="hidden" name="b_no" value="${guestbook.getNo()}">
								<input type="hidden" name="id" value="<%=ownerId%>">
								<div class="reply-wrapper">
									<textarea name="content"  rows="4" cols="70"  placeholder="댓글"></textarea>
								</div>
								<button style="margin: 20px;" type="submit">등록</button>
							</form>
						</div>
					</c:forEach>
	
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
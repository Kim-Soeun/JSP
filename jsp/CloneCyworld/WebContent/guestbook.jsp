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
	List<guestbookDTO> lists = dao.SelectGuestbook(ownerId, userId);
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
<link rel="stylesheet" href="./resources/css/guestbook.css">
<title>Insert title here</title>
</head>
<body class="center-layout-column body">
	<div class="center-layout-column box">
		<c:if test="${user_id ne param.id}">
			<form action="GuestbookServlet" method="post">
				<div class="center-layout left bar" style="width: inherit;">
						<span class="left" style="width: inherit;">${dto.getId()}의 방명록</span>
						<input type="hidden" name="ownerId" value="<%=ownerId%>"/>
				</div>
				<div style="width: inherit; display: flex;">
					<div class="write-div" style="width: 30%;">
						<img class="userProfile img" alt="userProfile" src="./resources/img/${dto.getImgName()}">
					</div>
					<div class="write-div" style="width: 70%;">
							<textarea name="content" rows="8" cols="57"  placeholder="방명록 글작성중" required></textarea>
							<div class="right">
								<button type="submit">등록</button>
							</div>
					</div>
				</div>
			</form>
		</c:if>
	</div>
	
	<!-- 방명록 -->
	
	<c:set var="lists" value="<%=lists%>"/>
	<c:forEach items="${lists}" var="guestbook" varStatus="i">
		<div class="center-layout-column box">
			<div class="left bar" style="width: inherit;">
				<span style="width: inherit;">NO. ${lists.size()-i.index}</span>
			</div>
			<div class="content-div">
				<div class="content-wrapper" style="width: 30%;">
					<img class="writerImg img" alt="writerImg" src="./resources/img/${guestbook.getImgName()}" >
				</div>
				<div class="content-wrapper" style="width: 70%">
					<span>${guestbook.getContent()}</span>
				</div>
			</div>
		</div>
		<%-- <%
			guestbookDTO dto = (guestbookDTO)pageContext.getAttribute("lists");
		%>
		<%=dto.getNo() %> --%>
		
		<%
			pageContext.setAttribute("ownerId", ownerId);
		%>
		
	
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

	
</body>
</html>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	// 게시판 리스트
	List boardlist = (List) request.getAttribute("boardlist");
	// 전체 게시물 개수	
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	// 현재 페이지 번호
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	// 전체 페이지 개수
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<!-- 
	세션 id를 가져오고 게시판 객체 생성. 전체 게시글 개수(total_record),
	전체 페이지(total_page), 현재 페이지 번호(pageNum)로 대입시킴
-->
 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Board</title>
<script type="text/javascript">
	function checkForm() {
		if (${UserId == null}) {
			alert("로그인해주세요");
			return false;
		}
		location.href="./BoardWriteForm.do?id=${UserId}"
	}
</script>
<!-- 
	 로그인했는지 점검하고, 로그인이 안되어 있으면 글작성 취소
	 로그인이 되어 있으면 해당 로그인 아이디로 글 작성하게 처리함
 -->
</head>
<body>

	<jsp:include page="/menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>

	<div class="container">
		
		<form action='<c:url value="./BoardListAction.do"/>' method="post">
			<div class="text-right">
				<span class="badge badge-success">전체${total_record}건</span>
			</div>
			
			<div style="padding-top: 50px">
				<table class="table table-hover"> 
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>조회</th>
					<th>글쓴이</th>
				</tr>
				<c:forEach items="${boardlist}" var="list">
				<tr>
					<td>${list.num}</td>
					<td><a href="./BoardViewAction.do?num=${list.num}&pageNum=${pageNum}">${list.subject}</a></td>
					<td>${list.regist_day}</td>
					<td>${list.hit}</td>
					<td>${list.name}</td>
				</tr>
				</c:forEach>
				</table>
			</div>
			
			<div align="center">
				<c:forEach var="i" begin="1" end="<%=total_page%>">
				
					<a href="<c:url value='./BoardListAction.do?pageNum=${i}'/>">
					
						<c:choose>
							<c:when test="${pageNum==i}">
								<font color="red"><b>[${i}]</b></font>
							</c:when>
							<c:otherwise>
								<font color="black">[${i}]</font>
							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach>
			</div>
			
			<div align="left">
				<table>
					<tr>
						<td width="100%" align="left">&nbsp;&nbsp;
							<select name="items" class="txt">
								<option value="subject">제목에서</option>
								<option value="content">본문에서</option>
								<option value="name">글쓴이에서</option>
							</select>
							<input name="text" type="text">
							<input type="submit" id="btnAdd" class="btn btn-primary" value="검색">
							</td>
							
							<td width="100%" align="right">
								<a href="/BoardWriteForm.do" onclick="checkForm(); return false;" class="btn btn-primary">글쓰기</a>
							</td>
					</tr>
				</table>
			</div>
			
		</form>
	
	</div>

</body>
</html>
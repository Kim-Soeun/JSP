<%@page import="model.BoardDTO"%>
<%@page import="model.LongCrewMemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.LongCrewDAO"%>
<%@page import="model.BoardDAO"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 	String crewName = request.getParameter("crewName");
	pageContext.setAttribute("crewName", crewName);
	crewName = URLDecoder.decode(crewName, "UTF-8");
	BoardDAO dao = new BoardDAO();
	LongCrewDAO dao2 = new LongCrewDAO();			
	List<LongCrewMemberDTO> memberList = dao2.selectMemid(crewName);  // 특정 장기크루의 모든 memId + adminId 가져오기
	
	int pageSize = Integer.parseInt(application.getInitParameter("POST_PAGE"));		// 한 페이지 게시물 개수(8개)
	int blockSize = Integer.parseInt(application.getInitParameter("BLOCK_COUNT"));	// 하단표시 한 블록 개수(5개)
	int totalCount = dao.selectCount(crewName);										// 게시물 전체 개수
	int totalPage = (int) Math.ceil((double)(totalCount / pageSize));				// 게시물 페이지 전체 개수
	
	int pageNum = 1;
	String pn = request.getParameter("pageNum");
	if(pn != null) {
		pageNum = Integer.parseInt(pn);
	}

	int start = (pageNum - 1) * pageSize + 1;
	List<BoardDTO> boardList = dao.selectCrewBoardList(crewName, start);
	dao.close();
%> 
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/board.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>board</title>
<script src="resources/js/board.js"></script>
</head>
<body>

	<div class="container">
		<%@include file="header.jsp"%>
		<div class="mid">
			<div class="container-background">
				<div class="mid-inner">
					<div class="mid-head">
						<input type="text" id="location_bar" placeholder="주소를 설정하세요">
						<div id="popup" style="display: none;">
							<div class="addressList">
								<div class="address-cate">
									<div class="address-menu">
										<button type="button" id="1">서울특별시</button>
										<button type="button" id="2">부산광역시</button>
										<button type="button" id="3">대구광역시</button>
										<button type="button" id="4">인천광역시</button>
										<button type="button" id="5">광주광역시</button>
										<button type="button" id="6">대전광역시</button>
										<button type="button" id="7">울산광역시</button>
										<button type="button" id="8">세종특별자치시</button>
										<button type="button" id="9">경기도</button>
										<button type="button" id="10">충청북도</button>
										<button type="button" id="11">충청남도</button>
										<button type="button" id="12">전라북도</button>
										<button type="button" id="13">전라남도</button>
										<button type="button" id="14">경상북도</button>
										<button type="button" id="15">경상남도</button>
										<button type="button" id="16">제주특별자치도</button>
										<button type="button" id="17">강원특별자치도</button>
									</div>
									<div class="address-tab">
										<div id="1">
											<button type="button">강남구</button>
											<button type="button">강동구</button>
											<button type="button">강북구</button>
											<button type="button">강서구</button>
											<button type="button">관악구</button>
											<button type="button">광진구</button>
											<button type="button">구로구</button>
											<button type="button">노원구</button>
											<button type="button">도봉구</button>
											<button type="button">동대문구</button>
											<button type="button">동작구</button>
											<button type="button">마포구</button>
											<button type="button">서대문구</button>
											<button type="button">서초구</button>
											<button type="button">성동구</button>
											<button type="button">성북구</button>
											<button type="button">송파구</button>
											<button type="button">양천구</button>
											<button type="button">영등포구</button>
											<button type="button">용산구</button>
											<button type="button">은평구</button>
											<button type="button">종로구</button>
											<button type="button">중구</button>
											<button type="button">중랑구</button>
										</div>
										<div id="2">
											<button type="button">강서구</button>
											<button type="button">금정구</button>
											<button type="button">기장군</button>
											<button type="button">남구</button>
											<button type="button">동구</button>
											<button type="button">동래구</button>
											<button type="button">부산진구</button>
											<button type="button">북구</button>
											<button type="button">사상구</button>
											<button type="button">사하구</button>
											<button type="button">서구</button>
											<button type="button">수영구</button>
											<button type="button">연제구</button>
											<button type="button">영도구</button>
											<button type="button">중구</button>
											<button type="button">해운대구</button>
										</div>
									</div>
								</div>
								<div class="btn-wrap">
									<a class="address-setting" href="#"><span>설정</span></a>
								</div>
							</div>
						</div>
					</div>
					<div class="crewboard">
						<div class="crew-sort">
							<input type="button" class="crew-sort" id="oneday" value="원데이 크루">
							<input type="button" class="crew-sort" id="longday"
								value="롱데이 크루">
						</div>
						<select>
							<option value="latest" selected>최신순</option>
							<option value="popular">인기순</option>
							<option value="date">날짜순</option>
						</select>
					</div>
					<div class="crew-card">
					<!-- 게시물 반복 출력 -->
					
					<c:forEach items="<%=boardList%>" var="board">
						<div class="card">
							<img class="card-img" src="./resources/images/card1.jpg" alt="">
							<div class="card-title">${board.created}</div>
							<div class="card-contents"> ${board.content}</div>
						</div>
					</c:forEach>
					<input type="hidden" name="crewName" value="<%=crewName%>"/>
					
						
						<!-- 페이지 처리 -->
						<div id="pagination">
							<c:set var="pageNum" value="<%=pageNum%>"/>
							<div>
								<c:forEach var="i" begin="1" end="<%=blockSize%>">
									<c:url value="/board.jsp" var="url"/>
									<c:choose>
										<c:when test="${pageNum==i}">
											<a style="text-decoration: none;" href="${url}?pageNum=${i}&crewName=${crewName}"><font color='black'>${i}</font></a>
										</c:when>
										<c:otherwise>
											<a style="text-decoration: none;" href="${url}?pageNum=${i}&crewName=${crewName}"><font color='gray'>${i}</font></a>
										</c:otherwise>
									</c:choose>	
								</c:forEach>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="footer.jsp"%>

</body>
</html>
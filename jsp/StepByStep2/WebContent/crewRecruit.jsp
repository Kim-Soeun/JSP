<%@page import="model.LongCrewRecruitDTO"%>
<%@page import="model.LongCrewDAO"%>
<%@page import="model.CrewRecruitDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.CrewRecruitDAO"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="loginCheck.jsp" %>
<%
	String UserId = (String)session.getAttribute("userId");

	// 모든 단기 크루명 가져오기
	CrewRecruitDAO dao = new CrewRecruitDAO();
	List<CrewRecruitDTO> cNameList = dao.selectCrewName();
	
	// 모든 장기 크루명 가져오기
	LongCrewDAO dao2 = new LongCrewDAO();
	List<LongCrewRecruitDTO> cNameList2 = dao2.selectLongCrewName();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>단기크루 등록</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#selectButton").click(function() {
                // 새 창 열기
                var newWindow = window.open("firstpage2.jsp", "_blank");

            });

            // 선택 정보 받기
            window.addEventListener("message", function(event) {
                if (event.data) {
                    // 선택된 데이터를 특정 위치에 출력
                    $("#selectedId").val(event.data.id);
                     $("#selectedName").val(event.data.name);
                }
            });
        });
    </script>

</head>
<body>

	<!-- 크루명 중복검사로 같은 크루명 만들어지지 않음 -->
	<form action="./crewRecruit.crew" method="post" name="frm" onsubmit="return isResult()">
		
		<div id="existingCrews" style="display: none;"><c:forEach items="<%=cNameList%>" var="crew">${crew.crewName} </c:forEach></div>
		<div id="existingLongCrews" style="display: none;"><c:forEach items="<%=cNameList2%>" var="longCrew">${longCrew.crewName} </c:forEach></div>
		
		<label>크루명</label>
		<input type="text" id="crewName" name="crewName" required>
		<button type="button" onclick="crewNameCheck()">중복확인</button>
		<div id="warningMessageContainer"></div>
		

		<label>제목</label>
		<input type="text" name="title" required><br>
		
		<label>조건(내용)</label>
		<input type="text" name="content" placeholder="#24~28 여자만, #월 3회 참석 의무" required><br>
		
		<label>장소</label>
		<input type="text" name="location" required><br>
		
		<label>모집인원</label>
		<input type="text" name="memberNum" required><br>
		
		<label>모임날짜</label>
		<input type="text" name="gatherDate" required><br>

		<!-- 실제로는 코스선택 클릭 시 명우씨가 만든 페이지로 이동해서 코스 선택함 -->
		
		<input type="hidden" id="selectedId">
        <label for="selectedId">선택된 코스 명:</label>
        <input type="text" id="selectedName" name="courseId" readonly>
        <button type="button" id="selectButton">코스 선택</button><br>

		<input type="hidden" name="adminId" value="<%=UserId%>">

		<button type="submit">등록</button>
	</form>
	
<script type="text/javascript" src="./resources/js/crew.js"></script>

</body>
</html>
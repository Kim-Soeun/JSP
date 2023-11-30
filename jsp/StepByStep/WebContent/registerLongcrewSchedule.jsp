<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String crewName = request.getParameter("crewName");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특정 장기크루의 일정 등록하기</title>
</head>
<body>

	<form action="./registerSchedule.long" method="post" name="frm">
		
		
		<input type="hidden" name="crewName" value="<%=crewName%>">
		<!-- 장기크루 일정 등록할 때는 adminId가 작성자 아이디임 -->
		<input type="hidden" name="adminId" value="${userId}"> 
		
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

		
		

		<button type="submit">등록</button>
	</form>
	


</body>
</html>
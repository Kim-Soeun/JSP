<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String popupMode = "on";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/cookie.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>

// 닫기 버튼 클릭시 팝업창 사라짐 설정

	$(function() {
		$("#closeBtn").click(function() {
		// 닫기 버튼(id = "closeBtn")을 누르면
		
			$("#popup").hide();
			// 팝업창(id="popup")을 숨김 처리함
		});
	});
	
</script>
</head>
<body>
	<%
		for(int i=1; i<=10; i++) {
			out.print("현재 팝업창은 " + popupMode + "상태입니다. <br>");  
		}
		if(popupMode.equals("on")) {
			
	%>
	<div id="popup">
		<h2 align="center"> 공지사항 팝업입니다 </h2>
		<div align="right">
			<form name="popFrm">
				<input type="checkbox" id="inactiveToday" value="1">
				하루 동안 열지 않음
				<input type="button" value="닫기" id="closeBtn">
			</form>
		</div>
	</div>
	<% } %>
</body>
</html>
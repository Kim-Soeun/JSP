<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간</title>
<script src="../resources/js/jquery_1.12.4_jquery.min.js"></script>
<script>
	$(function() {
		function getClock() {
			var date = new Date();
			var today = date.toLocaleTimeString();
			// date.toLocaleTimeString : 사용자의 문화권에 맞는 시간표기법으로 시간을 리턴
			$("#clock").text(today);
		}
		getClock();
		setInterval(getClock,1000);
		// 함수를 1초마다 주기적으로 호출, 1초마다 시간 업데이트됨
	});
</script>
</head>
<body>
	<h1 id="clock"></h1>
	
</body>
</html>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	String greeting = "쇼핑몰 방문을 환영합니다";
	String tagline = "자바 쇼핑몰에 어서오세요";
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="./welcome.jsp">홈</a>
				<!-- href="./welcome.jsp : 클릭하면 "welcome.jsp"파일로 돌아감 -->
				<!-- ./ : 이 표현은 현재 파일에서 상위 폴더로 넘어가 welcome 파일을 찾는 것을 의미
				          그냥 파일명(welcome.jsp)만 적으면 다른 폴더에 있는 파일을 찾지 못함 -->
			</div>
		</div>
	</nav>
	
	
	<div class="jumbotron">
	<!-- 회색배경 -->
		<div class="container">
		<!-- 네모 박스 설정 -->
			<h1 class="display-3">
				<%=greeting %>
			</h1>
		</div>
	</div>
	
	
	<div class="container">
		<div class="text-center">
		<!-- 가운데 맞춤 -->
			<h3>
				<%=tagline %>
			</h3>
			<%
				LocalDateTime today = LocalDateTime.now();
				String am_pm;
				int hour = today.getHour();
				int minute = today.getMinute();
				int second = today.getSecond();
				
				if(hour == 12) {			// 12시는 오후로 표시
					am_pm="오후";
				} else if(hour < 12) {		// 0~11시까지는 오전으로 표시
					am_pm="오전";
				} else {					// 나머지 13~23시까지는 시간에서 12를 빼기
					am_pm="오후";
					hour = hour - 12;
				}
				
				
				String time = am_pm + " " + hour + "시 " + minute + "분 " + second + "초";
				out.print(time);
			%>
		</div>
	</div>
	
	
	<footer class="container">
		<p>&copy; JSP쇼핑몰</p>
		<!-- &copy; : ©로 웹에 출력됨 -->
	</footer>
</body>
</html>
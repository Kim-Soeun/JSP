<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String travel = request.getParameter("travel");
		
		if(travel.equalsIgnoreCase("보라카이")) {
			response.sendRedirect("https://travel.naver.com/overseas/PHBOR294260/city/summary");
			// 페이지 이동
		} else if(travel.equalsIgnoreCase("세부")) {
			response.sendRedirect("https://travel.naver.com/overseas/PHCEB294261/city/summary");
		} else if(travel.equalsIgnoreCase("파리")) {
			response.sendRedirect("https://travel.naver.com/overseas/FRPAR187147/city/summary");
		} else if(travel.equalsIgnoreCase("런던")) {
			response.sendRedirect("https://travel.naver.com/overseas/GBLON186338/city/summary");
		}
	%>
</body>
</html>
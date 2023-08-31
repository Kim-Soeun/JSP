<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="er500.jsp"%> 
    <%-- 에러 페이지 지정 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int myAge = Integer.parseInt(request.getParameter("age")) + 10;   // 에러 발생
		// "age"라는 이름의 매개변수를 가져와서 정수로 변환
		//  10을 더하여 myAge 변수에 저장
		out.println("10년 후 당신의 나이는 " + myAge + "입니다."); 				  // 실행되지 않음
	%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 지시문 -->
    
<%!
	int count = 3;					 //  멤버 변수 선언
	String makeLower(String data) {	 // 메소드 선언(파라미터 1개, 리턴 O)
		return data.toLowerCase();	 // 파라미터 값 소문자로 변환
	}
%>
<!-- 선언부 : 메소드 선언 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		for(int i=1; i<=count; i++) {
			out.print("자바 서버 페이지 " + i + "<br>");
		}
	%>
	<!-- 스크립틀릿 : 자바 코드, 선언부에서 정의한 메소드 호출 --> 
	
	<%= makeLower("HELLO") %>
	<!-- 표현식 : 출력 -->
</body>
</html>
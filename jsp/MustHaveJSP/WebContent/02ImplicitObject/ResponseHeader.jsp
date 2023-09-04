<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
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
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		long add_date = s.parse(request.getParameter("add_date")).getTime();
		int add_int = Integer.parseInt(request.getParameter("add_int"));
		// 8282(문자열) -> 숫자(int)
		String add_str = request.getParameter("add_str");
		// 홍길동

		response.addDateHeader("myBirthday", add_date);
		response.addIntHeader("myNumber", add_int);		// 8282
		response.addIntHeader("myNumber", 1004);		// 1004
		// addIntHeader : 바로 위에 추가한 "myNumber"라는 동일한 헤더명으로 새로운 값을 추가
		response.addHeader("myName", add_str);			// 홍길동
		response.setHeader("myName", "안중근");			// 홍길동
		// setHeader : "myName"에 이전 값이 "안중근"으로 수정됨
	%>
	
	<h2> 응답 헤더 정보 출력하기 </h2>
	<%
		Collection<String> headerNames = response.getHeaderNames();
		// response.getHeaderNames() : 헤더 전체정보 보기
		for(String hName : headerNames) {
			String hValue = response.getHeader(hName);
	%>
		<li><%=hName%> : <%=hValue%> </li>
	<%
		}
	%>
	
	<h2> myNumber만 출력하기 </h2>
	<%
		Collection<String> myNumber = response.getHeaders("myNumber");
		// response.getHeaderNames : "myNumber" 헤더의 모든 값을 가져옴
		for(String myNum : myNumber) {
	%>
		<li>myNumber : <%=myNum %> </li>
	<%
		}
	%>		
</body>
</html>
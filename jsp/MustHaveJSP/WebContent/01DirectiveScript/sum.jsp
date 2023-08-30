<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	int sum=0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 변수는 위쪽에 선언 -->

	<%
		for(int i=1; i<=100; i++) {
			sum += i;
		}
		out.println("합계 : " + sum);
	%>

</body>
</html>
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

	<!-- 1에서 100까지의 합계 구하기 -->
	<%
		for(int i=1; i<=100; i++) {
			sum += i;
		}
		out.println(sum);
		
	%>

</body>
</html>
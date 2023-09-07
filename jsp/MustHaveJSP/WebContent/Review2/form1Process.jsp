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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String[] hobby = request.getParameterValues("hobby");
		
		String hobby2 ="";
		for(String h : hobby) {
			hobby2 += h + " "; 
		}
	%>
	<ul>
		<li> 아이디 : <%=id %></li>
		<li> 비밀번호 : <%=pw %></li>
		<li> 이름 : <%=name %></li>
		<li> 성별 : <%=gender %></li>
		<li> 취미 : <%=hobby2 %></li>
	</ul>
</body>
</html>
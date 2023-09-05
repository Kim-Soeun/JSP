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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(id.equalsIgnoreCase("jsp")) {
			if(pw.equalsIgnoreCase("1234")) {
				out.print("환영합니다");
			} else {
				out.print("비밀번호가 틀립니다");
			}
		} else {
			out.print("사용할 수 없는 아이디입니다");
		}
	%>
</body>
</html>
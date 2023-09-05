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
		String pw = request.getParameter("pw");
	
		if(pw.equals("1234")) {
			response.sendRedirect("result.jsp");
			// response.sendRedirect : 그냥 페이지 이동
		} else {
			request.getRequestDispatcher("exam1.jsp?Error=1").forward(request, response);
			// request.getRequestDispatcher : 변수와 값 가지고 페이지 이동
		}
	%>
</body>
</html>
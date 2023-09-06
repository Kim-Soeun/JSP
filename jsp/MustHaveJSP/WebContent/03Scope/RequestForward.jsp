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
		String name = request.getParameter("name");
		out.print(name);
		
		request.getRequestDispatcher("RequestForward2.jsp?name="+name).forward(request, response);
	%>
	
	
</body>
</html>
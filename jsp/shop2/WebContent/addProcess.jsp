<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		MemberDAO dao = new MemberDAO();
		String sql = "select * from member";
		PreparedStatement psmt = dao.con.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		
		String result = "";
		while(rs.next()) {
			String id2 = rs.getString(1);

			if(id2.equals(id)) {
				request.getRequestDispatcher("addMember.jsp?error=1").forward(request, response);
				break;
			}
		} 
		dao.addMember(id, name, pw, phone, address);
		result = "회원가입을 환영합니다";
		dao.close();
		
		
	
	%>
	
	
	<jsp:include page="menu.jsp"/>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>
	
	<div class="container">
		<h1 class="display-5"><%=result %></h1>
	</div>
	
	<%@include file="footer.jsp" %>
	
</body>
</html>
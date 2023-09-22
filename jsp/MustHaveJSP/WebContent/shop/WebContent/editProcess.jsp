<%@page import="dto.MemberDTO"%>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	<%
		String id_ = (String)session.getAttribute("UserId");
		String pw_ = (String)session.getAttribute("UserPw");
		MemberDTO dto = new MemberDAO().getMemberDTO(id_, pw_);
	
		request.setCharacterEncoding("utf-8");
		
		String pw;
		if (request.getParameter("pw") == null){
			pw = pw_;
		} else {
			pw = request.getParameter("pw");
		}
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		MemberDAO dao = new MemberDAO();
		
		String edit = dao.editMember(pw, phone, address, id_);
		dao.close();
	
	%>

	<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 정보 수정</h1>
		</div>
	</div>
	
	<div class="container">
		<h1 class="display-5"><%= edit %></h1>
	</div>
	
	<%@ include file="footer.jsp" %>
</body>
</html>
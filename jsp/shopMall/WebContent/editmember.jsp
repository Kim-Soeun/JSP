<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원정보수정</h1>
		</div>
	</div>
	
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
	
	<%
		String id = (String)session.getAttribute("UserId");
		String pw = (String)session.getAttribute("UserPw");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberDTO(id, pw);
		dao.close();
	%>	
	
		<div class="container" align="center">
			<div class="row">
				<div class="col-md-5">
					<img src="Uploads/<%=dto.getPhotoimage()%>" style="width: 300px;">
				</div>
			</div>
		</div>
		
		<form class="form-signin" action="editProcess.jsp" method="post">
		<div class="form-group">
			<label for="inputId" class="sr-only">아이디 </label>
			<input type="text" class="form-control" 
			name="id" readonly value="<%=id %>(아이디)"> <br>
		</div>
		<div class="form-group">
			<label for="inputPassword" class="sr-only">비밀번호 </label>
			<input type="password" class="form-control" 
			name="pw" required autofocus placeholder="비밀번호"> <br>
		</div>

		<div class="form-group">
			<label for="inputPhone" class="sr-only">연락처 </label>
			<input type="text" class="form-control"
			name="phone" required placeholder="연락처"> <br>
		</div>

		<div class="form-group">
			<label for="inputAddress" class="sr-only">주소 </label>
			<input type="text" class="form-control" 
			name="address" required placeholder="주소" > <br>
			<button class="btn btn-log btn-success btn-block" type="submit">수정</button>
		</div>
		</form>
		
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>
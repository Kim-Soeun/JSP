<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		// 사용자가 입력한 데이터를 가져옴(아이디, 패스워드)
		
		MemberDAO dao = new MemberDAO();  // mysql 데이터베이스 연결 
		MemberDTO dto = dao.getMemberDTO(id, pw);
		// 사용자가 입력한 데이터가 mysql에 있으면 dto에 해당 정보가 삽입됨
		// 사용자가 입력한 데이터가 mysql에 없으면 dto에 객체는 비어있음
		
		dao.close();
		
		String result = "";
		if(dto.getId() != null) {
			session.setAttribute("UserId", dto.getId());
			session.setAttribute("UserPw", dto.getPw());
			session.setAttribute("UserName", dto.getName());
			result = dto.getName() + "님 환영합니다";
		} else {
			request.getRequestDispatcher("login.jsp?error=1").forward(request, response);
		}
		dao.close();
		
		
		
		
		// java dao. dto 파일 만들지 않고 여기서 아이디, 비번 바로 일치 확인
		/* JDBConnect jdbc = new JDBConnect();
		String sql = "select * from member";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		ResultSet rs = psmt.executeQuery();
		// executeQuery() : select 구문 수행할 때 사용하는 함수
		//                  ResultSet 객체의 값을 반환
		// executeUpdate() : insert, delete, update 구문에서 반영된 레코드 건수 반환(int 타입)
		// 					 create, drop 은 -1을 반환
		
		String result = "";
		while(rs.next()) {
			String id2 = rs.getString(1);
			String name = rs.getString(2);
			String pw2 = rs.getString(3);
			
			if(id.equals(id2) && pw.equals(pw2)) {
				result = name + "님 환영합니다";
				session.setAttribute("user_id", id2);
				session.setAttribute("user_name", name);
				break;
			}
		}
		
		if(result == "") {
			request.getRequestDispatcher("login.jsp?error=1").forward(request, response);
		}
		jdbc.close(); */
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="menu.jsp" />
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인 처리</h1>
		</div>
	</div>
	
	<div class="container">
		<h1 class="display-5"><%= result %></h1>
		<a href="welcome.jsp" class="btn btn-secondary"> 돌아가기 </a>
	</div>
</body>
</html>
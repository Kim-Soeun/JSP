<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
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
		
		JDBConnect jdbc = new JDBConnect();
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
				response.sendRedirect("welcome.jsp");
				break;
			}
		}
		
		if(result == "") {
			request.getRequestDispatcher("login.jsp?error=1").forward(request, response);
		}
		jdbc.close();
		
	%>
</body>
</html>
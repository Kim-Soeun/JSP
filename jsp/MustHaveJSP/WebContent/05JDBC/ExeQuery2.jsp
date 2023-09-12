<%@page import="common.JDBConnect2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 회원 목록 조회 테스트 </h2>
	<%
		// 정적 쿼리문으로 회원 조회
		JDBConnect2 jdbc = new JDBConnect2();	// DB 접속
		String sql = "select * from member";
		
		jdbc.stmt = jdbc.con.createStatement();
		
		jdbc.rs = jdbc.stmt.executeQuery(sql);
		
		while(jdbc.rs.next()) {
			String id = jdbc.rs.getString(1);
			String pw = jdbc.rs.getString(2);
			String name = jdbc.rs.getString(3);
			java.sql.Date regidate = jdbc.rs.getDate(4);
			
			out.print(id + " " +  pw + " " +  name + " " + regidate + "<br>");
		}
		jdbc.close();
	%>
</body>
</html>
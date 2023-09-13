<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			String url = "jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=utf8";
			String id = "manager";
			String pw = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url,id,pw);
			
			String sql = "select * from student where s_name like '홍%'";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			// ResultSet rs :  위의 조건에 맞는 조회 결과 집합을 담음
			
			while(rs.next()) {
			// next() : ResultSet 객체에서 다음 행(레코드) 반환
				String s_name = rs.getString(1);
				String s_id = rs.getString(2);
				String s_tel = rs.getString(3);
				String s_address = rs.getString(4);
				
				out.print(s_name + " " + s_id + " " + s_tel + " " + s_address);
			}
		} catch(Exception e) {
			out.print("데이터베이스 연결이 실패했습니다");
		} finally {
			if( rs != null ) rs.close();
			if( stmt != null ) stmt.close();
			if( con != null ) con.close();
			
		}
	%>
</body>
</html>
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
	<h2> 회원 추가 테스트 </h2>
	<%
	
		// 동적 쿼리문으로 회원 추가
		// DB에 연결
		JDBConnect jdbc = new JDBConnect();
		
		// 테스트용 입력값 준비
		String id = "test1";
		String pass = "1111";
		String name = "테스트1회원";
		
		// 쿼리문 생성
		String sql = "insert into member values (?,?,?,sysdate)";
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		// 동적 쿼리문 생성하여 sql문을 생성함
		psmt.setString(1, id);
		psmt.setString(2, pass);
		psmt.setString(3, name);
		
		// 쿼리 수행
		int inResult = psmt.executeUpdate();
		// executeUpdate : update의 실행 결과는 숫자가 나옴(몇 줄이 바뀌었는지)
		out.print(inResult + "행이 입력되었습니다");
		
		// 연결 닫기
		jdbc.close();
	%>
</body>
</html>
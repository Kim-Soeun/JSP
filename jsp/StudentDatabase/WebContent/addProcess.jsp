<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.OracleConnect"%>
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
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
		// 오라클 DB에 연결
		OracleConnect oc = new OracleConnect(); 
		
		String sql = "insert into student values (?,?,?)";
		// (?,?,?) : 인파라미터, 정확한 값을 나중에 채워주겠다는 뜻
				
		PreparedStatement psmt = oc.con.prepareStatement(sql);
		// 문자열로 동적 쿼리문을 생성
		// Connection 객체 통해 PreparedStatement 객체 생성
		// 미완의 sql문 인수로 제공
		// PreparedStatement : 인파라미터가 있는 동적 쿼리를 처리할 때 사용
		
		psmt.setString(1, name);
		// 인파라미터들에 실제 값 대입
		// 1 : 인파라미터의 순서, name : 대입되는 값
		psmt.setString(2, id);
		psmt.setString(3, pw);
		// 쿼리를 실행
		int result = psmt.executeUpdate();		
		// executeUpdate : insert, update, delete 쿼리문 실행할 때 사용
		// 실행 후 영향 받은 행의 개수가 int 형으로 반환(ex. insert되어진 행의 개수(1개))
		
		
		if(result == 1) {
			out.print("정상 처리 되었습니다");
		} else {
			out.print("회원 추가에 문제가 발생했습니다");
		}
		oc.close();
	%>
</body>
</html>
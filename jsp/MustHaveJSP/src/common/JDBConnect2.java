package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.jsp.JspWriter;

public class JDBConnect2 {

	public Connection con; // 데이터베이스와의 연결
	public Statement stmt; // 정적 쿼리문 사용
	public PreparedStatement psmt; // 동적 쿼리문 사용
	public ResultSet rs; // 쿼리 실행 결과 저장

	public JDBConnect2() {
		try {
			// JDBC 드라이버에 로드(오라클 데이터 모두 import 함)
			Class.forName("com.mysql.jdbc.Driver");
			// com.mysql.jdbc.Driver mysql 드라이버 이름

			// DB에 연결
			String url = "jdbc:mysql://localhost:3306/gesipan"; // db 접속 주소
			String id = "manager"; // 사용자 계정 아이디
			String pwd = "1234"; // 계정 비밀번호
			con = DriverManager.getConnection(url, id, pwd);
			// 상단 정보로 db에 연결

			System.out.println("데이터 베이스 연결 성공");

		} catch (Exception e) {
			System.out.println("데이터 베이스 연결 오류입니다");
			e.printStackTrace();
		}

	}
	
	
	
	public JDBConnect2(String driver, String url, String id, String pwd, JspWriter out) {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);
			out.print("<h1>mysql 2번째 데이터베이스 연결 성공</h1>");
			
		} catch(Exception e) {
			System.out.println("2번째 데이터베이스 연결 오류입니다");
			e.printStackTrace();
		}
	}
	

	// 연결 해제 (자원 반납)
	public void close() {
		
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (con != null) con.close();
			System.out.println("자원 해제");
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

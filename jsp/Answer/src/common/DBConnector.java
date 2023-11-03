package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


public class DBConnector {

	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public DBConnector() {
		try {
			// JDBC 드라이버에 로드(오라클 데이터 모두 import 함)
			Class.forName("com.mysql.jdbc.Driver");
			// com.mysql.jdbc.Driver mysql 드라이버 이름

			// DB에 연결
			String url = "jdbc:mysql://localhost:3306/cyworld"; // db 접속 주소
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

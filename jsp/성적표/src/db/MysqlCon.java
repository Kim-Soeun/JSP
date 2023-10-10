package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

// mysql 데이터베이스 접속 -> 종료
public class MysqlCon {
	
	// 데이터베이스에 접속하기 위한 멤버변수
	public Connection con;				// 데이터베이스 연결
	public PreparedStatement psmt; 		// 동적 쿼리문
	public Statement stmt; 				// 정적 쿼리문
	public ResultSet rs;				// 쿼리 결과 저장
	
	
	// 기본 생성자
	public MysqlCon() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/studentex?useUnicode=true&characterEncoding=utf8&useSSL=false"; // mysql  드라이버 로딩
			String id = "manager";							    
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
			
			System.out.println("데이터베이스 연결 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 연결 실패");
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(stmt != null) stmt.close();
			if(con != null) con.close();
			
			System.out.println("데이터베이스 해제 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 해제 실패");
		}
	}
	
}

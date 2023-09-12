package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OracleConnect {
	
	// <커넥션 풀>
	// 사용자가 요청할 때마다 드라이버를 로드하고 객체 생성하여 연결, 종료하는
	// 비효율성을 없애기 위해 커넥션 풀 사용
	
	public Connection con;			// DB에 접속
	public PreparedStatement psmt;  // 동적 쿼리 사용
	public ResultSet rs;			// 쿼리 실행 결과
	
	public OracleConnect() {		// 기본 생성자
		try {
			Class.forName("oracle.jdbc.OracleDriver");  	   // 오라클 드라이버 연결
			// Class.forName("com.mysql.jdbc.Driver");   	   // mysql 드라이버 연결
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "manager";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);   // 오라클 데이터베이스 연결
		} catch(Exception e) {
			System.out.println("DB 연결 실패");
		}
	}
	
	
	public void close() {					// DB 작업을 모두 마치면 자원 절약 위해 연결 해제 
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
			System.out.println("연결 해제 성공");
				
		} catch(Exception e) {
			System.out.println("연결 해제 실패");
		}
	}
	
}

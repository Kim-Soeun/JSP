package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.print.attribute.PrintServiceAttribute;
import javax.print.attribute.standard.PrinterState;

public class MysqlDB {

	public Connection con;
	public PreparedStatement psmt;
	public Statement stmt;
	public ResultSet rs;

	public MysqlDB() {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/mvctest?useUnicode=true&characterEncoding=utf-8&useSSL=false";
			String id = "manager";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);

			System.out.println("DB 연결 성공");
		} catch (Exception e) {
			System.out.println("DB 연결 실패");
			e.printStackTrace();
		}
	}

	
	public void close() {

		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (con != null) con.close();
			System.out.println("데이터베이스 해제 성공");
			
		} catch (Exception e) {
			System.out.println("데이터베이스 해제 실패");
			e.printStackTrace();
		}
	}

}

package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.jsp.JspWriter;

public class MysqlConnect {
	
	public Connection con;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = "<script> "
					+ "alert('" + msg + "'); "
					+ "location.href='" + url +"';" 
					+ "</script>";
			out.println(script);
		} catch(Exception e) {}
	}

	public MysqlConnect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=utf8";
			String id = "manager";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
		} catch(Exception e) {
			System.out.println("데이터베이스 연결 실패");
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
			System.out.println("자원 해제 성공");
		} catch (Exception e) {
			System.out.println("자원 해제 실패");
		}
	}
	
}

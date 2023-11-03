package model;

import java.sql.SQLException;

import common.DBConnector;

public class memberDAO extends DBConnector {
	
	public memberDAO() {
		super();
	}
	
	// 회원가입
	public int CreateMember(member cyMember) throws ClassNotFoundException {
		String INSERT_MEMBER_SQL = "insert into Member (id, password, email, phone, isAdmin, imgName) values "
									+ "(?, ?, ?, ?, ?, ?)";
		
		int result = 0;
		
		try {
			psmt = con.prepareStatement(INSERT_MEMBER_SQL);
			psmt.setString(1, cyMember.getId());
			psmt.setString(2, cyMember.getPassword());
			psmt.setString(3, cyMember.getEmail());
			psmt.setString(4, cyMember.getPhone());
			psmt.setString(5, cyMember.getIsAdmin());
			psmt.setString(6, cyMember.getImgName());
			
			result = psmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	// 같은 아이디 중복 체크
	public int CheckDuplicateId(String id) throws SQLException {
		String GET_MEMBER_SQL = "select id from member where id = ?";
		
		int result = 0;
		
		
		try {
			psmt = con.prepareStatement(GET_MEMBER_SQL);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			} else {
				result = 0;
			}

		} catch(Exception e) {
			
		}
		 
		 
		return result;
	}
	
	// 아이디 패스워드 일치 여부
	public int LoginCheck(String id, String pw) {
		int result = 0;
		String ID_CHECK_SQL = "select id, password from member where id=? and password=?";
		
		try {
			psmt = con.prepareStatement(ID_CHECK_SQL);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
			
			System.out.println("아이디, 비번 확인 성공");
		} catch(Exception e) {
			System.out.println("아이디, 비번 확인 실패");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	// 아이디로 회원 정보 얻기
	public member GetMember(String id) {
		member cyMember = new member();
		String GET_MEMBER_SQL = "select * from member where id=?";
		
		try {
			psmt = con.prepareStatement(GET_MEMBER_SQL);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				cyMember.setId(rs.getString("id"));
				cyMember.setPassword(rs.getString("password"));
				cyMember.setPhone(rs.getString("phone"));
				cyMember.setEmail(rs.getString("email"));
				cyMember.setIsAdmin(rs.getString("isAdmin"));
				cyMember.setImgName(rs.getString("imgName"));
			}
			
			System.out.println("GetMember 성공");
		} catch(Exception e) {
			System.out.println("GetMember 실패");
		}
		return cyMember;
	}
	
}
	
	
	

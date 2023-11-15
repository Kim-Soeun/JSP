package model;

import common.DBConnector;

public class memberDAO extends DBConnector {
	
	public memberDAO() {
		super();
	}
	
	
	// 아이디, 비밀번호 일치여부 확인
	public int LoginCheck(String id, String pw) {
		int result = 0;

		String LOGIN_CHECK_SQL = "select id, password from member where id=? and password=?";
		
		try {
			psmt = con.prepareStatement(LOGIN_CHECK_SQL);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
			
			System.out.println("LoginCheck 성공");
			
		} catch(Exception e) {
			System.out.println("LoginCheck 실패");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	// 일치하는 아이디 있는지 확인
	public int CheckDuplicateId(String id) {
		int result = 0;
		
		String CHECK_ID_SQL = "select id from member where id=?";
		
		try {
			psmt = con.prepareStatement(CHECK_ID_SQL);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
			
			System.out.println("CheckDuplicateId 성공");

		} catch(Exception e) {
			System.out.println("CheckDuplicateId 실패");
			e.printStackTrace();
			
		}
		
		return result;
	}
	
	// 회원가입
	public int RegisterMember(memberDTO dto) {
		int result = 0;
		String INSERT_MEMBER_SQL = "insert into member(id, password, name) values (?, ? ,?)";
		
		try {
			psmt = con.prepareStatement(INSERT_MEMBER_SQL);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPassword());
			psmt.setString(3, dto.getName());
			result = psmt.executeUpdate();
			
			System.out.println("RegisterMember 성공");
			
		} catch (Exception e) {
			
			System.out.println("RegisterMember 실패");
			e.printStackTrace();
		}
		
		return result;
	}
	

}

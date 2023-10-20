package dao;

import common.MysqlDB;
import dto.MembershipDTO;

public class MembershipDAO extends MysqlDB {

	public MembershipDAO() {
		super();
	}

	// 입력한 아이디, 비밀번호로 정보 추출 
	public MembershipDTO loginCheck(String id, String pw) {
		MembershipDTO dto = new MembershipDTO();
		String query = "select * from membership where id=? and pw=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPw(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setGender(rs.getString(4));
				dto.setBirth(rs.getString(5));
				dto.setEmail(rs.getString(6));
				dto.setPhone(rs.getString(7));
				dto.setAddress(rs.getString(8));
				dto.setJoinDate(rs.getString(9));
			}
			
			System.out.println("입력한 아이디 정보 추출 성공");
		} catch (Exception e) {
			System.out.println("입력한 아이디 정보 추출 실패");
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	// 회원탈퇴
	public int delete(String id, String pw) {
		int result = 0;
		
		String sql = "delete from membership where id=? and pw=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			result = psmt.executeUpdate();
			
			System.out.println("회원탈퇴 성공");
		} catch(Exception e) {
			System.out.println("회원탈퇴 실패");
			e.printStackTrace();
		}
		
		return result;
	}
	
	
}

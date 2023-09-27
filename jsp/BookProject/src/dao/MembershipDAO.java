package dao;

import common.JDBConnect;
import dto.MembershipDTO;

public class MembershipDAO extends JDBConnect {

	public MembershipDAO() {
		super();
	}
	
	public MembershipDTO selectMember(String id, String pw) {
		MembershipDTO dto = new MembershipDTO();
		
		String query = "select * from membership where memberid=? and memberpw=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setMemberid(rs.getString(1));
				dto.setMemberpw(rs.getString(2));
				dto.setMembername(rs.getString(3));
				dto.setMemberaddress(rs.getString(4));
				dto.setMembertel(rs.getString(5));
			}
			System.out.println("정보 추출 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("정보 추출 실패");
		}
		
		return dto;
	}
	
	
	public int insertMember(String id, String pw, String name, String address, String tel) {
		int result = 0;
		
		String sql = "insert into membership values (?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, name);
			psmt.setString(4, address);
			psmt.setString(5, tel);
			result = psmt.executeUpdate();
			
			System.out.println("회원가입 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원가입 실패");
		}
		
		return result;
	}
	
	
	public int deleteMember(String id, String pw) {
		int result = 0;
		
		String sql = "delete from membership where memberid=? and memberpw=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			result = psmt.executeUpdate();
			
			System.out.println("회원탈퇴 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원탈퇴 실패");
		}
		
		return result;
	}
		
}

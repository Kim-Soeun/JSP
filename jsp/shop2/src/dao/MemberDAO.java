package dao;

import common.JDBConnect;
import dto.MemberDTO;

public class MemberDAO extends JDBConnect {
	
	public MemberDAO() {
		super();
	}
	
	public MemberDTO getMemberDTO(String id, String pw) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=? and pw=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setPw(rs.getString(3));
				dto.setPhone(rs.getString(4));
				dto.setAddress(rs.getString(5));
			}
		} catch(Exception e) {
			System.out.println("실패");
		}	return dto;
	}
	
	
	public void addMember(String id, String name, String pw, String phone, String address) {
		String sql = "insert into member values (?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, name);
			psmt.setString(3, pw);
			psmt.setString(4, phone);
			psmt.setString(5, address);
			psmt.executeUpdate();
			System.out.println("회원 가입 성공");

		} catch(Exception e) {
			System.out.println("회원 가입 실패");
		}
	}
	
	
	public String editMember(String pw, String phone, String address, String id) {
		String query = "update member set pw=?, phone=?, address=? where id=?";
		String result = "";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, pw);
			psmt.setString(2, phone);
			psmt.setString(3, address);
			psmt.setString(4, id);
			psmt.executeUpdate();

		} catch(Exception e) {
			e.printStackTrace();
			result = "회원정보 수정을 실패했습니다";
			System.out.println("회원정보 수정 실패");
		}
		return result;
	}
	
	
}

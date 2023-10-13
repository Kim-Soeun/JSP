package dao;

import common.JDBConnect;
import dto.MemberDTO;

public class MemberDAO extends JDBConnect {
		
	public MemberDAO() {
		super();
	}
	
	
	public MemberDTO getMemberDTO(String uid, String upw) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=? and pw=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setPw(rs.getString(3));
				dto.setPhone(rs.getString(4));
				dto.setAddress(rs.getString(5));
				dto.setPhotoimage(rs.getString(6));
			}
			
		} catch(Exception e) {
			System.out.println("실패");
		}
		return dto;
	}
	
	public void addMember(String id, String name, String pw, String phone, String address, String photoimage) {
		String sql = "insert into member values(?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, name);
			psmt.setString(3, pw);
			psmt.setString(4, phone);
			psmt.setString(5, address);
			psmt.setString(6, photoimage);
			psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("회원가입 실패");
		}
	}
	
	
	public String deleteMember(String id, String pw) {
		String query = "select * from member where id=?";
		String result="";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String pw2 = rs.getString(3);
				
				if(pw2.equals(pw)) {
					result = "회원탈퇴 성공";
					String query2 = "delete from member where id=?";
					psmt = con.prepareStatement(query2);
					psmt.setString(1, id);
					psmt.executeUpdate();
					break;
				}
			}
		} catch(Exception e) {
			System.out.println("회원탈퇴 실패");
		}
		return result;
	} 
	
	
	public String editMember(String pw, String phone, String address, String id) {
		String sql = "update member set pw=?, phone=?, address=? where id=?";
		String result = "";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pw);
			psmt.setString(2, phone);
			psmt.setString(3, address);
			psmt.setString(4, id);
			psmt.executeUpdate();
			result = "회원 정보가 수정되었습니다";
		} catch(Exception e) {
			System.out.println("회원 정보 수정 실패");
		}
		return result;
	}
	

}

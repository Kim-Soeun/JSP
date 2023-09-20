package dao;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	
	public MemberDAO() {
		super();
	}
	
	
	
	public String checkMember(String id) {
		String sql = "select id from member where id=?";
		String str = "";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String id2 = rs.getString(1);
				if(id2.equals(id)) {
					str = "기존회원";
					break;
				}
			}
			System.out.println("아이디 중복 점검 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("아이디 중복 점검 실패");
		}
		return str;
	}
	
	
	public void insertMember(String id, String pw, String name, String gender, String birth,
							String mail, String phone, String address, String registday) {
		
		String sql = "insert into member values (?,?,?,?,?,?,?,?,?)";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, name);
			psmt.setString(4, gender);
			psmt.setString(5, birth);
			psmt.setString(6, mail);
			psmt.setString(7, phone);
			psmt.setString(8, address);
			psmt.setString(9, registday);
			psmt.executeUpdate();
			System.out.println("회원가입 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원가입 실패");
		}
	}
	
	
	
}

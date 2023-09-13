package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	// DB에 연결 후 CRUD에 해당하는 SQL 쿼리문 실행, 얻어온 결과를 앞서 만든 DTO 객체에 담아 반환하는 클래스
	// JDBC 연결과 쿼리문 작성 등의 기능을 제공하는 JDBConnect 클래스를 상속받음
	// 따라서 이 클래스의 기본 생성자가 호출되면 DB 연결 완료

		public MemberDAO() {
			super();
		}
		
		public MemberDTO getMemberDTO(String uid, String upass) {
			MemberDTO dto = new MemberDTO();
			String query = "SELECT * FROM member WHERE id=? AND pass=?";
			
			try {
				// 쿼리실행
				psmt = con.prepareStatement(query);  // 동적 쿼리문 준비
				psmt.setString(1, uid); 			 // 쿼리문 첫번째 인파라미터에 값 설정
				psmt.setString(2, upass);			 // 쿼리문 두번째 인파라미터에 값 설정
				rs = psmt.executeQuery();			 // 쿼리문 실행
				
				// 결과처리
				if(rs.next()) {
					// 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
					dto.setId(rs.getString(1));
					dto.setPass(rs.getString(2));
					dto.setName(rs.getString(3));
					dto.setRegidate(rs.getString(4));
				}
			} catch(Exception e) {
				System.out.println("DB 연결 실패");
			}
			return dto;
		}
}

package model;

import common.DBConnector;

public class recommendDAO extends DBConnector {

	// 추천버튼 횟수 업데이트
	public int UpdateRecommendCount(int no, String id) {
		int result = 0;
		String UPDATE_RECOMMEND_SQL = "insert into recommend values (?, ?)";
		
		try {
			psmt = con.prepareStatement(UPDATE_RECOMMEND_SQL);
			psmt.setInt(1, no);
			psmt.setString(2, id);
			result = psmt.executeUpdate();
			
			System.out.println("UpdateRecommendCount 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("UpdateRecommendCount 실패");
		}
		
		
		return result;
	}
	
	// 게시물 추천버튼 총횟수 확인
	/*
	 * public int SelectRecommendCount(int no) { int result = 0; String
	 * SELECT_RECOMMENDCOUNT_SQL = "select count(*) from recommend where no=?";
	 * 
	 * try { psmt = con.prepareStatement(SELECT_RECOMMENDCOUNT_SQL); psmt.setInt(1,
	 * no); rs = psmt.executeQuery();
	 * 
	 * if(rs.next()) { result = rs.getInt(1); }
	 * 
	 * System.out.println("SelectRecommendCount 성공"); } catch(Exception e) {
	 * e.printStackTrace(); System.out.println("SelectRecommendCount 실패"); }
	 * 
	 * 
	 * return result; }
	 */
	
}

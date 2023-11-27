package model;

import common.DBConnector;

public class crewDAO extends DBConnector {

	// 크루 참여하기
	public void joinCrew(crewDTO dto) {
		int result = 0;
		String JOIN_CREW_SQL = "insert into crew values(?, ?, ?, ?)";
		
		try {
			psmt = con.prepareStatement(JOIN_CREW_SQL);
			psmt.setString(1, dto.getCrewName());
			psmt.setInt(2, dto.getMemberNum());
			psmt.setString(3, dto.getMemId());
			psmt.setBoolean(4, dto.isMemAdmin());
			result = psmt.executeUpdate();
			
			System.out.println("joinCrew 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("joinCrew 실패");
		}
	}
	
	
}
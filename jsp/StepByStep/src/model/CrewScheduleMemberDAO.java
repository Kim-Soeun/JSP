package model;

import common.DBConnector;

public class CrewScheduleMemberDAO extends DBConnector {

	// 크루 일정에 멤버 등록하기
	public void joinSchedule(CrewScheduleMemberDTO dto) {
		int result = 0;
		String JOIN_SCHEDULE = "insert into crewSchedule values(?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(JOIN_SCHEDULE);
			psmt.setInt(1, dto.getNo());
			psmt.setString(2, dto.getCrewName());
			psmt.setInt(3, dto.getMemberNum());
			psmt.setString(4, dto.getMemId());
			psmt.setBoolean(5, dto.isMemAdmin());
			result = psmt.executeUpdate();
			System.out.println("joinSchedule 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("joinSchedule 실패");
		}
		
	}
	
	
}

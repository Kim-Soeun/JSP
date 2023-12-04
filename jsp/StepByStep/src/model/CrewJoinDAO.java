package model;

import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.standard.JobHoldUntil;

import common.DBConnector;

public class CrewJoinDAO extends DBConnector {

	
	// 크루 참여신청하면 join 테이블에 데이터 들어감 -> 승인대기상태
	public void insertJoinInfo(CrewJoinDTO dto) {
		int result = 0;
		String INSERT_JOIN_INFO = "insert into crewJoin values(null, ?, ?, ?, null, ?)";
		
		try {
			psmt = con.prepareStatement(INSERT_JOIN_INFO);
			psmt.setString(1, dto.getCrewName());
			psmt.setString(2, dto.getMemId());
			psmt.setString(3, dto.getAdminId());
			psmt.setInt(4, dto.getMemberNum());
			result = psmt.executeUpdate();
			
			System.out.println("insertJoinInfo 성공");

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("insertJoinInfo 실패");
		}
	
	}
	
	
	// 특정 id의 승인현황 가져오기
	public List<CrewJoinDTO> selectCrewJoin(String memId) {
		List<CrewJoinDTO> joinList = new ArrayList<CrewJoinDTO>();
		String SELECT_CREW_JOIN = "select * from crewJoin where memId = ?";
		
		try {
			psmt = con.prepareStatement(SELECT_CREW_JOIN);
			psmt.setString(1, memId);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CrewJoinDTO dto = new CrewJoinDTO();
				dto.setNo(rs.getInt(1));
				dto.setCrewName(rs.getString(2));
				dto.setMemId(rs.getString(3));
				dto.setAdminId(rs.getString(4));
				dto.setCheck(rs.getBoolean(5));
				dto.setMemberNum(rs.getInt(6));
				joinList.add(dto);
			}
			System.out.println("selectCrewJoin 실패");

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectCrewJoin 실패");
		}
		
		return joinList;
	}
	
	
}

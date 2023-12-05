package model;

import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.standard.JobHoldUntil;

import common.DBConnector;

public class CrewJoinDAO extends DBConnector {

	
	// 크루 참여신청하면 join 테이블에 데이터 들어감 
	public void insertJoinInfo(CrewJoinDTO dto) {
		int result = 0;
		String INSERT_JOIN_INFO = "insert into crewJoin values(null, ?, ?, ?, ?, ?, ?)";
		
		try {
			psmt = con.prepareStatement(INSERT_JOIN_INFO);
			psmt.setString(1, dto.getCrewName());
			psmt.setString(2, dto.getMemId());
			psmt.setString(3, dto.getAdminId());
			psmt.setInt(4, dto.getIsCheck());
			psmt.setInt(5, dto.getMemberNum());
			psmt.setBoolean(6, dto.getIsShortCrew());
			result = psmt.executeUpdate();
			
			System.out.println("insertJoinInfo 성공");

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("insertJoinInfo 실패");
		}
	
	}
	
	
	// 특정 id의 승인현황 가져오기(단기크루)
	public List<CrewJoinDTO> selectCrewJoin(String memId) {
		List<CrewJoinDTO> joinList = new ArrayList<CrewJoinDTO>();
		String SELECT_CREW_JOIN = "select * from crewJoin where memId = ? and isShortCrew = true";
		
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
				dto.setIsCheck(rs.getInt(5));
				dto.setMemberNum(rs.getInt(6));
				dto.setIsShortCrew(rs.getBoolean(7));
				joinList.add(dto);
			}
			System.out.println("selectCrewJoin 성공");

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectCrewJoin 실패");
		}
		
		return joinList;
	}
	
	
	
	// 특정 id가 방장인 크루의 승인대기 리스트 모두 가져오기(단기크루)
	public List<CrewJoinDTO> selectJoinByAdmin(String adminId) {
		List<CrewJoinDTO> joinList = new ArrayList<CrewJoinDTO>();
		String SELECT_JOIN_BYADMIN = "select * from crewJoin where adminId = ? and isCheck = 1 and isShortCrew is true";
		
		try {
			psmt = con.prepareStatement(SELECT_JOIN_BYADMIN);
			psmt.setString(1, adminId);
			rs = psmt.executeQuery();
			while(rs.next()) {
				CrewJoinDTO dto = new CrewJoinDTO();
				dto.setNo(rs.getInt(1));
				dto.setCrewName(rs.getString(2));
				dto.setMemId(rs.getString(3));
				dto.setAdminId(rs.getString(4));
				dto.setIsCheck(rs.getInt(5));
				dto.setMemberNum(rs.getInt(6));
				dto.setIsShortCrew(rs.getBoolean(7));
				joinList.add(dto);
			}
			
			System.out.println("selectJoinByAdmin 성공");

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectJoinByAdmin 실패");
		}
		
		return joinList;
	}
	
	/*
	 * // 크루 참여신청하면 join 테이블에 데이터 들어감 -> 승인대기상태(장기크루) public void
	 * insertJoinInfo2(CrewJoinDTO dto) { int result = 0; String INSERT_JOIN_INFO =
	 * "insert into crewJoin values(null, ?, ?, ?, 1, ?, false)";
	 * 
	 * 
	 * try { psmt = con.prepareStatement(INSERT_JOIN_INFO); psmt.setString(1,
	 * dto.getCrewName()); psmt.setString(2, dto.getMemId()); psmt.setString(3,
	 * dto.getAdminId()); psmt.setInt(4, dto.getMemberNum()); result =
	 * psmt.executeUpdate();
	 * 
	 * System.out.println("insertJoinInfo2 성공");
	 * 
	 * } catch(Exception e) { e.printStackTrace();
	 * System.out.println("insertJoinInfo2 실패"); }
	 * 
	 * }
	 */
		
	// 특정 id의 승인현황 가져오기(장기크루)
	public List<CrewJoinDTO> selectLongCrewJoin(String memId) {
		List<CrewJoinDTO> joinList = new ArrayList<CrewJoinDTO>();
		String SELECT_CREW_JOIN = "select * from crewJoin where memId = ? and isShortCrew = false";
		
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
				dto.setIsCheck(rs.getInt(5));
				dto.setMemberNum(rs.getInt(6));
				dto.setIsShortCrew(rs.getBoolean(7));
				joinList.add(dto);
			}
			System.out.println("selectLongCrewJoin 성공");

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectLongCrewJoin 실패");
		}
		
		return joinList;
	}
		
	
	// 특정 id가 방장인 크루의 승인대기 리스트 모두 가져오기(장기크루)
	public List<CrewJoinDTO> selectJoinByAdmin2(String adminId) {
		List<CrewJoinDTO> joinList = new ArrayList<CrewJoinDTO>();
		String SELECT_JOIN_BYADMIN = "select * from crewJoin where adminId = ? and isCheck = 1 and isShortCrew is false";
		
		try {
			psmt = con.prepareStatement(SELECT_JOIN_BYADMIN);
			psmt.setString(1, adminId);
			rs = psmt.executeQuery();
			while(rs.next()) {
				CrewJoinDTO dto = new CrewJoinDTO();
				dto.setNo(rs.getInt(1));
				dto.setCrewName(rs.getString(2));
				dto.setMemId(rs.getString(3));
				dto.setAdminId(rs.getString(4));
				dto.setIsCheck(rs.getInt(5));
				dto.setMemberNum(rs.getInt(6));
				dto.setIsShortCrew(rs.getBoolean(7));
				joinList.add(dto);
			}
			
			System.out.println("selectJoinByAdmin2 성공");

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectJoinByAdmin2 실패");
		}
		
		return joinList;
	}
		
	

	
}

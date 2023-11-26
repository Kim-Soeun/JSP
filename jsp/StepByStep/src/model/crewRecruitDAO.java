package model;

import java.util.ArrayList;
import java.util.List;

import common.DBConnector;

public class crewRecruitDAO extends DBConnector {

	// 크루만들기
	public void makeCrew(crewRecruitDTO dto) {
		int result = 0;
		String MAKE_CREW_SQL = "insert into crewRecruit values(?,?,?,?,?,?,?,?)";

		try {
			psmt = con.prepareStatement(MAKE_CREW_SQL);
			psmt.setString(1, dto.getCrewName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getLocation());
			psmt.setInt(5, dto.getMemberNum());
			psmt.setString(6, dto.getCreated());
			psmt.setString(7, dto.getGatherDate());
			psmt.setString(8, dto.getAdminId());
			result = psmt.executeUpdate();
			
			System.out.println("makeCrew 성공");
		
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("makeCrew 실패");
		}
		
	}
	
	// 크루모집글 모두 불러오기(+현재 모집인원)
	public List<crewRecruitDTO> selectAllRecruit() {
		List<crewRecruitDTO> crewList = new ArrayList<crewRecruitDTO>();
		String SELECT_ALLRECRUIT_SQL = "select *, (select count(memId) from crew where crewName = crewRecruit.crewName)"
				+ " as totalCount from crewRecruit";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(SELECT_ALLRECRUIT_SQL);
			
			while(rs.next()) {
				crewRecruitDTO dto = new crewRecruitDTO();
				dto.setCrewName(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setLocation(rs.getString(4));
				dto.setMemberNum(rs.getInt(5));
				dto.setCreated(rs.getString(6));
				dto.setGatherDate(rs.getString(7));
				dto.setAdminId(rs.getString(8));
				dto.setTotalCount(rs.getInt(9));
				crewList.add(dto);
			}
			
			System.out.println("selectAllRecruit 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectAllRecruit 실패");
		}
		return crewList;
	}
	
	// 특정 크루 상세보기 불러오기
	public crewRecruitDTO selectRecruitDetail(String crewName) {
		crewRecruitDTO dto = new crewRecruitDTO();
		String SELECT_RECRUIT_DETAIL = "select *, (select count(memId) from crew where crewName = crewRecruit.crewName)"
				+ " as totalCount from crewRecruit where crewName = ?";
		
		try {
			psmt = con.prepareStatement(SELECT_RECRUIT_DETAIL);
			psmt.setString(1, crewName);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setCrewName(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setLocation(rs.getString(4));
				dto.setMemberNum(rs.getInt(5));
				dto.setCreated(rs.getString(6));
				dto.setGatherDate(rs.getString(7));
				dto.setAdminId(rs.getString(8));
				dto.setTotalCount(rs.getInt(9));
			}
			
			System.out.println("selectRecruitDetail 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectRecruitDetail 실패");
			System.out.println("selectRecruitDetail 실패");
		}
		return dto;
	}
	
	// 크루명 중복이름 확인
	public int checkCrewName(String crewName) {
		int result = 0;
		String CHECK_CREWNAME_SQL = "select crewName from crewRecruit where crewName = ?";
		
		try {
			psmt = con.prepareStatement(CHECK_CREWNAME_SQL);
			psmt.setString(1, crewName);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = 1;
			} else {
				result = 0;
			}
			
			System.out.println("checkCrewName 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("checkCrewName 실패");
		}
		
		return result;
	}
	
	// 기존 크루명 모두 가져오기
	public List<crewRecruitDTO> selectCrewName() {
		List<crewRecruitDTO> cNameList = new ArrayList<crewRecruitDTO>();
		String SELECT_CREWNAME = "select crewName from crewRecruit";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(SELECT_CREWNAME);
			 
			while(rs.next()) {
				crewRecruitDTO dto = new crewRecruitDTO();
				dto.setCrewName(rs.getString("crewName"));
				cNameList.add(dto);
			}
			
			System.out.println("selectCrewName 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectCrewName 실패");
		}
		
		return cNameList;
	}
	
}

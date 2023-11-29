package model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import common.DBConnector;

public class CrewRecruitDAO extends DBConnector {

	// 단기크루만들기
	public void makeCrew(CrewRecruitDTO dto) {
		int result = 0;
		String MAKE_CREW_SQL = "insert into crewRecruit values(null,?,?,?,?,?,?,?,?,true)";

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
	public List<CrewRecruitDTO> selectAllRecruit() {
		List<CrewRecruitDTO> crewList = new ArrayList<CrewRecruitDTO>();
		String SELECT_ALLRECRUIT_SQL = "select *, (select count(memId) from longCrewSchedule where crewName = crewRecruit.crewName) as totalCount from crewRecruit order by created desc";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(SELECT_ALLRECRUIT_SQL);
			
			while(rs.next()) {
				CrewRecruitDTO dto = new CrewRecruitDTO();
				dto.setNo(rs.getInt(1));
				dto.setCrewName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setLocation(rs.getString(5));
				dto.setMemberNum(rs.getInt(6));
				dto.setCreated(rs.getString(7));
				dto.setGatherDate(rs.getString(8));
				dto.setAdminId(rs.getString(9));
				dto.setCrew(rs.getBoolean(10));
				dto.setTotalCount(rs.getInt(11));
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
	public CrewRecruitDTO selectRecruitDetail(String crewName) {
		CrewRecruitDTO dto = new CrewRecruitDTO();
		String SELECT_RECRUIT_DETAIL = "select *, (select count(memId) from longCrewSchedule where crewName = crewRecruit.crewName)"
				+ " as totalCount from crewRecruit where crewName = ?";
		
		try {
			psmt = con.prepareStatement(SELECT_RECRUIT_DETAIL);
			psmt.setString(1, crewName);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNo(rs.getInt(1));
				dto.setCrewName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setLocation(rs.getString(5));
				dto.setMemberNum(rs.getInt(6));
				dto.setCreated(rs.getString(7));
				dto.setGatherDate(rs.getString(8));
				dto.setAdminId(rs.getString(9));
				dto.setCrew(rs.getBoolean(10));
				dto.setTotalCount(rs.getInt(11));
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
	public List<CrewRecruitDTO> selectCrewName() {
		List<CrewRecruitDTO> cNameList = new ArrayList<CrewRecruitDTO>();
		String SELECT_CREWNAME = "select crewName from crewRecruit";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(SELECT_CREWNAME);
			 
			while(rs.next()) {
				CrewRecruitDTO dto = new CrewRecruitDTO();
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
	
	// 방장 제외 인원 0명이면서 한달 지난 크루 삭제(장기크루에서 사용)
	public void deleteCrew(String crewName, String created) {
		int result = 0;
		String DELETE_CREW_SQL = "delete from crewRecruit where crewName = ? and (select count(*) from crew where crewName = ?) <= 1";
		
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			  
			
			// 크루 생성 날짜(Calendar로 변환)
			Date date = formatter.parse(created);
			Calendar created2 = Calendar.getInstance();
			created2.setTime(date);
			
			// 한달 전 날짜
			Calendar monthAgo = Calendar.getInstance();
			monthAgo.add(Calendar.MONTH , -1);    
		
			// 두 날짜 간 차이 계산
			boolean monthsBetween = created2.before(monthAgo);
			
			// 한달 이상이면 쿼리문 실행해서 삭제
			if(monthsBetween == true) {
				psmt = con.prepareStatement(DELETE_CREW_SQL);
				psmt.setString(1, crewName);
				psmt.setString(2, crewName);
				result = psmt.executeUpdate();
			}
			
			System.out.println("deleteCrew 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("deleteCrew 실패");
		}
		
	}
	
	// 모집인원이 방장포함 1명이하이면서 모집일이 지나면 크루 삭제(단기 크루에서 사용)
	public void deleteCrew2(String crewName, String gatherDate) {
		String DELETE_CREW_SQL = "delete from crewRecruit where crewName = ? and (select count(*) from longCrewSchedule where crewName = ?) <= 1 and isCrew = true";
		
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			  
			
			// 크루 모집일 날짜
			Date gatherDate2 = formatter.parse(gatherDate);
			
			// 오늘 날짜
			Date now = new Date();
			String today = formatter.format(now);
			Date today2 = formatter.parse(today);
		
			// 모집일이 지났는지 확인
			int result = gatherDate2.compareTo(today2);
			System.out.println(result);
			// 오늘 날짜 지났으면 삭제
			if(result < 0) {
				psmt = con.prepareStatement(DELETE_CREW_SQL);
				psmt.setString(1, crewName);
				psmt.setString(2, crewName);
				result = psmt.executeUpdate();
			}
			
			System.out.println("deleteCrew 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("deleteCrew 실패");
		}
		
	}
	
	
	
	
	// 예정된 단기크루 스케쥴 모두 가져오기
	public List<CrewRecruitDTO> selectPlannedSchedule(String id) {
		List<CrewRecruitDTO> list = new ArrayList<CrewRecruitDTO>();
		String PLANNED_SCHEDULE_LIST = "select crewRecruit.*, (select count(memId) from longCrewSchedule where crewName = crewRecruit.crewName) totalCount "
				+ "from crewRecruit join longCrewSchedule on longCrewSchedule.crewName = crewRecruit.crewName where longCrewSchedule.memId = ? and isCrew = true";
		
		try {
			
			psmt = con.prepareStatement(PLANNED_SCHEDULE_LIST);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
				
				while(rs.next()) {
					CrewRecruitDTO dto = new CrewRecruitDTO();
					dto.setNo(rs.getInt(1));
					dto.setCrewName(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setContent(rs.getString(4));
					dto.setLocation(rs.getString(5));
					dto.setMemberNum(rs.getInt(6));
					dto.setCreated(rs.getString(7));
					dto.setGatherDate(rs.getString(8));
					dto.setAdminId(rs.getString(9));
					dto.setCrew(rs.getBoolean(10));
					dto.setTotalCount(rs.getInt(11));
					
					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

					// 크루 생성 날짜(Date로 변환)
					Date gatherDate = formatter.parse(rs.getString("gatherDate"));
					
					// 오늘 날짜
					Date now = new Date();
					String today = formatter.format(now);
					Date today2 = formatter.parse(today);
					
					// 오늘 날짜 이전인지 확인
					int result = gatherDate.compareTo(today2);
					
					
					if(result > 0) {
						list.add(dto);
				}
		}	
			System.out.println("selectPlannedSchedule 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectPlannedSchedule 실패");
		}
		
		return list;
	}
	
	
	// 마감된 크루 스케쥴 모두 가져오기
	public List<CrewRecruitDTO> selectClosedSchedule(String id) {
	List<CrewRecruitDTO> list = new ArrayList<CrewRecruitDTO>();
	String CLOSED_SCHEDULE_LIST = "select crewRecruit.*, (select count(memId) from longCrewSchedule where crewName = crewRecruit.crewName) totalCount "
			+ "from crewRecruit join longCrewSchedule on longCrewSchedule.crewName = crewRecruit.crewName where longCrewSchedule.memId = ? and isCrew = true";
			
	
			try {
				
				psmt = con.prepareStatement(CLOSED_SCHEDULE_LIST);
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				
					
					while(rs.next()) {
						CrewRecruitDTO dto = new CrewRecruitDTO();
						dto.setNo(rs.getInt(1));
						dto.setCrewName(rs.getString(2));
						dto.setTitle(rs.getString(3));
						dto.setContent(rs.getString(4));
						dto.setLocation(rs.getString(5));
						dto.setMemberNum(rs.getInt(6));
						dto.setCreated(rs.getString(7));
						dto.setGatherDate(rs.getString(8));
						dto.setAdminId(rs.getString(9));
						dto.setCrew(rs.getBoolean(10));
						dto.setTotalCount(rs.getInt(11));
						
						SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

						// 크루 생성 날짜(Date로 변환)
						Date gatherDate = formatter.parse(rs.getString("gatherDate"));
						
						// 오늘 날짜
						Date now = new Date();
						String today = formatter.format(now);
						Date today2 = formatter.parse(today);
						
						// 오늘 날짜 이전인지 확인
						int result = gatherDate.compareTo(today2);
						
						
						if(result <= 0) {
							list.add(dto);
					}
			}	
				System.out.println("selectClosedSchedule 성공");
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("selectClosedSchedule 실패");
			}
			
			return list;
		}
	
	
	// 특정 id가 참여중인 모든 단기 크루 불러오기
	public List<CrewRecruitDTO> selectCrewById(String memId) {
		List<CrewRecruitDTO> crewList = new ArrayList<CrewRecruitDTO>();
		String SELECT_CREW_BY_ID = "select crewRecruit.*, (select count(memId) from longCrewSchedule where crewName = crewRecruit.crewName) as totalCount from crewRecruit "
				+ "join longCrewSchedule on longCrewSchedule.crewName = crewRecruit.crewName where longCrewSchedule.memId = ?"; 
		
		try {
			psmt = con.prepareStatement(SELECT_CREW_BY_ID);
			psmt.setString(1, memId);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				CrewRecruitDTO dto = new CrewRecruitDTO();
				dto.setNo(rs.getInt("no"));
				dto.setCrewName(rs.getString("crewName"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setLocation(rs.getString("location"));
				dto.setMemberNum(rs.getInt("memberNum"));
				dto.setCreated(rs.getString("created"));
				dto.setGatherDate(rs.getString("gatherDate"));
				dto.setAdminId(rs.getString("adminId"));
				dto.setCrew(rs.getBoolean("isCrew"));
				dto.setTotalCount(rs.getInt("totalCount"));
				crewList.add(dto);
			}
			
			System.out.println("selectCrewById 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectCrewById 실패");
		}
		
		return crewList;
	}
	
	
	// 방금 단기크루에 등록된 크루 no 가져오기
	public int selectNo() {
		int result = 0;
	
		String CHECK_CREWNAME_SQL = "select max(no) from crewRecruit";
		
		try {
			psmt = con.prepareStatement(CHECK_CREWNAME_SQL);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			System.out.println("selectNo 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectNo 실패");
		}
		
		return result;
	}
}
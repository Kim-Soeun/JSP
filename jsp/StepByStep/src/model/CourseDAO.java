package model;

import java.util.ArrayList;
import java.util.List;

import common.DBConnector;

public class CourseDAO extends DBConnector {

	// 특정 id가 참여한 코스아이디 course 테이블에 등록됨
	public int insertCourseId(CourseDTO dto) {
		int result = 0;
		String INSERT_COURSEID = "insert into course values(?, ?, ?)";
		
		try {
			psmt = con.prepareStatement(INSERT_COURSEID);
			psmt.setString(1, dto.getMemId());
			psmt.setString(2, dto.getCourseId());
			psmt.setInt(3, dto.getNo());
			result = psmt.executeUpdate();
			System.out.println("insertCourseId 성공");

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("insertCourseId 실패");
		}
		
		return result;
	}


	// 특정 id가 참여완료한 no 가져오기
	public List<CourseDTO> selectNo(String memId) {
		List<CourseDTO> courseList = new ArrayList<CourseDTO>();
		int result = 0;
		String SELECT_NO = "select no from course where memId = ?";
		
		try {
			psmt = con.prepareStatement(SELECT_NO);
			psmt.setString(1, memId);
			rs = psmt.executeQuery();
			while(rs.next()) {
				CourseDTO dto = new CourseDTO();
				dto.setNo(rs.getInt("no"));
				System.out.println("넘버 : " + rs.getInt("no"));
				courseList.add(dto);
			}
			
			System.out.println("selectNo 성공");

		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectNo 실패");
		}
		
		return courseList;
	}
	
	
	
}

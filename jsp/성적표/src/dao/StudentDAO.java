package dao;

import java.util.ArrayList;
import java.util.List;

import db.MysqlCon;
import dto.StudentDTO;

public class StudentDAO extends MysqlCon {

	
	public StudentDAO() {
		super();
	}
	
	
	public List<StudentDTO> selectScore() {
		List<StudentDTO> lists = new ArrayList<StudentDTO>();
		String sql = "select * from 시험";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				StudentDTO dto = new StudentDTO();
				dto.setId(rs.getString(1));
				dto.setKor(rs.getInt(2));
				dto.setEng(rs.getInt(3));
				dto.setMath(rs.getInt(4));
				lists.add(dto);
			}
			
			System.out.println("점수 추출 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("점수 추출 실패");
		}
		
		return lists;
	}
	
	
	// 학점으로 모든 정보 가져오기
	public List<StudentDTO> searchScore(String grade) {
		List<StudentDTO> lists = new ArrayList<StudentDTO>();
		String sql = "select * from 시험 where 학점 = ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, grade);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				StudentDTO dto = new StudentDTO();
				dto.setId(rs.getString(1));
				dto.setKor(rs.getInt(2));
				dto.setEng(rs.getInt(3));
				dto.setMath(rs.getInt(4));
				dto.setGrade(rs.getString(5));
				lists.add(dto);
			}
			System.out.println("학점 정보 추출 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("학점 정보 추출 실패");
		}
		
		return lists;
	}
	
	
	// db 수정없이 평균점수로 모든 정보 가져오기
	public List<StudentDTO> allFromGrade(int start, int end) {
		List<StudentDTO> lists = new ArrayList<StudentDTO>();
		
		String sql = "select * from 시험 where ((국어+영어+수학)/3) >= ? and ((국어+영어+수학)/3) <?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				StudentDTO dto = new StudentDTO();
				dto.setId(rs.getString(1));
				dto.setKor(rs.getInt(2));
				dto.setEng(rs.getInt(3));
				dto.setMath(rs.getInt(4));
				lists.add(dto);
			}
			
			System.out.println("학점으로 정보 추출 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("학점으로 정보 추출 실패");
		}
		return lists;
	}
	
}

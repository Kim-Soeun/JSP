package dao;

import java.util.ArrayList;
import java.util.List;

import db.MysqlCon;
import dto.StudentDTO;

public class StudentDAO extends MysqlCon {

	public StudentDAO() {
		super();
	}
	
	public StudentDTO selectStudent(String name) {
		StudentDTO dto = new StudentDTO();
		
		String query = "select 이름, 대학생.학번, 성별, 국어, 영어, 수학 "
				+ "from 대학생 join 시험 on 대학생.학번 = 시험.학번 where 이름=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, name);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setName(rs.getString(1));
				dto.setStudentId(rs.getString(2));
				dto.setGender(rs.getString(3));
				dto.setKor(rs.getInt(4));
				dto.setEng(rs.getInt(5));
				dto.setMath(rs.getInt(6));
			}
			
			System.out.println("학생 정보 추출 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("학생 정보 추출 실패");
		}
		return dto;
	}
	
	public List<StudentDTO> selectAll() {
		List<StudentDTO> allStudents = new ArrayList<StudentDTO>();
		
		String query = "select 이름, 대학생.학번, 성별, 국어, 영어, 수학 from 대학생 join 시험 on 대학생.학번 = 시험.학번";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				StudentDTO dto = new StudentDTO();
				dto.setName(rs.getString(1));
				dto.setStudentId(rs.getString(2));
				dto.setGender(rs.getString(3));
				dto.setKor(rs.getInt(4));
				dto.setEng(rs.getInt(5));
				dto.setMath(rs.getInt(6));
				allStudents.add(dto);
			}
			
			System.out.println("모든 학생 성적 추출 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("모든 학생 성적 추출 실패");
		}
		
		return allStudents;
	}
	
	
}

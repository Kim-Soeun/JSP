package dto;

import dao.StudentDAO;

public class StudentDTO {
	
	// 멤버 변수 선언
	private String name;		// 학생 이름
	private String studentId;	// 학번
	private String gender;		// 성별
	private int kor;			// 국어 점수
	private int eng;			// 영어 점수
	private int math;			// 수학 점수
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	
	public int avg() {
		int avg =  Math.round(((kor + eng + math) / 3));
		
		return avg;
	}
	
	
	public String point() {
		String point = "";
		
		int avg = avg();
		
		switch(avg/10) {
			case 9 :
				point = "A";
				break;
			case 8 :
				point = "B";
				break;
			case 7 :
				point = "C";
				break;
			default :
				point = "F";
		}
		
		
		return point;
	}
	
}

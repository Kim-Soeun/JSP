package model;

public class CrewJoinDTO {

	private int no, memberNum, isCheck, crewNum;
	private String crewName, memId, adminId;
	private Boolean isShortCrew;
	
	public int getNo() {
		return no;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public int getIsCheck() {
		return isCheck;
	}
	public String getCrewName() {
		return crewName;
	}
	public String getMemId() {
		return memId;
	}
	public String getAdminId() {
		return adminId;
	}
	public Boolean getIsShortCrew() {
		return isShortCrew;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public void setIsCheck(int isCheck) {
		this.isCheck = isCheck;
	}
	public void setCrewName(String crewName) {
		this.crewName = crewName;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public void setIsShortCrew(Boolean isShortCrew) {
		this.isShortCrew = isShortCrew;
	}
	public int getCrewNum() {
		return crewNum;
	}
	public void setCrewNum(int crewNum) {
		this.crewNum = crewNum;
	}
	
	
	

	
}

package model;

public class CrewDTO {

	private String crewName, memId;
	private int memberNum;
	private boolean memAdmin;
	
	
	public String getCrewName() {
		return crewName;
	}
	public void setCrewName(String crewName) {
		this.crewName = crewName;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public boolean isMemAdmin() {
		return memAdmin;
	}
	public void setMemAdmin(boolean memAdmin) {
		this.memAdmin = memAdmin;
	}
	
	
}
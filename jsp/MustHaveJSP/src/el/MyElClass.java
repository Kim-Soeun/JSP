package el;

public class MyElClass {

	
	// 주민번호를 입력받아 성별을 반환
	public String getGender(String jumin) {
		String returnStr = "";
		
		// 예) 주민번호 991205 - 1133251일 때 성별을 표시하는 1의 index 번호를 가져옴
		int beginIdx = jumin.indexOf("-") + 1;
		String genderStr = jumin.substring(beginIdx, beginIdx+1);
		int genderInt = Integer.parseInt(genderStr);
		
		if(genderInt == 1 || genderInt == 3) {
			returnStr = "남자";
		} else if(genderInt == 2 || genderInt == 4) {
			returnStr = "여자";
		} else {
			returnStr = "주민번호 오류";
		}
		return returnStr;
	}
	
	

	public String getId(String email) {
		String mail = "";
		
		int index = email.indexOf("@");
		mail = email.substring(0, index);
		
		return mail;
	}

	
	public String getDomain(String email) {
		String domain = "";
		
		int beginIdx = email.indexOf("@")+1;
		domain = email.substring(beginIdx);
		
		return domain;
	}
	
	
}

package fileupload;

import common.JDBConnect;

public class MyFileDAO extends JDBConnect {

	public MyFileDAO() {
		super();
	}
	
	public int insertFile(MyFileDTO dto) {
		int applyResult = 0;
		
		try {
			String query = "insert into myfile values(seq_board_num.nextval, ?,?,?,?,?,default)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			applyResult = psmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("INSERT 중 예외 발생");
		}
		
		return applyResult;
	}
	
	
}

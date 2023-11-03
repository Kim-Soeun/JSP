package model;

import common.DBConnector;

public class guestbookDAO extends DBConnector {
	
	public guestbookDAO() {
		super();
	}
	
	
	public int InsertGuestbook(guestbook dto) {
		String INSERT_GUESTBOOK = "insert into guestbook values (null, ?, ? ,? ,?)";
		
		int result = 0;
		
		try {
			psmt = con.prepareStatement(INSERT_GUESTBOOK);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getOwner_id());
			psmt.setString(3, dto.getCreated());
			psmt.setString(4, dto.getContent());
			result = psmt.executeUpdate();
			
			if(result == 1) {
				System.out.println("InsertGuestbook 성공");
			} else {
				System.out.println("InsertGuestbook 실패");
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}

package model;

import java.util.ArrayList;
import java.util.List;

import common.DBConnector;

public class guestbookDAO extends DBConnector {
	
	public guestbookDAO() {
		super();
	}
	
	
	public int InsertGuestbook(guestbook dto) {
		String INSERT_GUESTBOOK = "insert into guestbook values (null, ?, ?, ?, ?)";
		
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
	
	
	public List<guestbookDTO> SelectGuestbook(String ownerId, String userId) {
		List<guestbookDTO> dtoList = new ArrayList<guestbookDTO>();
		String SELECT_GUESTBOOK_SQL = "select guestbook.*, imgName from guestbook"
				+ " join member on member.id = guestbook.id where owner_id=? and guestbook.id=?";
		
		try {
			psmt = con.prepareStatement(SELECT_GUESTBOOK_SQL);
			psmt.setString(1, ownerId);
			psmt.setString(2, userId);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				guestbookDTO dto = new guestbookDTO();
				dto.setNo(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setOwner_id(rs.getString(3));
				dto.setCreated(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setImgName(rs.getString(6));
				dtoList.add(dto);
			}
			
			
			System.out.println("방명록 가져오기 성공");
		} catch(Exception e) {
			System.out.println("방명록 가져오기 실패");
			e.printStackTrace();
		}
		
		
		return dtoList;
	}
	

}

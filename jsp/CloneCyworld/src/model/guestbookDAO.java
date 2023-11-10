package model;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.DateFormatter;

import common.DBConnector;

public class guestbookDAO extends DBConnector {
	
	public guestbookDAO() {
		super();
	}
	
	
	// 방명록 등록
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
	
	
	// 방명록 불러오기
	public List<guestbookDTO> SelectGuestbook(String ownerId) {
		List<guestbookDTO> dtoList = new ArrayList<guestbookDTO>();
		String SELECT_GUESTBOOK_SQL = "select guestbook.*, imgName from guestbook"
				+ " join member on member.id = guestbook.id where owner_id=? order by no desc";
		
		try {
			psmt = con.prepareStatement(SELECT_GUESTBOOK_SQL);
			psmt.setString(1, ownerId);
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
	
	
	// 방명록 삭제
	public int DeleteGuestbook(int b_no) {
		int result = 0;
		
		String DELETE_BOOK_SQL = "delete from guestbook where no = ?";
		
		try {
			psmt = con.prepareStatement(DELETE_BOOK_SQL);
			psmt.setInt(1, b_no);
			result = psmt.executeUpdate();
			
			System.out.println("DeleteGuestbook 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("DeleteGuestbook 실패");
		}
		
		return result;
	}
	
	
	// 오늘 업데이트된 방명록 갯수 불러오기
	public int UpdateNewCount(String ownerId, String created) {
		int result = 0;
		
		String SELECT_NEW_SQL = "select count(*) from guestbook where created like ? and owner_id = ?";
		
		try {
			psmt = con.prepareStatement(SELECT_NEW_SQL);
			psmt.setString(1, created + "%");
			psmt.setString(2, ownerId);
			rs = psmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
			
			System.out.println("UpdateNewCount 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("UpdateNewCount 실패");
		}
		
		return result;
	}

}

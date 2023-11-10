package model;

import java.util.ArrayList;
import java.util.List;

import common.DBConnector;

public class ReplyDAO extends DBConnector {
	
	public ReplyDAO() {
		super();
	}

	// 방명록 댓글 등록
	public int InsertReply(Reply dto) {
		int result = 0;
		
		String INSERT_REPLY_SQL = "insert into guestbookReply values (null, ?, ?, ?, ?)";
		
		try {
			psmt = con.prepareStatement(INSERT_REPLY_SQL);
			psmt.setInt(1, dto.getB_no());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getCreated());
			psmt.setString(4, dto.getId());
			result = psmt.executeUpdate();
			
			System.out.println("댓글 삽입 성공");
		} catch(Exception e) {
			System.err.println("댓글 삽입 실패");
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 방명록 댓글 불러오기
	public List<Reply> SelectReply() {
		List<Reply> list = new ArrayList<Reply>();
		String SELECT_REPLY_SQL = "select * from guestbookReply";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(SELECT_REPLY_SQL);
			
			while(rs.next()) {
				Reply dto = new Reply();
				dto.setR_no(rs.getInt(1));
				dto.setB_no(rs.getInt(2));
				dto.setContent(rs.getString(3));
				dto.setCreated(rs.getString(4));
				dto.setId(rs.getString(5));
				list.add(dto);
			}
			
			System.out.println("댓글 불러오기 성공");
		} catch(Exception e) {
			System.out.println("댓글 불러오기 실패");
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	// 댓글 삭제
	public int DeleteReply(int no, String id) {
		int result = 0;

		String DELETE_REPLY_SQL = "delete from guestbookReply where b_no = ? and id = ?";
		
		try {
			psmt = con.prepareStatement(DELETE_REPLY_SQL);
			psmt.setInt(1, no);
			psmt.setString(2, id);
			result = psmt.executeUpdate();
			
			System.out.println("DeleteReply 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("DeleteReply 실패");
		}
		
		return result;
	}
	
}

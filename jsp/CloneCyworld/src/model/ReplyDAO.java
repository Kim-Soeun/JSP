package model;

import java.util.ArrayList;
import java.util.List;

import common.DBConnector;

public class ReplyDAO extends DBConnector {
	
	public ReplyDAO() {
		super();
	}

	
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
	
	
}

package dao;

import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;
import dto.BoardDTO;

public class BoardDAO extends JDBConnect {

	public BoardDAO() {
		super();
	}
	
	
	// 게시물의 개수 세기
	public int selectCount() {
		int result = 0;
		
		String query = "select count(*) from board";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			result = rs.getInt(1);
			
			System.out.println("게시물 개수 세기 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 개수 세기 실패");
		}
		
		return result;
	}
	
	// 게시물의 모든 내용 가져오기
	public List<BoardDTO> selectList() {
		
		List<BoardDTO> dto = new ArrayList<>();
		
		String query = "select * from board order by num desc";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardDTO bto = new BoardDTO();
				bto.setNum(rs.getString("num"));
				bto.setTitle(rs.getString("title"));
				bto.setContent(rs.getString("content"));
				bto.setId(rs.getString("id"));
				bto.setPostdate(rs.getString("postdate"));
				bto.setVisitcount(rs.getInt("visitcount"));
				dto.add(bto);
			}
			
			System.out.println("게시물 가져오기 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 가져오기 실패");
		}
		
		return dto;
	}
	
	
	// 글쓰기
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		String query = "insert into board(title,content,id,postdate,visitcount) values(?,?,?,?,0)";
			
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			psmt.setString(4, dto.getPostdate());
			result = psmt.executeUpdate();
			
			System.out.println("게시물 글쓰기 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 글쓰기 실패");
		}
		return result;
	}
	
}

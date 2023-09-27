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
	
	
	// 세부내용 출력
		public BoardDTO selectView(String num) {
			BoardDTO dto = new BoardDTO();
			String query = "select board.*, member.name from board "
					+ "inner join member on board.id = member.id where num=?";
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, num);
				rs = psmt.executeQuery();
				if (rs.next()) {
					dto.setNum(rs.getString("num"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setId(rs.getString("id"));
					dto.setPostdate(rs.getString("postdate"));
					dto.setVisitcount(rs.getInt("visitcount"));
					dto.setName(rs.getString("name"));
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("출력 오류");
			}
			return dto;
		}

		// 조회수 증가
		public void updateVisitCount(String num) {
			String query = "update board set visitcount = visitcount + 1 where num=?";

			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, num);
				rs = psmt.executeQuery();

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("조회수 증가 오류");
			}
		}
		
		// 게시물 수정하기 
		public int updateEdit(BoardDTO dto) {
			int result = 0;
			String query = "update board set title=?, content=? where num=?";
			try {
				psmt = con.prepareStatement(query);
				psmt.setString(1, dto.getTitle());
				psmt.setString(2, dto.getContent());
				psmt.setString(3, dto.getNum());
				result = psmt.executeUpdate();
				System.out.println("게시물 수정 성공");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("게시물 수정 오류");
			}
			return result;
		}
		
	
		public int updateDelete(String num) {
			int result = 0;
			
			String sql = "delete from board where num=?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, num);
				result = psmt.executeUpdate();
				System.out.println("게시물 삭제 성공");
				
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("게시물 삭제 실패");
			}
			
			return result;
		}
}

package mvc.model;

import java.util.ArrayList;

import mvc.database.DBConnection;

public class BoardDAO extends DBConnection {
	
	
	public BoardDAO() {
		super();
	}
	
	
	
	// 게시물 개수 세기
	public int getListCount(String items, String text) {
		int count = 0;
		String sql;
		
		if(items == null && text == null) 	// 검색 조건이 없으면 전체 레코드 개수 추출
			sql = "select count(*) from board";
		else 								// 검색 조건이 있으면 조건에 맞는 개수 출력
			sql = "select count(*) from board where " + items + " like '%" + text + "%'";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch(Exception e) {
			System.out.println("getListCount(게시물 개수 세기) 오류 : " + e);
			e.printStackTrace();
		}
		return count;
	}
	
	
	
	// board 테이블에 데이터 가져오기
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
		ArrayList<BoardDTO> dto = new ArrayList<BoardDTO>();
		
		int total_record = getListCount(items, text); // 조건에 맞는 전체 행의 개수
		int start = (page - 1) * limit;			  // 해당 페이지 게시물의 시작 지점 
		int index = start + 1;
		String sql;
		
		if(items == null && text == null) {		// 조건이 없으면 전체 데이터 가져오기
			sql = "select * from board order by num desc";
		} else {								// 조건이 있으면 조건 넣어서 가져오기
			sql = "select * from board where " + items + " like '%" + text + "%'";
		}
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.absolute(index)) {	  // 반복문 이용하여 해당 게시물을 게시판에 넣음
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
				list.add(board);
				
				if(index < (start + limit) && index <= total_record) {
					index++;
				} else {
					break;
				}
			}
			return list;
		} catch(Exception e) {
			System.out.println("연결 오류 : " + e);
		}
		
		return null;
	}
	
	
	// 게시물 글쓰기
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		try {
			String sql = "insert into board values(null,?,?,?,?,?,?,?)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getSubject());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getRegist_day());
			psmt.setInt(6, dto.getHit());
			psmt.setString(7, dto.getIp());
			result = psmt.executeUpdate();
			
			System.out.println("게시물 글쓰기 성공");
			
		} catch(Exception e) {
			System.out.println("게시물 글쓰기 실패");
			e.printStackTrace();
		}
		return result;
	}
	
	// 게시판 조회수 증가
	public void updateHit(int num) {
		try {
			String sql = "update board set hit=hit+1 where num=?";
			// DB에 증가된 횟수를 업데이트 시킴
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			psmt.executeUpdate();
			System.out.println("게시판 조회수 증가 성공");
			
		} catch(Exception e) {
			System.out.println("게시판 조회수 증가 실패");
			e.printStackTrace();
		}
	}
	
	
	// 게시판 상세보기
	public BoardDTO getBoardByNum(int num) {
		String sql = "select * from board where num=?";
		BoardDTO dto = null;
		
		// 게시판 조회수 증가
		updateHit(num);
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setNum(num);
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegist_day(rs.getString("regist_day"));
				dto.setHit(rs.getInt("hit"));
				dto.setIp(rs.getString("ip"));
				System.out.println("게시판 상세보기 성공");
			}
			
		} catch(Exception e) {
			System.out.println("게시판 상세보기 실패");
			e.printStackTrace();
		}
		return dto;
	}
	
	
	// 게시판 글 수정
	public void updateBoard(BoardDTO dto) {
		
		try {
		String sql = "update board set subject=?, content=? where num=?";
		psmt = con.prepareStatement(sql);
		psmt.setString(1, dto.getSubject());
		psmt.setString(2, dto.getContent());
		psmt.setInt(3, dto.getNum());
		psmt.executeUpdate();
		System.out.println("게시판 수정 성공");
		
		} catch(Exception e) {
			System.out.println("게시판 수정 실패");
			e.printStackTrace();
		}
	}
	
	
	// 게시판 글 삭제
	public void deleteBoard(int num) {
		
		try {
			String sql = "delete from board where num=?";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			psmt.executeUpdate();
			
			System.out.println("글 삭제 성공");
		} catch(Exception e) {
			System.out.println("글 삭제 실패");
			e.printStackTrace();
		}
	}
	
}

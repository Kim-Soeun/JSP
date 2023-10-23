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
	
}

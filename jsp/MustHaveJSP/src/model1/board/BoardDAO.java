package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {
	
	// JDBConnect 클래스 상속 후, application 내장 객체를 받는 생성자를 이용
	// 매개변수로 받은 application 내장 객체를 통해 
	// web.xml에 정의해둔 오라클 접속 정보를 직접 가져와 DB에 연결해줌
	
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "select count(*) from board";
		
		if(map.get("searchWord") != null) {					// 검색하는 단어가 있다면
			// serchField = 검색 분류(종류)와 serchWord = 검색 단어로 쿼리문 완성
			query += " where " + map.get("searchField") + " "
					+ " like '%" + map.get("searchWord") + "%'";
			
		}
		
		try {
			stmt = con.createStatement();	// 쿼리문 생성
			rs = stmt.executeQuery(query);  // 쿼리문 실행
			rs.next();						// 커서 첫번째 행으로 이동(생략 불가)
			totalCount = rs.getInt(1);      // 첫번째 값인 게시물 개수를 가져옴
			System.out.println("게시물 개수 추출 성공");

		} catch(Exception e) {
			System.out.println("게시물 개수 오류");
			e.printStackTrace();
		}
		
		
		return totalCount;
	}
	
	
	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<>();	// 게시물 작성시 동시에 접수되지 않도록 Vector 사용
		
		String query = "select * from board";
		if(map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " "
					+ " like '%" + map.get("searchWord") + "%'";
		}
		query += " order by num desc";
		// 게시물 번호로 내림차순 정렬 (최근 게시물이 위로 오게 정렬)
		
		try {
			 stmt = con.createStatement();
			 rs= stmt.executeQuery(query);
			 
			 while(rs.next()) {
				 BoardDTO dto = new BoardDTO();
				 
				 dto.setNum(rs.getString("num"));
				 dto.setTitle(rs.getString("title"));
				 dto.setContent(rs.getString("content"));
				 dto.setPostdate(rs.getDate("postdate"));
				 dto.setId(rs.getString("id"));
				 dto.setVisitcount(rs.getString("visitcount"));
				 bbs.add(dto);
			 }
			 System.out.println("게시물 조회 성공");
		} catch (Exception e) {
			System.out.println("게시물 조회 실패");
			e.printStackTrace();
		}
		return bbs;
	}
	
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "insert into board(num,title,content,id,visitcount) values(seq_board_num.NEXTVAL,?,?,?,0)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate();
			
			System.out.println("글쓰기 성공");
		} catch(Exception e) {
			System.out.println("글쓰기 오류");
			e.printStackTrace();
		}
		return result;
	}
}

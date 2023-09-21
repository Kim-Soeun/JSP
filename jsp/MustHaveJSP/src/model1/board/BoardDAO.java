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
	
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		
		String query = "select B.*, M.name from member M inner join board B on M.id=B.id where num=?";
		// "회원" 테이블(별명 'M')과 "게시판" 테이블(별병 "B")에서 데이터를 선택하고,
		// "id" 열을 기준으로 내부 조인을 사용하여 이 두 테이블을 결합
		// "회원" 테이블의 "id"와 "게시판" 테이블의 "id"가 일치하는 행만 결과에 포함
		// select B.* 결과 집합에서 "게시판" 테이블의 모든 열을 선택
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			System.out.println("게시물 상세보기 성공");
			
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setName(rs.getString("name"));
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 상세보기 오류");
		}
		
		return dto;
	}
	
	// 게시물의 조회수 증가 메소드
	public void updateVisitCount(String num) {
		
		String query = "update board set visitcount = visitcount+1 where num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
			// 기존 행에 영향을 주는 쿼리문은 executeUpdate() 메소드를 사용
			// 하지만 update가 적용된 행의 개수를 알 필요가 없다면 executeQuery() 사용해도 무방
			System.out.println("게시물 조회수 증가 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 조회수 증가 오류");
		}
		
		
	}
	
	
	// 게시물 수정
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
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 수정 실패");
		}
		
		return result;
	}
	
	
	// 게시물 삭제
	public int deletePost(BoardDTO dto) {
		int result = 0;
		String query = "delete from board where num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("게시물 삭제 실패");
		}
		
		return result;
	}
}

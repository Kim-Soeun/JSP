package model2.mvcboard;

import java.util.*;

import common.JDBConnect;

public class MVCBoardDAO extends JDBConnect {

	// JDBConnect 클래스 상속 후, application 내장 객체를 받는 생성자를 이용
	// 매개변수로 받은 application 내장 객체를 통해
	// web.xml에 정의해둔 오라클 접속 정보를 직접 가져와 DB에 연결해줌

	public MVCBoardDAO() {
		super();
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "select count(*) from mvcboard";

		if (map.get("searchWord") != null) { // 검색하는 단어가 있다면
			// serchField = 검색 분류(종류)와 serchWord = 검색 단어로 쿼리문 완성
			query += " where " + map.get("searchField") + " " + " like '%" + map.get("searchWord") + "%'";

		}

		try {
			stmt = con.createStatement(); // 쿼리문 생성
			rs = stmt.executeQuery(query); // 쿼리문 실행
			rs.next(); // 커서 첫번째 행으로 이동(생략 불가)
			totalCount = rs.getInt(1); // 첫번째 값인 게시물 개수를 가져옴
			System.out.println("게시물 개수 추출 성공");

		} catch (Exception e) {
			System.out.println("게시물 개수 오류");
			e.printStackTrace();
		}

		return totalCount;
	}

	public List<MVCBoardDTO> selectList(Map<String, Object> map) {
		List<MVCBoardDTO> bbs = new Vector<>(); // 게시물 작성시 동시에 접수되지 않도록 Vector 사용

		String query = "select * from ( select Tb.*, rownum rNum from ( select * from mvcboard ";
		if (map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " " + " like '%" + map.get("searchWord") + "%'";
		}
		query += " order by idx desc ) Tb ) where rNum between ? and ?";
		// 게시물 번호로 내림차순 정렬 (최근 게시물이 위로 오게 정렬)

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();

			while (rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();

				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				bbs.add(dto);
			}
			System.out.println("게시물 조회 성공");
		} catch (Exception e) {
			System.out.println("게시물 조회 실패");
			e.printStackTrace();
		}
		return bbs;
	}

	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;

		try {
			String query = "insert into mvcboard(idx,name,title,content,ofile,sfile,pass) values(seq_board_num.NEXTVAL,?,?,?,?,?,?)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getPass());
			result = psmt.executeUpdate();

			System.out.println("글쓰기 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("글쓰기 오류");
		}
		return result;
	}

	// 게시물 상세보기
	public MVCBoardDTO selectView(String idx) {

		MVCBoardDTO dto = new MVCBoardDTO();

		String query = "select * from mvcboard where idx=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			System.out.println("게시물 상세보기 성공");

			if (rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시물 상세보기 오류");
		}

		return dto;
	}

	// 게시물의 조회수 증가 메소드
	public void updateVisitCount(String idx) {

		String query = "update mvcboard set visitcount = visitcount+1 where idx=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
			// 기존 행에 영향을 주는 쿼리문은 executeUpdate() 메소드를 사용
			// 하지만 update가 적용된 행의 개수를 알 필요가 없다면 executeQuery() 사용해도 무방
			System.out.println("게시물 조회수 증가 성공");

		} catch (

		Exception e) {
			e.printStackTrace();
			System.out.println("게시물 조회수 증가 오류");
		}
		
	}

	
	
	public void downCountPlus(String idx) {

		String query = "update mvcboard set downcount = downcount+1 where idx=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
			// 기존 행에 영향을 주는 쿼리문은 executeUpdate() 메소드를 사용
			// 하지만 update가 적용된 행의 개수를 알 필요가 없다면 executeQuery() 사용해도 무방
			System.out.println("첨부파일 다운 증가 성공");

		} catch (

		Exception e) {
			e.printStackTrace();
			System.out.println("첨부파일 다운 증가 실패");
		}
		
	}

}
	/*
	 * // 게시물 수정 public int updateEdit(MVCBoardDTO dto) { int result = 0;
	 * 
	 * String query = "update board set title=?, content=? where num=?";
	 * 
	 * try { psmt = con.prepareStatement(query); psmt.setString(1, dto.getTitle());
	 * psmt.setString(2, dto.getContent()); psmt.setString(3, dto.getNum()); result
	 * = psmt.executeUpdate();
	 * 
	 * System.out.println("게시물 수정 성공"); } catch(Exception e) { e.printStackTrace();
	 * System.out.println("게시물 수정 실패"); }
	 * 
	 * return result; }
	 * 
	 * 
	 * // 게시물 삭제 public int deletePost(MVCBoardDTO dto) { int result = 0; String
	 * query = "delete from board where num=?";
	 * 
	 * try { psmt = con.prepareStatement(query); psmt.setString(1, dto.getNum());
	 * result = psmt.executeUpdate();
	 * 
	 * } catch(Exception e) { e.printStackTrace(); System.out.println("게시물 삭제 실패");
	 * }
	 * 
	 * return result; }
	 */



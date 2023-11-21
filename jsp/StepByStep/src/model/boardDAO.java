package model;

import java.util.ArrayList;
import java.util.List;

import common.DBConnector;

public class boardDAO extends DBConnector {
	
	// 게시판 등록
	public int InsertBoard(boardDTO dto) {
		int result = 0;
		String INSERT_BOARD_SQL = "insert into crewboard values(0, ?, ?, ?, ?, ?, ?)";
		
		try {
			psmt = con.prepareStatement(INSERT_BOARD_SQL);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getNickname());
			psmt.setString(3, dto.getCreated());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getCategory());
			psmt.setString(6, dto.getImgName());
			result = psmt.executeUpdate();
			
			System.out.println("InsertBoard 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("InsertBoard 실패");
		}
		
		return result;
	}
	
	
	// 게시판 전체 불러오기
	public List<boardDTO> SelectAllBoard() {
		List<boardDTO> boardlist = new ArrayList<boardDTO>();
		String SELECT_ALLBOARD_SQL = "select *, (select count(*) from recommend where no=crewboard.no) as count from crewboard";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(SELECT_ALLBOARD_SQL);
			
			while(rs.next()) {
				boardDTO dto = new boardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setNickname(rs.getString("nickname"));
				dto.setCreated(rs.getString("created"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				dto.setImgName(rs.getString("imgName"));
				dto.setCount(rs.getInt("count"));
				boardlist.add(dto);
				System.out.println("SelectAllBoard 성공");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("SelectAllBoard 실패");
		}
		
		
		return boardlist;
	}

	
	// 카테고리별 게시판 불러오기
	public List<boardDTO> SelectCategoryBoard(String category) {
		List<boardDTO> boardlist = new ArrayList<boardDTO>();
		String SELECT_CATEBOARD_SQL = "select * from crewboard where category = ?";
		
		try {
			psmt = con.prepareStatement(SELECT_CATEBOARD_SQL);
			psmt.setString(1, category);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				boardDTO dto = new boardDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setNickname(rs.getString("nickname"));
				dto.setCreated(rs.getString("created"));
				dto.setCreated(rs.getString("content"));
				dto.setCreated(rs.getString("category"));
				dto.setCreated(rs.getString("imgName"));
				boardlist.add(dto);
			}
			System.out.println("SelectAllBoard 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("SelectAllBoard 실패");
		}
		
		
		return boardlist;
	}
	
	
}

package model;

import java.util.ArrayList;
import java.util.List;

import common.DBConnector;

public class boardDAO extends DBConnector {
	
	// 게시판 등록
	public int insertBoard(boardDTO dto) {
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
	public List<boardDTO> selectAllBoard() {
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
	public List<boardDTO> selectCategoryBoard(String category) {
		List<boardDTO> boardlist = new ArrayList<boardDTO>();
		String SELECT_CATEBOARD_SQL = "select *, (select count(*) from recommend where no=crewboard.no) as count from crewboard where category = ?";
		
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
				dto.setCount(rs.getInt("count"));
				boardlist.add(dto);
			}
			System.out.println("SelectAllBoard 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("SelectAllBoard 실패");
		}
		
		
		return boardlist;
	}
	
	// 한개의 게시판 상세보기 불러오기
	public boardDTO selectBoard(int no) {
		boardDTO dto = new boardDTO();
		String SELECT_BOARD_SQL = "select *, (select count(*) from recommend where no=crewboard.no) as count from crewboard where no = ?";
		
		try {
			psmt = con.prepareStatement(SELECT_BOARD_SQL);
			psmt.setInt(1, no);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setNickname(rs.getString("nickname"));
				dto.setCreated(rs.getString("created"));
				dto.setContent(rs.getString("content"));
				dto.setCategory(rs.getString("category"));
				dto.setImgName(rs.getString("imgName"));
				dto.setCount(rs.getInt("count"));
				
			}
			
			System.out.println("selectBoard 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("selectBoard 실패");
		}
	
		return dto;
	}
	
	
	public int deleteBoard(int no) {
		int result = 0;
		String DELETE_BOARD_SQL = "delete from crewboard where no = ?";
		
		try {
			psmt = con.prepareStatement(DELETE_BOARD_SQL);
			psmt.setInt(1, no);
			result = psmt.executeUpdate();
			System.out.println("deleteBoard 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("deleteBoard 실패");
		}
		return result;
		
	}
	
	
	public int editBoard(boardDTO dto) {
		int result = 0;
		String EDIT_BOARD_SQL = "update crewboard set created = ?, content = ?, category = ?, imgName = ? where no = ?";
	
		try {
			psmt = con.prepareStatement(EDIT_BOARD_SQL);
			psmt.setString(1, dto.getCreated());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getCategory());
			psmt.setString(4, dto.getImgName());
			psmt.setInt(5, dto.getNo());
			result = psmt.executeUpdate();
			
			System.out.println("editBoard 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("editBoard 실패");
		}
		return result;
	}
	
}
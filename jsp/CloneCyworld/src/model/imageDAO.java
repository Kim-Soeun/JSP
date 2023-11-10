package model;

import java.util.ArrayList;
import java.util.List;

import common.DBConnector;

public class imageDAO extends DBConnector {

	
	// 사진첩 등록
	public int InsertImage(imageDTO dto) {
		int result = 0;

		String INSERT_IMAGE_SQL = "insert into images values(null, ?, ?, ?, ?, ?)";
		
		try {
			psmt = con.prepareStatement(INSERT_IMAGE_SQL);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getCreated());
			psmt.setString(5, dto.getImgName());
			result = psmt.executeUpdate();
			
			System.out.println("InsertImage 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("InsertImage 실패");
		}
		
		return result;
	}
	
	
	// 사진첩 불러오기
	public List<imageDTO> SelectImages(String id) {
		List<imageDTO> lists = new ArrayList<imageDTO>();

		String SELECT_IMAGES_SQL = "select * from images where id = ? order by no desc";
		
		try {
			psmt = con.prepareStatement(SELECT_IMAGES_SQL);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				imageDTO dto = new imageDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setCreated(rs.getString("created"));
				dto.setImgName(rs.getString("imgName"));
				lists.add(dto);
			}
			
			System.out.println("SelectImages 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("SelectImages 실패");
		}
		
		return lists;
	}
	
	
	// 오늘 업데이트된 사진첩 갯수 불러오기
	public int ImageCount(String ownerId, String created) {
		int result = 0;
		
		String IMAGE_COUNT_SQL = "select count(*) from images where created like ? and id = ?";
		
		try {
			psmt = con.prepareStatement(IMAGE_COUNT_SQL);
			psmt.setString(1, created + "%");
			psmt.setString(2, ownerId);
			rs = psmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
			
			System.out.println(result);
			System.out.println("ImageCount 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("ImageCount 실패");
		}
		
		return result;
	}
	
	
	// 사진첩 삭제
	public int DeleteImage(String id, int no) {
		int result = 0;
		
		String DELETE_IMAGE_SQL = "delete from images where id = ? and no = ?";
		
		try {
			psmt = con.prepareStatement(DELETE_IMAGE_SQL);
			psmt.setString(1, id);
			psmt.setInt(2, no);
			result = psmt.executeUpdate();
			
			System.out.println("DeleteImage 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("DeleteImage 실패");
		}
		
		return result;
	}
	
}

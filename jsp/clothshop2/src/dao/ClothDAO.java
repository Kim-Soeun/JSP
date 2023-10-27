package dao;

import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;
import dto.ClothDTO;

public class ClothDAO extends JDBConnect {
	
	public ClothDAO() {
		super();
	}
	
	
	public void addCloth(ClothDTO dto) {
		String sql = "insert into clothinfo values(?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getClothId());
			psmt.setString(2, dto.getClothType());
			psmt.setString(3, dto.getClothSize());
			psmt.setInt(4, dto.getClothPrice());
			psmt.setString(5, dto.getClothFile());
			psmt.executeUpdate();
			
			System.out.println("상품 추가 성공");
		} catch(Exception e) {
			System.out.println("상품 추가 실패");
			e.printStackTrace();
		}
	}
	
	
	public List<ClothDTO> selectList() {
		List<ClothDTO> clothList = new ArrayList<ClothDTO>();
		
		String sql = "select * from clothinfo";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				ClothDTO dto2 = new ClothDTO();
				dto2.setClothId(rs.getString("clothId"));
				dto2.setClothType(rs.getString("clothType"));
				dto2.setClothSize(rs.getString("clothSize"));
				dto2.setClothPrice(rs.getInt("clothPrice"));
				dto2.setClothFile(rs.getString("clothFile"));
				clothList.add(dto2);
			}
			
			System.out.println("모든 정보 가져오기 성공");
		} catch(Exception e) {
			System.out.println("모든 정보 가져오기 실패");
			e.printStackTrace();
		}
		
		
		return clothList;
	}

}

package dto;

import java.util.ArrayList;

import common.JDBConnect;

public class ProductRepository extends JDBConnect {

	private ArrayList<Product> listOfProducts = new ArrayList();
	// 싱글톤 : 하나의 객체를 만들어서 정보 공유
	// 예를 들어, '회사'라는 클래스를 생성하고 '회사명','회사 위치' 등의 정보 데이터 변수 생성한다면
	// 다른 클래스에서 '회사'클래스에 접근할 때 getter, setter로 접근하여 수정 또는 반환하여 사용
	// 이럴 경우 다른 클래스에서 각자 인스턴스를 생성하면 다른 클래스끼리 '회사'클래스 정보를 공유하기 어려움
	// 이러한 이유로 싱글톤 사용
	
	
	public ProductRepository() {
		super();
		
	}
	
	
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {
		Product productById = null;
		
		for(int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if(product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		
		return productById;
	}
	
	public void selectProduct() {
		String sql = "select * from product2";
		 try {
			 stmt = con.createStatement();
			 rs = stmt.executeQuery(sql);
			 
			 while(rs.next()) {
				 Product product = new Product();
				 product.setProductId(rs.getString(1));
				 product.setPname(rs.getString(2));
				 product.setUnitPrice(rs.getInt(3));
				 product.setDescription(rs.getString(4));
				 product.setManufacturer(rs.getString(5));
				 product.setCategory(rs.getString(6));
				 product.setUnitsInStock(rs.getLong(7));
				 product.setCondition(rs.getString(8));
				 listOfProducts.add(product);
				 
			 }
			 	System.out.println("상품목록 추출 성공");
		 } catch(Exception e) {
			 e.printStackTrace();
			 System.out.println("상품목록 추출 실패");
		 }
	}
	
	public int addProduct(Product product) {
		int result = 0;
		
		String sql = "insert into product2 values(?,?,?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, product.getProductId());
			psmt.setString(2, product.getPname());
			psmt.setInt(3, product.getUnitPrice());
			psmt.setString(4, product.getDescription());
			psmt.setString(5, product.getManufacturer());
			psmt.setString(6, product.getCategory());
			psmt.setLong(7, product.getUnitsInStock());
			psmt.setString(8, product.getCondition());
			result = psmt.executeUpdate();
			
			System.out.println("상품 등록 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("상품 등록 실패");
		}
		
		return result;
	}
	
	
	public int deleteProduct(String id) {
		int result = 0;
		
		String sql = "delete from product2 where p_id=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			result = psmt.executeUpdate();
			
			System.out.println("상품삭제 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("상품삭제 실패");
		}
		
		return result;
	}
	
	
	
}

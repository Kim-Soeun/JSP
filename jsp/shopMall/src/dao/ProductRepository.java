package dao;

import java.util.ArrayList;

import org.eclipse.jdt.core.compiler.CategorizedProblem;

import common.JDBConnect;
import dto.Product;

public class ProductRepository extends JDBConnect {

	private ArrayList<Product> listOfProducts = new ArrayList();
	// 싱글톤 : 하나의 객체를 만들어서 정보 공유
	// 예를 들어, '회사'라는 클래스를 생성하고 '회사명','회사 위치' 등의 정보 데이터 변수 생성한다면
	// 다른 클래스에서 '회사'클래스에 접근할 때 getter, setter로 접근하여 수정 또는 반환하여 사용
	// 이럴 경우 다른 클래스에서 각자 인스턴스를 생성하면 다른 클래스끼리 '회사'클래스 정보를 공유하기 어려움
	// 이러한 이유로 싱글톤 사용
	
	// 기본 생성자로 db 연결
	public ProductRepository() {
		super();
		
	}
		
	// db 에 있는 자료로 상품 목록 생성
	public void selectProduct() {
		String query = "select * from product";
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Product dto = new Product();
				dto.setProductId(rs.getString(1));
				dto.setPname(rs.getString(2));
				dto.setUnitPrice(rs.getInt(3));
				dto.setDescription(rs.getString(4));
				dto.setCategory(rs.getString(5));
				dto.setManufacturer(rs.getString(6));
				dto.setUnitsInStock(rs.getLong(7));
				dto.setCondition(rs.getString(8));
				dto.setProductImage(rs.getString(9));
				listOfProducts.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("모든 정보 가져오기 실패");
		}
	}
	
	
	// 전체 상품 목록 가져오기
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
	
	public int addProduct(Product product) {
		int result = 0;
		String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
		
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
			psmt.setString(9, product.getProductImage());
			result = psmt.executeUpdate();
			
			System.out.println("상품등록 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("상품등록 실패");
		}
		
		return result;
		
	}
	
	public int deleteProduct(String pid) {
		int result = 0;
		
		String sql = "delete from product where p_id=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pid);
			result = psmt.executeUpdate();
			System.out.println("상품삭제 성공");
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("상품삭제 실패");
		}
		
		return result;
	}
}

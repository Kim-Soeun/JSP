package dto;

import java.util.ArrayList;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList();
	private static ProductRepository instance = new ProductRepository();
	// 싱글톤 : 하나의 객체를 만들어서 정보 공유
	// 예를 들어, '회사'라는 클래스를 생성하고 '회사명','회사 위치' 등의 정보 데이터 변수 생성한다면
	// 다른 클래스에서 '회사'클래스에 접근할 때 getter, setter로 접근하여 수정 또는 반환하여 사용
	// 이럴 경우 다른 클래스에서 각자 인스턴스를 생성하면 다른 클래스끼리 '회사'클래스 정보를 공유하기 어려움
	// 이러한 이유로 싱글톤 사용
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		
		Product phone = new Product("P1234", "아이폰 14Pro Max", 1600000);
		phone.setDescription("6.7인치 OLED 디스플레이, 후면 카메라 3대, 전면 카메라 1대");
		phone.setCategory("스마트폰");
		phone.setManufacturer("애플");
		phone.setUnitsInStock(1000);
		phone.setCondition("신상품");
		
		Product notebook = new Product("P1235", "LG PC그램", 1200000);
		notebook.setDescription("15.6인치 AMOLED 디스플레이, i5 12세대 중고노트북");
		notebook.setCategory("노트북");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(30);
		notebook.setCondition("중고상품");
		
		Product tablet = new Product("P1236", "삼성탭9 플러스", 1100000);
		tablet.setDescription("12.4인치 AMOLED 디스플레이, 안드로이드13");
		tablet.setCategory("태블릿");
		tablet.setManufacturer("삼성");
		tablet.setUnitsInStock(100);
		tablet.setCondition("재생품");
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
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
	
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
}

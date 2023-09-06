package dto;

import java.util.ArrayList;

public class ClothesRepository {

	ArrayList<Cloth> listOfClothes = new ArrayList(); 
	
	public ClothesRepository() {
		
		Cloth clothes1 = new Cloth();
		clothes1.setClothId("S1234");
		clothes1.setClothName("트위드 자켓");
		clothes1.setClothCost(240000);
		clothes1.setClothSize(95);
		clothes1.setClothColor("navy");

		
		Cloth clothes2 = new Cloth();
		clothes2.setClothId("S1235");
		clothes2.setClothName("베이직 코튼 셔츠");
		clothes2.setClothCost(79200);
		clothes2.setClothSize(90);
		clothes2.setClothColor("blue");

		
		Cloth clothes3 = new Cloth();
		clothes3.setClothId("S1236");
		clothes3.setClothName("후드티");
		clothes3.setClothCost(76450);
		clothes3.setClothSize(95);
		clothes3.setClothColor("black");
		
		listOfClothes.add(clothes1);
		listOfClothes.add(clothes2);
		listOfClothes.add(clothes3);
		
		
	}
	
	public ArrayList<Cloth> getAllProducts() {
		return listOfClothes;
	}
	
	public Cloth getProductById(String clothId) {
		Cloth clothById = null;
		
		for(int i=0; i<listOfClothes.size(); i++) {
			Cloth cloth = listOfClothes.get(i);
			if(cloth.getClothId().equals(clothId)) {
				clothById = cloth;
				break;
			}
			
		}
		return clothById;
	}
	
}

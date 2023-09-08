package dto;

import java.util.ArrayList;

public class ShoesRepository {
	
	ArrayList<Shoes> listOfShoes = new ArrayList<Shoes>();
	
	public ShoesRepository() {
		
		Shoes shoes1 = new Shoes();
		shoes1.setShoesId("S1111");
		shoes1.setShoesName("아디다스 삼바 클라우드");
		shoes1.setShoesBrand("ADIDAS");
		shoes1.setShoesColor("WHITE");
		shoes1.setShoesPrice(230000);

		
		Shoes shoes2 = new Shoes();
		shoes2.setShoesId("S1112");
		shoes2.setShoesName("뉴발란스 574 레거시");
		shoes2.setShoesBrand("NEW BALANCE");
		shoes2.setShoesColor("NAVY");
		shoes2.setShoesPrice(130000);

		
		Shoes shoes3 = new Shoes();
		shoes3.setShoesId("S1113");
		shoes3.setShoesName("나이키 데이브레이크");
		shoes3.setShoesBrand("NIKE");
		shoes3.setShoesColor("GREY");
		shoes3.setShoesPrice(135000);
		
		listOfShoes.add(shoes1);
		listOfShoes.add(shoes2);
		listOfShoes.add(shoes3);

		
	}

	
	public ArrayList<Shoes> getAllShoes() {
		return listOfShoes;
	}
	
	public Shoes getShoesById(String shoesId) {
		Shoes shoesById = null;
		
		for(int i=0; i<listOfShoes.size(); i++) {
			Shoes shoes = listOfShoes.get(i);
			if(shoes.getShoesId().equals(shoesId)) {
				shoesById = shoes;
				break;
			}
		}
		return shoesById;
	}
	
}

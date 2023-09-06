package dto;

import java.util.ArrayList;

public class CarRepository {

	ArrayList<Car> listOfCars = new ArrayList();

	public CarRepository() {
		
		
		Car car1 = new Car();
		car1.setCarId("A1111");
		car1.setCarName("포르쉐 911 카레라");
		car1.setCarCompany("포르쉐");
		car1.setCarColor("Ivory");
		car1.setCarCost(152500000);

		
		Car car2 = new Car();
		car2.setCarId("A1112");
		car2.setCarName("랜드로바 디스커버리");
		car2.setCarCompany("랜드로버");
		car2.setCarColor("gray");
		car2.setCarCost(120000000);

		
		Car car3 = new Car();
		car3.setCarId("A1113");
		car3.setCarName("벤츠 E클래스");
		car3.setCarCompany("벤츠");
		car3.setCarColor("white");
		car3.setCarCost(94000000);
		
		
		
		listOfCars.add(car1);
		listOfCars.add(car2);
		listOfCars.add(car3);
		
	}
	
		public ArrayList<Car> getAllCars() {
			return listOfCars;
		}
		
		public Car carById(String carId) {
			Car carById = null;
			
			for(int i=0; i<listOfCars.size(); i++) {
				Car car = listOfCars.get(i);
				if(car.getCarId().equals(carId)) {
					carById = car;
				}
			}
			return carById;
		}
		
}

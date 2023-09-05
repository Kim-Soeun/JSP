package common;

public class Person {

	// DTO(데이터 전송 객체)
	// DTO는 자바빈즈 규약에 따름
	
	// 1. 기본 패키지 이외의 패키지에 속해야 함
	// 2. 멤버 변수는 private로 선언
	// 3. 기본 생성자 있어야 함
	// 4. 멤버 변수에 접근할 수 있는 게터/세터 메소드 있어야 함
	// 5. 게터 / 세터 메소드의 접근 지정자는 public으로 선언
	
	private String name;		    // 멤버변수는 private 선언
	private int age;
	
	public Person() {			   	//기본 생성자
		
	}
	
	
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}


	public String getName() {		// 게터, 세터
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}
	
	
}

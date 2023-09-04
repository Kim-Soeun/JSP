package dto;

import java.util.ArrayList;

public class BookRepository {
	
	private ArrayList<Book> listOfBooks = new ArrayList();
	
	public BookRepository() {
		
		Book book1 = new Book();
		book1.setBookId("A001");
		book1.setBookName("아주 희미한 빛으로도");
		book1.setBookPrice(16800);
		book1.setAuthor("최은영");
		book1.setDescription("최은영 작가의 3번째 소설집");
		
		Book book2 = new Book();
		book2.setBookId("A002");
		book2.setBookName("비가 오면 열리는 상점");
		book2.setBookPrice(15000);
		book2.setAuthor("유영광");
		book2.setDescription("판타지와 성장소설의 결합");
		
		Book book3 = new Book();
		book3.setBookId("A003");
		book3.setBookName("푸른 사자 와니니");
		book3.setBookPrice(12000);
		book3.setAuthor("이현");
		book3.setDescription("90만 독자가 선택한 베스트셀러");
		
		listOfBooks.add(book1);
		listOfBooks.add(book2);
		listOfBooks.add(book3);
		
	}
	
	public ArrayList<Book> getAllBooks() {
		return listOfBooks;
	}

}

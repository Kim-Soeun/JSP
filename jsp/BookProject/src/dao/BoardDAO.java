package dao;

import java.util.ArrayList;
import java.util.List;

import common.JDBConnect;
import dto.BoardDTO;

public class BoardDAO extends JDBConnect {

	public BoardDAO() {
		super();
	}
	
	public List<BoardDTO> selectList() {
		List<BoardDTO> booklists = new ArrayList<BoardDTO>();
		
		String query = "select * from bookinfo order by bookid desc";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBookid(rs.getString(1));
				dto.setAuthor(rs.getString(2));
				dto.setBooktitle(rs.getString(3));
				dto.setBookcontent(rs.getString(4));
				dto.setBookprice(rs.getInt(5));
				dto.setBookdate(rs.getString(6));
				dto.setMemberid(rs.getString(7));
				booklists.add(dto);
			}
			
			System.out.println("도서 정보 불러오기 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("도서 정보 불러오기 실패");
		}
		
		return booklists;
	}
	
	public int insertBook(String bookid, String author, String title, String content, int price,
			String date, String memberid) {
		int result = 0;
		
		String sql = "insert into bookinfo values(?,?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, bookid);
			psmt.setString(2, author);
			psmt.setString(3, title);
			psmt.setString(4, content);
			psmt.setInt(5, price);
			psmt.setString(6, date);
			psmt.setString(7, memberid);
			result = psmt.executeUpdate();
			
			System.out.println("도서 추가 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("도서 추가 실패");
		}
		
		return result;
	}
	
	public BoardDTO selectBook(String bookid) {
		BoardDTO dto = new BoardDTO();
		
		String sql = "select * from bookinfo where bookid=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, bookid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setBookid(rs.getString("bookid"));
				dto.setAuthor(rs.getString("author"));
				dto.setBooktitle(rs.getString("booktitle"));
				dto.setBookcontent(rs.getString("bookcontent"));
				dto.setBookprice(rs.getInt("bookprice"));
				dto.setBookdate(rs.getString("bookdate"));
				dto.setMemberid(rs.getString("memberid"));
			} 
			System.out.println("도서 정보 불러오기 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("도서 정보 불러오기 실패");
		}
		return dto;
	}
	
	
	public int updateBook(String author, String title, String content, String bookid) {
		int result = 0;
		
		String sql = "update bookinfo set author=?, booktitle=?, bookcontent=? where bookid=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, author);
			psmt.setString(2, title);
			psmt.setString(3, content);
			psmt.setString(4, bookid);
			rs = psmt.executeQuery();
			rs = 
			
			System.out.println("도서 정보 수정 성공");
			System.out.println(result);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("도서 정보 수정 실패");
		}
		
		
		return result;
	}
	
}

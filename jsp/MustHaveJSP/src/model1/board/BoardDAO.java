package model1.board;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {
	
	// JDBConnect 클래스 상속 후, application 내장 객체를 받는 생성자를 이용
	// 매개변수로 받은 application 내장 객체를 통해 
	// web.xml에 정의해둔 오라클 접속 정보를 직접 가져와 DB에 연결해줌
	
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
}

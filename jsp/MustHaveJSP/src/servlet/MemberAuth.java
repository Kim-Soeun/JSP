package servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;
import membership.MemberDTO;

public class MemberAuth extends HttpServlet {
	MemberDAO dao;
	
	
	// 서블릿을 초기화해줄 init 메소드 생성
	@Override
	public void init() throws ServletException {
		// application 내장 객체 가져옴
		ServletContext application = this.getServletContext();
		
		// web.xml에 등록한 컨텍스트 초기화 매개변수 중 DB 연결 정보들을 읽음
		String driver = application.getInitParameter("OracleDriver");
		String connectUrl = application.getInitParameter("OracleURL");
		String oId = application.getInitParameter("OracleId");
		String oPass = application.getInitParameter("OraclePwd");
		
		// 위 정보를 인수로 건네 MemberDAO 객체 생성
		dao = new MemberDAO(driver, connectUrl, oId, oPass);
	}

	
	public void destroy() {
		dao.close();
	}

	
	
	// 클라이언트의 요청을 처리할 service() 메소드 정의
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서블릿 초기화 매개변수에서 관리자 ID 받기
		String admin_id = this.getInitParameter("admin_id");
		
		// 인증을 요청한 ID/패스워드
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		// 회원 테이블에서 인증 요청한 ID/패스워드에 해당하는 회원 찾기
		MemberDTO memberDTO = dao.getMemberDTO(id, pass);
		
		// 찾은 회원의 이름에 따른 처리
		String memberName = memberDTO.getName();
		
		if(memberName != null) {	// 일치하는 회원 찾음
			request.setAttribute("authMessage", memberName + "회원님 반갑습니다!");
		} else {					// 일치하는 회원 없음
			if(admin_id.equals(id)) {   // 관리자
				request.setAttribute("authMessage", admin_id + "는 최고 관리자입니다");
			} else {					// 비회원
				request.setAttribute("authMessage", "귀하는 회원이 아닙니다");
			}
		}
		request.getRequestDispatcher("/13Servlet/MemberAuth.jsp").forward(request, response);
		
	}

}

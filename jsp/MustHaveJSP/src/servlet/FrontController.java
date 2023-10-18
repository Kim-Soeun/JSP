package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.one")
// URL 패턴이 "*.one"에 해당하는 요청을 모두 이 서블릿과 매핑함
// 그러면 ".one"으로 끝나는 모든 요청명이 매핑됨
public class FrontController extends HttpServlet {
       
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// request 내장 객체로부터 현재 경로에서 호스트명을 제외한 나머지 부분을 알아냄
		String uri = request.getRequestURI();
		// 마지막 슬래시(/)의 인덱스를 구함
		int lastSlash = uri.lastIndexOf("/");
		// 이 인덱스로 경로의 마지막 부분의 문자열을 얻어옴
		String commandStr = uri.substring(lastSlash);
		// 이 문자열 통해 페이지를 구분하여, 각 페이지를 처리할 수 있는 메소드를 호출
		
		
		if(commandStr.equals("/regist.one"))
			registFunc(request);
		else if(commandStr.equals("/login.one"))
			loginFunc(request);
		else if(commandStr.equals("/freeboard.one"))
			freeboardFunc(request);
		
		
		request.setAttribute("uri", uri);
		request.setAttribute("commandStr", commandStr);
		request.getRequestDispatcher("/13Servlet/FrontController.jsp").forward(request, response);
	}
	
	void registFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>회원가입</h4>");
	}
	
	void loginFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>로그인</h4>");
	}
	
	void freeboardFunc(HttpServletRequest req) {
		req.setAttribute("resultValue", "<h4>자유게시판</h4>");
	}

}

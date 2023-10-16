package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DirectServletPrint extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
		// response.getWriter()가 반환한 출력 스트림을 PrintWriter 객체로 감싸서 변수 writer에 할당
		// writer 객체를 사용하여 서블릿이 생성한 내용(HTML 코드, 텍스트 등)을 클라이언트로 보낼 수 있음 
		
		//예) writer.println("<h1>Hello, World!</h1>"); 라고 코드를 작성
		// "Hello, World!"라는 큰 제목을 포함한 HTML 요소를 클라이언트로 보낼 수 있음
		
		writer.println("<html>");
		writer.println("<body>");
		writer.println("<h2>서블릿에서 직접 출력</h2>");
		
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
	}


}

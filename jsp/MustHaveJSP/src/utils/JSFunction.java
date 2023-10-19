package utils;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

public class JSFunction {
	
	// 메시지 알림창을 띄운 후 특정 페이지로 이동하는 자바스크립트 코드를 추가해주는 메소드들 담고 있음
	
	
	// 메시지 알림창을 띄운 후 명시한 URL로 이동
	// msg : 알림창에 띄울 메시지
	// url : 알림창을 닫은 후 이동할 페이지의 url
	// out : 자바스크립트 코드를 삽입할 출력 스트림(JSP의 out 내장객체)
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = "<script> "
					+ "alert('" + msg + "'); "
					+ "location.href='" + url +"';" 
					+ "</script>";
			out.println(script);
		} catch(Exception e) {}
	}
	
	
	// 메시지 알림창을 띄운 후 이전 페이지로 돌아감
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = ""
					+ "<script> "
					+ "alert('" + msg + "'); "
					+ "history.back();"
					+ "</script>";
			out.println(script);
		} catch(Exception e) {}
	}
	
	
	
	public static void alertLocation(HttpServletResponse resp, String msg, String url) {
		// HttpServletResponse를 사용하는 이유는 
		// 클라이언트에게 동적인 응답을 보내기 위해 필요한 PrintWriter를 얻기 위해서
		// PrintWriter : 클라이언트에게 전송할 JavaScript 코드를 응답으로 보냄
		// 메시지를 경고창으로 띄우고 이전 페이지로 되돌아가는 동작을 수행
		
		try {
			resp.setContentType("text/html;charset=utf8");
			PrintWriter writer = resp.getWriter();
			String script = "<script> "
					+ "alert('" + msg + "'); "
					+ "location.href='" + url +"';" 
					+ "</script>";
			writer.println(script);
		} catch(Exception e) {}
	}
	
	
	public static void alertBack(HttpServletResponse resp, String msg) {
		try {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter writer = resp.getWriter();
			String script = ""
					+ "<script> "
					+ "alert('" + msg + "'); "
					+ "history.back();"
					+ "</script>";
			writer.println(script);
		} catch(Exception e) {}
	}
	
}

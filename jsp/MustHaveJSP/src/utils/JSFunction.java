package utils;

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
	
}

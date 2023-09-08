package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// 쿠키를 읽을 때 쿠키를 배열로 가져오기 때문에 반복문과 조건문 필요
// 쿠키를 편리하게 사용할 수 있게 도와주는 클래스 


public class CookieManager {

	
	// 명시한 이름, 값, 유지 기간 조건으로 새로운 쿠키를 생성
	// 4개의 매개변수를 받아 쿠키를 만들어 응답 헤더에 추가
	public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
	// HttpServletResponse : jsp 내장 객체인 response를 가져다 쓰기 위해 import해서 사용
		Cookie cookie = new Cookie(cName, cValue);  // 쿠키 생성
		cookie.setPath("/");						// 경로 설정
		// "/" : 현재 이 프로젝트를 의미
		cookie.setMaxAge(cTime);					// 유지 기간 설정
		response.addCookie(cookie);					// 응답 객체에 추가
		
	}
	
	
	// 명시한 이름의 쿠키를 찾아 그 값을 반환
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue="";
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				String cookieName = c.getName();
				if(cookieName.equals(cName)) {
					cookieValue = c.getValue();
				}
			}
		}
		return cookieValue;
	}
	
	
	// 명시한 이름의 쿠키를 삭제
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response, cName, "", 0);
	}
}

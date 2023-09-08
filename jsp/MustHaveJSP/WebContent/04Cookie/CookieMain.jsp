<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 1. 쿠키 설정 </h2>
	<%
		Cookie cookie = new Cookie("myCookie", "애플쿠키맛있당");
		// 쿠키는 내장되어 있기 때문에 import 할 필요 없음
		// 쿠키를 구별하는 이름과 값 저장
		
		cookie.setPath(request.getContextPath());
		// ex) cookie.setPath("http://www.naver.com");
		// setPath : 네이버 로그인 할 때 쿠키를 사용하겠다는 의미(쿠키가 적용될 경로 지정)

		cookie.setMaxAge(60*60);		
		// 쿠키가 유지될 기간을 초단위로 설정
		// 1시간 유지
		
		response.addCookie(cookie);
		// 응답 헤더에 쿠키 추가
		// 클라이언트의 웹 브라우저가 쿠키(cookie)를 저장, 이렇게 하면 이후에 클라이언트 측에서 해당 쿠키를 사용
	%>
	
	<h2> 2. 쿠키 설정 후 값 확인하기 </h2>
	<%
		Cookie[] cookies = request.getCookies();
		if( cookies != null ) {
			for(Cookie c : cookies) {
				String cookieName = c.getName();
				String cookieValue = c.getValue();
				out.print(cookieName + " : " + cookieValue);
			}
		}
	%>
	
	<h2> 3. 페이지 이동 후 쿠키값 확인하기 </h2>
	<a href="CookieResult.jsp"> 다음 페이지에서 확인하기 </a>
</body>
</html>
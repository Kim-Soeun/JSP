<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.CookieManager" %>
<%@ page import="utils.JSFunction" %>
<%
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String save_check = request.getParameter("save_check");

	if(user_id.equals("java") && user_pw.equals("1234")) {
		// 로그인 성공
		if(save_check != null && save_check.equals("Y")) {
			// 로그인시 아이디, 비번 모두 일치하고 save_check가 체크 되어 있을 경우
			// 쿠키 생성
			CookieManager.makeCookie(response, "loginId", user_id, 86400);
			// 매개변수로 넘겨주는 cTime(MaxAge) 값인 86400은 하루 의미(1초*60*60*24)
		} else {
			// 로그인시 아이디, 비번 모두 일치하지만 save_check가 체크되어 있지 않을 경우
			// 쿠키 삭제
			CookieManager.deleteCookie(response, "loginId");
		} 
		JSFunction.alertLocation("로그인에 성공했습니다", "IdSaveMain.jsp", out);
	}
	else {
		// 로그인 실패
		JSFunction.alertBack("로그인에 실패했습니다", out);
	}
%>

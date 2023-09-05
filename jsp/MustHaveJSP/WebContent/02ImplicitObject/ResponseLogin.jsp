<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pwd");
		
		// 웹 파일 변수 불러와서 아이디, 비밀번호 일치 확인하는 방법
		
		String id2 = application.getInitParameter("id");
		// web.xml에 설정한 매개변수 "id" 값을 읽어옴
		String pw2 = application.getInitParameter("pw");
		// web.xml에 설정한 매개변수 "pw" 값을 읽어옴
		
		if(id.equalsIgnoreCase(id2) && pw.equalsIgnoreCase(pw2)) {
			// equalsIgnoreCase : 대소문자 구분없이 비교할 때 사용
			response.sendRedirect("ResponseWelcome.jsp");
			// 인증에 성공하면 "ResponseWelcome.jsp" 페이지로 이동
		} else {
			request.getRequestDispatcher("ResponseMain.jsp?loginErr=1").forward(request,response);
			// 인증 실패하면 ResponseMain.jsp 페이지로 사용자를 보내고 
			// loginErr=1 파라미터를 추가하여 로그인 오류 메시지를 표시
		}
		
		
		
/*		// 웹파일 사용하지 않고 아이디, 비밀번호 설정한 방법
		if(id.equalsIgnoreCase("java") && pw.equalsIgnoreCase("1234")) {
		// equalsIgnoreCase : 대소문자 구분없이 비교할 때 사용
			response.sendRedirect("ResponseWelcome.jsp");
		// 인증에 성공하면 sendRedirect() 메소드에 건넨 응답 페이지로 이동
		} else {
			request.getRequestDispatcher("ResponseMain.jsp?loginErr=1").forward(request, response);
		// 인증 실패하면 request 내장 객체를 통해 로그인 페이지(ResponseMain.jsp)로 전달(forward)됨
		}
*/
	%>
</body>
</html>
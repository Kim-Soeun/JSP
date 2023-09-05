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
	
		// 버퍼 내용 삭제하기
		out.print("출력되지 않은 텍스트");
		// 버퍼에 저장 
		out.clearBuffer();
		// 버퍼를 비움(윗 줄의 출력 결과 사라짐), 출력 안됨
		
		out.print("<h2>out 내장 객체</h2>");                                                                                                                                    
		
		// 버퍼 크기 정보 확인
		out.print("출력 버퍼의 크기 : " + out.getBufferSize() + "<br>");
		// 현재 페이지에 설정된 버퍼의 크기를 가져옴, 따로 선언하지 않았으면 기본값인 8KB가 됨
		out.print("남은 버퍼의 크기 : " + out.getRemaining() + "<br>");
		// 사용하고 남은 버퍼의 크기를 알려줌
		
		out.flush();
		// 버퍼에 담긴 내용 강제로 출력
		out.print("flush 후 버퍼의 크기 : " + out.getRemaining() + "<br>");
	%>
</body>
</html>
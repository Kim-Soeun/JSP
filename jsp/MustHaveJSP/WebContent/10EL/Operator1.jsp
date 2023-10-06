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
		int num1 = 3;
		pageContext.setAttribute("num2", 4);
		pageContext.setAttribute("num3", "5");
		pageContext.setAttribute("num4", 8);
		pageContext.setAttribute("num5", "가나다");
		pageContext.setAttribute("num6", null);
	%>
	
	<h3> 변수 할당 및 출력 </h3>
		<p><%=num1%></p>
		<p>${num1}</p>
		<!-- EL은 스크립틀릿에서 선언한 변수를 즉시 사용할 수 없음 -->
		<p>${num2}</p>
		<!-- page 영역에 저장된 속성은 정상적으로 출력됨 -->
		<p>${num2+num2}</p>
		<p>${num2+num3}</p>
		<!-- 숫자 + 문자열은 자동으로 숫자로 변환되어 계산됨 -->
		<p>${num4=10}</p>
		<!-- 변수에 값 할당과 동시에 출력됨 -->
		<!-- 4 + "가나다 " = 계산에 문자가 포함되어 있다면 변환이 되지 않으므로 에러 발생 -->
		
		
		<h3> 비교 연산자 </h3>
			<p>${num2 gt num4}</p>
			
			<h3> null 연산자 </h3>
				<p>${num2 + num6}</p>
		<!-- EL에서는 NULL을 0으로 인식하여 예외 발생하지 않음 --> -->
</body>
</html>
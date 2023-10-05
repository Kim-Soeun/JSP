<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	pageContext.setAttribute("scopeValue", "페이지 영역");
	request.setAttribute("scopeValue", "리퀘스트 영역");
	session.setAttribute("scopeValue", "세션 영역");
	application.setAttribute("scopeValue", "애플리케이션 영역");

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 각 영역에 저장된 속성 읽기</h2>
	<ul>
		<li>페이지 영역 : ${pageScope.scopeValue} </li>
		<li>리퀘스트 영역 : ${requestScope.scopeValue} </li>
		<li>세션 영역 : ${sessionScope.scopeValue} </li>
		<li>애플리케이션 영역 : ${applicationScope.scopeValue} </li>
	</ul>
	
	<h2> 영역 지정없이 속성값 읽기 </h2>
	<ul>
		<li> ${scopeValue} </li>
		<!-- 영역 지정잆이 이름만 적어주면 가장 좁은 영역의 값이 출력됨(여기서는 페이지 영역) -->
	</ul>
	
	<jsp:forward page="ImplicitForwardResult.jsp"/>
	<!-- 페이지 영역은 포워드되면 소멸됨 그래서 포워드된 페이지에서는 
	     영역 지정없이 속성값을 읽으면 리퀘스트 영역의 값을 읽음-->
</body>
</html>
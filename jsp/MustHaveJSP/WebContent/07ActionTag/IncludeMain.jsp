<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세 파일의 경로
	String outerPath1 = "inc/OuterPage1.jsp";
	String outerPath2 = "inc/OuterPage2.jsp";
	String outerPath3 = "inc/OuterPage3.jsp";
	
	// page 영역과 request 영역에 속성 저장
	pageContext.setAttribute("pAttr", "동명왕");
	request.setAttribute("rAttr", "온조왕");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 지시어로 페이지 포함하기 </h2>
	<!-- 아래 지시어 받식을 사용하면 파일에 포함된 변수 사용 가능하며 page 영역과 request 영역 모두 공유됨 -->
	<%@ include file="Inc/OuterPage1.jsp"%>
	<p> 외부 파일에 선언한 변수 : <%=newVar1 %>

	<h2> 액션 태그로 페이지 포함하기 </h2>
	<!-- 아래 액션 태그를 사용하면 포함시킨 파일에 생성된 변수 사용 불가(newVar2) -->
	<!-- 액션 태그 사용시 page 영역은 공유되지 않고 request 영역은 공유됨 -->
	<!-- 액션 태그 사용시 태그 꼭 닫아주기!! -->
	<jsp:include page="Inc/OuterPage2.jsp" />
</body>
</html>
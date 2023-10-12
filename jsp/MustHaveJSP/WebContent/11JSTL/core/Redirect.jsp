<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 포워드와 달리 request 영역은 공유되지 않음 -->
<!-- 이동한 페이지에는 c:param으로 전달한 매개변수만 출력됨 -->
	<c:set var="requestVar" value="MustHave" scope="request" />
	<c:redirect url="../inc/OtherPage.jsp">
		<c:param name="user_param1" value="출판사"/>
		<c:param name="user_param2" value="골든래빗"/>
	</c:redirect>



</body>
</html>
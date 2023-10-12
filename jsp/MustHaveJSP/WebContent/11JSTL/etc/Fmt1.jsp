<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4> 숫자 포맷 설정 </h4>
	<c:set var="number1" value="12345"/>
	콤마 O : <fmt:formatNumber value="${number1}"/><br>
	콤마 x : <fmt:formatNumber value="${number1}" groupingUsed="false"/><br>
	통화기호 : <fmt:formatNumber value="${number1}" type="currency"/><br>
	<!-- groupingUsed : 세 자리마다 콤마를 출력할지 여부를 결정, 기본값은 true(콤마 출력) -->
	<fmt:formatNumber value="${number1}" type="percent"/><br>



	<h4> 숫자 패턴 변경 </h4>
	<c:set var="number2" value="6,789.01"/>
	<%-- <fmt:formatNumber type="currency" value="${number2}"/> --%>
	<!-- value가 숫자처럼 보이지만 문자이기 때문에 출력이 안됨, 숫자로 바꿔줘야 함 -->
	
	<fmt:parseNumber value="${number2}"/><br>
	<fmt:parseNumber value="${number2}" pattern="0,000.00" var="print3"/>
	소수점까지 : ${print3}<br>
	<fmt:parseNumber value="${number2}" integerOnly="true" var="print4"/>
	정수만 : ${print4}<br>
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션 태그 - UseBean</title>
</head>
<body>
	<!-- useBean : 자바빈즈 생성 -->
	<!-- id : 자바빈즈 이름, class : 사용할 페이지와 클래스명, scope : 저장될 영역 -->
	<!-- setProperty : 멤버 변수 설정 -->
	<!-- getProperty : 멤버 변수 추출 -->
	<!-- name : 자바빈즈 이름, property : 속성명(멤버 변수), value : 설정할 값 -->
	<!-- scope 기본설정은 page -->
	<h2>useBean 액션 태그</h2>
	
	<h3> 자바빈즈 사용하기 </h3>
	
	<jsp:useBean id="person" class="common.Person" scope="request"/>
	<jsp:setProperty property="name" value="임꺽정" name="person"/>
	<jsp:setProperty property="age" value="40" name="person"/>
	
	<ul>
		<li> 이름 : <jsp:getProperty property="name" name="person"/></li>
		<li> 나이 : <jsp:getProperty property="age" name="person"/></li>
	</ul>
</body>
</html>
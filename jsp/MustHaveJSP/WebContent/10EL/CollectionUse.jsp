<%@page import="common.Car"%>
<%@page import="common.Person"%>
<%@page import="java.util.*"%>
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
		List<Object> aList = new ArrayList<Object>();
		aList.add("청해진");
		aList.add(new Person("장보고", 28));
		aList.add(new Car("소나타", 20000000, "WHITE"));
		pageContext.setAttribute("Ocean", aList);
	%>
	
	<ul>
		<li>0번째 요소 : ${Ocean[0]}</li>
		<li>1번째 요소 : ${Ocean[1].name}, ${Ocean[1].age}</li>
		<li>2번째 요소 : ${Ocean[2].carName}, ${Ocean[2].carPrice}, ${Ocean[2].carColor}</li>
		<li>3번째 요소 : ${Ocean[3]}</li>
		<!-- List 컬렉션에 인덱스 3은 null이기 때문에 아무것도 출력되지 않음, 오류가 뜨지는 않음 -->
	</ul>
	
	<%
		Map<String, String> map = new HashMap<>();
		map.put("한글", "훈민정음");
		map.put("Eng", "English");
		pageContext.setAttribute("King", map);
	%>

	<h2> 맵 컬렉션 </h2>
	<ul>
		<li>영문 : ${King.Eng}</li>
		<li>한글 : ${King["한글"]}, \${King.한글}</li>
		<!-- 영어 아닌 한글이면 .(점)은 사용할 수 없음, 점을 사용하면 에러 뜨기 때문에 "\" 주석처리함 -->
		<!-- 주석 처리하면 일반 HTML 코드로 인식되어 하면에 그대로 출력됨 -->
	</ul>
	
	
</body>
</html>
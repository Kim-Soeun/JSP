<%@page import="java.util.List"%>
<%@page import="dto.StudentDTO"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String grade = request.getParameter("grade");
	int start = 0;
	int end = 101;
	
	if(grade != null){
		switch(grade) {
		case "a" : case "A" :
			start = 90;
			end = 101;
			break;
		case "b" : case "B" :
			start = 80;
			end = 90;
			break;
		case "c" : case "C" :
			start = 70;
			end = 80;
			break;
		case "f" : case "F" :
			end = 70;
		}
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form>
		<table border="1">
			<tr>
			<td>
				학점 : <input type="text" name="grade">
				<input type="submit" value="찾기">
			</td>
			</tr>
		</table>
	</form>

	<table border="1">
	
		<tr>
			<th>학번</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>평균</th>
		</tr>
	
	<%
		StudentDAO dao = new StudentDAO();
	
		List<StudentDTO> lists = dao.allFromGrade(start, end);
		for(StudentDTO dto : lists) {
			double avg = (dto.getKor() + dto.getEng() + dto.getMath()) /3;
			
			
		
	%>
		<c:set var="avg" value="<%=avg%>" scope="request" />
	
		<tr>
			<td><%=dto.getId()%></td>
			<td><%=dto.getKor()%></td>
			<td><%=dto.getEng()%></td>
			<td><%=dto.getMath()%></td>
			<td>
				<c:choose>
					<c:when	test="${avg>=90}">A</c:when>			
					<c:when	test="${avg>=80}">B</c:when>			
					<c:when	test="${avg>=70}">C</c:when>
					<c:otherwise>F</c:otherwise>			
				</c:choose>
			</td>
		</tr>
		
	
	
	<% } %>
	
	</table>
	
</body>
</html>
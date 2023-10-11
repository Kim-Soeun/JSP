<%@page import="java.util.List"%>
<%@page import="dto.StudentDTO"%>
<%@page import="dao.StudentDAO"%>
<%@page import="java.util.ArrayList"%>
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
			String grade = request.getParameter("grade");
			StudentDAO dao = new StudentDAO();
		
		if(grade == null) {
			List<StudentDTO> lists = dao.selectScore();
			
			dao.close();
				
			for(StudentDTO dto : lists) {
				double avg = (dto.getKor() + dto.getEng() + dto.getMath()) / 3;
		%>
		
		<c:set var="avg" value="<%=avg%>"/>
		
		<tr>
			<td><%=dto.getId()%></td>
			<td><%=dto.getKor()%></td>
			<td><%=dto.getEng()%></td>
			<td><%=dto.getMath()%></td>
			<td>
				<c:choose>
					<c:when test="${avg >= 90}">A</c:when>
					<c:when test="${avg >= 80}">B</c:when>
					<c:when test="${avg >= 70}">C</c:when>
					<c:otherwise>F</c:otherwise>
				</c:choose>
			
			</td>
		</tr>
		
		<% } 
		} else {
			List<StudentDTO> lists2 = dao.allFromGrade(grade);
			dao.close();
			
			for(StudentDTO dto2 : lists2) { 
				
		%>
		
		<tr>
			<td><%=dto2.getId()%></td>
			<td><%=dto2.getKor()%></td>
			<td><%=dto2.getEng()%></td>
			<td><%=dto2.getMath()%></td>
			<td><%=dto2.getGrade() %></td>
		</tr>
		
		
		<% } } %>
		
		
	</table>


</body>
</html>
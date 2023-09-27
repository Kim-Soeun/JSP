<%@page import="java.util.List"%>
<%@page import="dto.StudentDTO"%>
<%@page import="dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	StudentDAO dao = new StudentDAO();	// db 연결
	List<StudentDTO> allStudents = dao.selectAll();
	StudentDTO dto2 = dao.selectStudent(name);
	dao.close();						// db 연결 해제

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		아이디 <input type="text" name="name">
		<input type="submit" value="검색"> 
	</form>
	<table border="1">
		<tr>
			<th>이름</th>
			<th>학번</th>
			<th>성별</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>평균</th>
			<th>학점</th>
		</tr>
		<%
			if(name == null) {
		
			for(StudentDTO dto : allStudents) {
		%>
		<tr>
			<td><%=dto.getName() %></td>
			<td><%=dto.getStudentId() %></td>
			<td><%=dto.getGender() %></td>
			<td><%=dto.getKor() %></td>
			<td><%=dto.getEng() %></td>
			<td><%=dto.getMath() %></td>
			<td><%=dto.avg()%></td>
			<td><%=dto.point() %></td>
		</tr>
		<% 
			}
		} else {
		%>
		
		<tr>
			<td><%=dto2.getName() %></td>
			<td><%=dto2.getStudentId() %></td>
			<td><%=dto2.getGender() %></td>
			<td><%=dto2.getKor() %></td>
			<td><%=dto2.getEng() %></td>
			<td><%=dto2.getMath() %></td>
			<td><%=dto2.avg()%></td>
			<td><%=dto2.point()%></td>
		</tr>
		
		
		<% } %>
	</table>
	
	
</body>
</html>
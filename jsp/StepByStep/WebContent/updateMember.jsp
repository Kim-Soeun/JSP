<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="loginCheck.jsp" %>
<%
	MemberDTO dto = (MemberDTO)session.getAttribute("memberDTO");
	String userId = dto.getId();
	MemberDTO memberDTO = new MemberDAO().getMemberById(userId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
</head>
<body>
	<form name="frm" action="UpdateMemberServlet" method="post" enctype="multipart/form-data" onsubmit="return pwCheck()">

		<input type="hidden" name="id" value="<%=memberDTO.getId()%>"><br>

		<label>비밀번호</label>
		<input type="password" id="pw" name="pw" value="<%=memberDTO.getPassword()%>" required><br>

		<label>비밀번호 확인</label>
		<input type="password" id="pwCheck" name="pwCheck" required><br>
		
		<label>이름</label>
		<input type="text" name="name" value="<%=memberDTO.getName()%>" required><br>
		
		<label>생년월일</label>
		<input type="text" name="birthDate" value="<%=memberDTO.getBirthDate()%>" required><br>
			
			
			<!-- 자꾸 오류남 -->
		
    	<%-- <!-- 생년 -->
	    <label for="year">년도:</label>
	    <select name="year" id="year">
	        <c:forEach var="i" begin="${java.time.LocalDate.now().getYear()}" end="${java.time.LocalDate.now().getYear() - 100}" step="-1">
	            <option value="${i}">${i}</option>
	        </c:forEach>
	    </select>
	
	
	
	
	    <!-- 월 -->
	    <label for="month">월:</label>
	    <select name="month" id="month">
	        <c:forEach var="i" begin="1" end="12">
	            <option value="${i}">${i}</option>
	        </c:forEach>
	    </select>
	
	    <!-- 일 -->
	    <label for="day">일:</label>
	    <select name="day" id="day">
	        <c:forEach var="i" begin="1" end="31">
	            <option value="${i}">${i}</option>
	        </c:forEach>
	    </select>
	
	    <br>
	    <input type="submit" value="제출"> --%>
		
		<label>이메일</label>
		<input type="hidden" name="originalEmail" value="<%=memberDTO.getEmail()%>">
		<p><%=memberDTO.getEmail()%></p>
		<input type="text" name="email1"/>@
		<input type="text" name="email2" value=""/>
		<select name="emailList" size="1" onchange="email_check()">
			<option id="write">직접입력</option>
			<option value="naver.com">naver.com</option>
			<option value="gmail.com">gmail.com</option>
			<option value="hanmail.net">hanmail.net</option>
			<option value="nate.com">nate.com</option>
		</select><br>
		
		<label>전화번호</label>
		<input type="text" name="phone" value="<%=memberDTO.getPhone()%>" required><br>
		
		<label>닉네임</label>
		<input type="text" name="nickname" value="<%=memberDTO.getNickname()%>" required><br>
		
		<label>위치</label>
		<input type="hidden" name="originalLocation" value="<%=memberDTO.getLocation()%>">
		<input type="text" name="location"><br>
		
		<label>프로필사진</label>
		<input type="hidden" name="originalImg" value="<%=memberDTO.getProfileImg()%>">
		<input type="file" name="newImg"><br>
		<button type="submit">수정</button>
	</form>
	
<script type="text/javascript" src="./resources/js/register.js"></script>
<script type="text/javascript" src="./resources/js/pwCheck.js"></script>

</body>
</html>
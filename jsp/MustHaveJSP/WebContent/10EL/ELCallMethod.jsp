<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="el.MyElClass"%>

<%
	MyElClass myClass = new MyElClass();
	pageContext.setAttribute("myClass", myClass);
	// 메소드 호출하려면 먼저 객체를 만들어 영역에 저장해야함
	// 그 후 저장된 속성명을 통해 메소드 호출할 수 있음
	
	String jumin = request.getParameter("jumin");
	if(jumin != null) {
		pageContext.setAttribute("gender", myClass.getGender(jumin));
		String email = request.getParameter("mail") + "@" + request.getParameter("domain");
		pageContext.setAttribute("email", myClass.getId(email));
		pageContext.setAttribute("domain", myClass.getDomain(email));
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
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>주빈번호</td>
				<td><input type="text" name="jumin"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="mail">@
					<select name="domain">
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="daum.net">daum.net</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="전송"></td>
			</tr>
		</table>
	</form>


	<h1> EL 태그로 성별 확인 </h1>
	<h3> 철수 : ${myClass.getGender("001225-3123456")}</h3>
	
	<h1> 이름, 성별 확인 </h1>
	<h3> 이름 : ${param.name}</h3>
	<h3> 성별 : ${gender}</h3>
	<h3> 이메일 아이디 : ${email}</h3>
	<h3> 이메일 주소 : ${domain}</h3>
</body>
</html>
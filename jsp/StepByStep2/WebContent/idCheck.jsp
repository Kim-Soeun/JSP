<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>���̵� �ߺ��˻�</title>
</head>
<body>
	<form action="IdCheckServlet" method="get" name="idCheckForm">
		<label>���̵�</label>
		<input type="text" name="id" value="${userId}"/>
		<button type="submit">�ߺ�üũ</button><br>
		
		<c:if test="${result == 1}">
			<p>${userId}�� �̹� ������� ���̵��Դϴ�</p>
		</c:if>
		<c:if test="${result == 0}">
			<p>${userId}�� ��� ������ ���̵��Դϴ�</p>
			<button type="button" onclick="idUseOk()">���</button>
		</c:if>
	</form>
	
<script type="text/javascript" src="./resources/js/register.js"></script>
</body>
</html>
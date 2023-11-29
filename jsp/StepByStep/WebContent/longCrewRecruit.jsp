<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장기크루 모집등록</title>
</head>
<body>

	<form action="./crewRecruit.crew" method="post" name="frm" onsubmit="return isResult()">
		
		<div id="existingCrews" style="display: none;"><c:forEach items="<%=cNameList%>" var="crew">${crew.crewName} </c:forEach></div>
		
		<label>크루명</label>
		<input type="text" id="crewName" name="crewName" required>
		<button type="button" onclick="crewNameCheck()">중복확인</button>
		<div id="warningMessageContainer"></div>
		
		<label>모집인원</label>
		<input type="text" name="memberNum" required><br>
		

		<input type="hidden" name="adminId" value="<%=userId%>">

		<button type="submit">등록</button>
	</form>
	

<script type="text/javascript" src="./resources/js/crew.js"></script>
</body>
</html>
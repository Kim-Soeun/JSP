<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>파라미터 이름</td>
			<td>파라미터 값</td>
		</tr>
		<%
			request.setCharacterEncoding("utf-8");
			Enumeration pNames = request.getParameterNames();
			// request.getParameterNames()이 반환될 때 열거형으로 반환되기 때문에
			// 열거형으로 받음, 그래서 배열을 사용하지 않음
			
			while(pNames.hasMoreElements()) {
				String pName = (String) pNames.nextElement();
				out.print("<tr><td>" + pName + "</td>");
				
				// 값을 하나만 출력할 때 사용하는 방법
				//String value = request.getParameter(pName);
				//out.print("<td>" + value + "</td></tr>");
				
				
				// 값을 여러개 출력할 때 사용하는 방법
				String[] values = request.getParameterValues(pName);
				String values2 = "";
				for(String value : values) {
					values2 += value + " ";
				}
				out.print("<td>" + values2 +  "</td></tr>");
			}
			
		%>	
	</table>
</body>
</html>
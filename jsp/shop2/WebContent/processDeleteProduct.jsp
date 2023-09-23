<%@page import="common.JSFunction"%>
<%@page import="dto.ProductRepository"%>
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
		String id = request.getParameter("id");
		
		ProductRepository dao = new ProductRepository();
		int result = dao.deleteProduct(id);
		
		if(result == 1) {
			JSFunction.alertLocation("상품삭제가 완료되었습니다", "products.jsp", out);
		} else {
			request.getRequestDispatcher("deleteProduct.jsp?error=1").forward(request, response);
		}
	%>
</body>
</html>
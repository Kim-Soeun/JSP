<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="common.JSFunction"%>
<%@page import="java.sql.PseudoColumnUsage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<%
	request.setCharacterEncoding("utf-8");
	/* String productId = request.getParameter("productId");
	String pname = request.getParameter("pname");
	int unitPrice = Integer.parseInt(request.getParameter("unitPrice"));
	// 파라미터 값을 받을 때는 문자열로 받기 때문에 int 형태로 변환해줌
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	long unitsInStock = Long.parseLong(request.getParameter("unitsInStock"));
	String condition = request.getParameter("condition"); */

	
	String saveDirectory = application.getRealPath("/resources/images");
	int maxPostSize = 1024 * 1024 * 5; 		// 파일 최대 용량 5MB
	String encoding = "utf-8";
	
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
	
	String productId = mr.getParameter("productId");
	String pname = mr.getParameter("pname");
	int unitPrice = Integer.parseInt(mr.getParameter("unitPrice"));
	String description = mr.getParameter("description");
	String manufacturer = mr.getParameter("manufacturer");
	String category = mr.getParameter("category");
	long unitsInStock = Long.parseLong(mr.getParameter("unitsInStock"));
	String condition = mr.getParameter("condition");
	String productImage = mr.getFilesystemName("photoImage");
	
	File photoFile = new File(saveDirectory + File.separator + productImage);
	
	
	
	Product product = new Product();
	product.setProductId(productId);
	product.setPname(pname);
	product.setUnitPrice(unitPrice);
	product.setDescription(description);
	product.setManufacturer(manufacturer);
	product.setCategory(category);
	product.setUnitsInStock(unitsInStock);
	product.setCondition(condition);
	product.setProductImage(productImage);
	
	ProductRepository dao = new ProductRepository();
	int result = dao.addProduct(product);
	
	if(result == 1) {
		response.sendRedirect("products.jsp");
	} else { 
		JSFunction.alertLocation("상품등록에 실패했습니다", "addProduct.jsp", out);
	} 
	
	%>
	
	

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
		<c:if test="${empty UserId}" var="isLogout"> 
		<!-- 변수로 지정한 isLogout에는 true가 들어감 -->
				<a class="navbar-brand" href="welcome.jsp">홈</a>
				<a class="navbar-brand" href="login.jsp">로그인</a>
				<a class="navbar-brand" href="addMember.jsp">회원가입</a>
		</c:if>	
		<c:if test="${!isLogout}">     
		
				<a class="navbar-brand" href="welcome.jsp">홈</a>
				<a class="navbar-brand" href="logout.jsp">로그아웃</a>
				<a class="navbar-brand" href="editmember.jsp">회원정보수정</a>
				<a class="navbar-brand" href="deletemember.jsp">회원탈퇴</a>
				<a class="navbar-brand" href="BoardListAction.do?pageNum=1">게시판</a>
		
		</c:if>
			</div>
		</div>
		
		<div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<c:if test="${!isLogout}">
						<a class="navbar-brand" href="products.jsp">상품목록</a>
						<a class="navbar-brand" href="addProduct.jsp">상품추가</a>
						<a class="navbar-brand" href="deleteProduct.jsp">상품삭제</a>
					</c:if>
				</li>
			</ul>
		</div>
</nav>
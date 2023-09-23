<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = (String) session.getAttribute("UserId");
%>


<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<%
					if(user_id == null) {
						// 로그아웃 상태
				%>
						<a class='navbar-brand' href='welcome.jsp'>홈</a>
						<a class='navbar-brand' href='login.jsp'>로그인</a>
						<a class='navbar-brand' href='addmember.jsp'>회원가입</a>
						
				<% 	} else { 
						// 로그인 상태
			    %>
			    	
			    		<a class='navbar-brand' href='logout.jsp'>로그아웃</a>
			    		<a class='navbar-brand' href='editmember.jsp'>회원수정</a>
			    		<a class='navbar-brand' href='deletemember.jsp'>회원탈퇴</a>
						
				<% } %>	
				
			</div>
			
			<div>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item">
						<%
							if(user_id!=null) {
						%>
								<a class='navbar-brand' href='products.jsp'>상품목록</a>
								<a class='navbar-brand' href='addProduct.jsp'>상품등록</a>
								<a class='navbar-brand' href='deleteProduct.jsp'>상품삭제</a>
						<%	}  %>
					</li>
				</ul>
			</div>
		</div>
</nav>
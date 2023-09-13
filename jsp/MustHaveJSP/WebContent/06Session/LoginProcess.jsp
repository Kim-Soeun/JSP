<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 로그인 폼으로부터 받은 아이디와 패스워드
	String userId = request.getParameter("user_id");
	String userPwd = request.getParameter("user_pw");
	
	
	// 회원 테이블 DAO를 통해 회원 정보 DTO 획득
	// MemberDAO 객체 생성(오라클 DB에 접속)
	MemberDAO dao = new MemberDAO();
	// 사용자가 입력한 아이디와 패스워드를 인수로 getMemberDTO() 호출
	MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
	dao.close();
	
	// 로그인 성공 여부에 따른 처리
	if(memberDTO.getId() != null) {
	// DTO 객체에 아이디가 담겨 있다면 로그인 성공
	// 로그인 성공시 session 영역에 아이디와 이름 저장 후 로그인 페이지로 이동
		session.setAttribute("UserId", memberDTO.getId());
		session.setAttribute("UserName", memberDTO.getName());
		response.sendRedirect("LoginForm.jsp");
	} else {
	// 로그인 실패
	// request 영역에 오류 메시지 저장 후, 로그인 페이지로 포워드
	// request 영역에 저장된 속성값은 포워드된 페이지까지 공유됨
		request.setAttribute("LoginErrMsg", "로그인 오류입니다");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
	
%>
    
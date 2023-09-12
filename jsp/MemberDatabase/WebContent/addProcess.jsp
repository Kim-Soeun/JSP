<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.MysqlConnect"%>
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
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String pw2 = request.getParameter("pw2");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String email2 = request.getParameter("domain");
		String msg = request.getParameter("msg");
		String path[] = request.getParameterValues("path");
		String pathStr = "";
		for(int i=0; i<path.length; i++) {
			pathStr = path[i] + " ";
		}
		
		MysqlConnect mc = new MysqlConnect();
		if(!pw.equals(pw2)){
			mc.alertLocation("비밀번호가 다릅니다", "addMember.jsp", out);
		} else {
			String sql = "insert into member values (?,?,?,?,?,?,?,?)";
			PreparedStatement psmt = mc.con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, name);
			psmt.setString(3, pw);
			psmt.setString(4, pw2);
			psmt.setString(5, phone);
			psmt.setString(6, email+email2);
			psmt.setString(7, msg);
			psmt.setString(8, pathStr);
			int result = psmt.executeUpdate();
			
			
			if(result == 1) {
				out.print("정상처리 되었습니다");
			} else {
				out.print("회원 추가에 문제가 발생했습니다");
			}
			mc.close();
		}
		
		%>
</body>
</html>
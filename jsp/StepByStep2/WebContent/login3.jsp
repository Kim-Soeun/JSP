<%@page import="model.LongCrewRecruitDTO"%>
<%@page import="model.LongCrewDAO"%>
<%@page import="model.CrewRecruitDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.CrewRecruitDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 홈화면에서 아래 dao 실행하는 것으로 수정필요 -> 화면접속할 때마다 새로고침되어서 필요없는 크루 삭제해야하기 때문에

	// 단기 크루 생성 후 방장제외 0명이면서 모집일 지나면 크루 삭제
	CrewRecruitDAO dao = new CrewRecruitDAO();
	List<CrewRecruitDTO> crewList = dao.selectAllRecruit();	// 단기크루 모두 불러와서
	for(int i=0; i<crewList.size(); i++) {
		CrewRecruitDTO dto = crewList.get(i);
		dao.deleteCrew2(dto.getCrewName(), dto.getGatherDate());	// 멤버0명에 모집일 지나면 삭제
	}
	// 장기크루 한달 지났는데 방장 제외 0명이하이면 삭제
	LongCrewDAO dao2 = new LongCrewDAO();
	List<LongCrewRecruitDTO> crewList2 = dao2.selectAllRecruit();	// 장기크루 모두 불러와서
	for(int i=0; i<crewList2.size(); i++) {
		LongCrewRecruitDTO dto2 = crewList2.get(i);
		dao.deleteCrew(dto2.getCrewName(), dto2.getCreated());		// 멤버 1명이하이면서 한달이상 지난 크루 삭제
	}
	
	// 장기크루 일정이 모임일 지났는데 0명이면 삭제
	List<CrewRecruitDTO> crewList3 = dao.selectAllSchedule();
	for(int i=0; i<crewList3.size(); i++) {
		CrewRecruitDTO dto3 = crewList3.get(i);
		dao.deleteSchedule(dto3.getNo(), dto3.getGatherDate());
	}
		dao.close();
		dao2.close();
	
		
		
	// 자동로그인
	Cookie[] c = request.getCookies();
	if (c != null) {
		for (Cookie cf : c) {
			out.print(cf.getName());
			out.print(cf.getValue());
			if (cf.getName().equals("id")) {
				response.sendRedirect("main.jsp");
			}
		}
	} 
	
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title></title>

<link href="./resources/css/layout.css" rel="stylesheet">
<link href="./resources/css/login3.css" rel="stylesheet">
</head>
<body>

	<!-- login.jsp 구조 -->
	<div id="root">
		<div class="app">
			<div class="container">
				<!-- header.jsp 시작 -->
				<!-- <div class="banner"></div>
				 <div class="header"></div> -->
				<%@ include file="header.jsp"%>
				<!-- header.jsp 끝 -->

				<div class="mid">
					<div class="mid-inner"></div>
				</div>


				<div class="p_login">
					<div class="wrap-log-con">
						<div class="i_close">
							<a href="#"> <img
								src="https://m.bunjang.co.kr/pc-static/resource/ee442d3dd827628bc5fe.png"
								width="24" height="24">
							</a>
						</div>
						<div class="log-con">
							<img class="login-h1" width="100" height="100"
								src="./resources/images/img_logo.png">
							<!-- <div class="login-h2">산책의 시작은 Step By Step</div> -->
							<div class="login-h3">
								산책의 시작을 <b>Step By Step</b>과 함께해요
							</div>
							<form action="LoginServlet" method="post">
								<div class="log-contents">

									<div class="log-sec">
										<input type="text" name="id" class="login-h2" placeholder="아이디를 입력하세요">
									</div>

									<div class="log-sec">
										<input type="password" name="pw" class="login-h2" placeholder="패스워드를 입력하세요">
									</div>
									<input type="checkbox" name="loginChk" value="true" >로그인 상태 유지<br/>
									<input type="submit" value="로그인하기" class="log-btn">
									<a href="LogoutServlet">로그아웃</a>
									
								</div>
							</form>
							<div class="log-bottom">
								<div class="log-bottom-txt">
									아직 회원이 아니신가요? <a href="signUp3.jsp">회원가입</a> <br> 
									<a href="IdFinder.jsp">아이디찾기</a>   |   <a href="pwFinder.jsp">  비밀번호찾기</a>
									
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- footer.jsp 시작 -->
				<!--  <div class="footer"></div> -->
				<!-- footer.jsp 끝 -->
				<%@ include file="footer.jsp"%>
			</div>
		</div>
	</div>

</body>

</html>
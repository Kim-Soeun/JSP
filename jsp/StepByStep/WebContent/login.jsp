<%@page import="model.LongCrewRecruitDTO"%>
<%@page import="model.LongCrewDAO"%>
<%@page import="model.CrewRecruitDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.CrewRecruitDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="LoginServlet" method="post">
		<label>아이디</label>
		<input type="text" name="id" required/>

		<label>비밀번호</label>
		<input type="password" name="pw" required/>
		
		<button type="submit">로그인</button>
	</form>

		<a href="Register.jsp">회원가입</a><br>
		<a href="FindId.jsp">아이디 찾기</a><br>
		<a href="FindPw.jsp">비밀번호 찾기</a>
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=c7b94b35c8cafa45f1e66ddbdd4fe24e
		&redirect_uri=http://localhost:8081/StepByStep/main.jsp&response_type=code"><img src="./resources/img/kakao_login_medium_narrow.png"></a>
	
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
	window.Kakao.init('eb646ff5e97a36124d6083defab9e3f9');
	
	function kakaoLogin(){
		window.Kakao.Auth.login({
			scope:'profile_nickname, profile_image, account_email',
			success: function(authObj){
				window.Kakao.API.request({
					url:'/v2/user/me',
					success: res => {
						const kakao_account = res.kakao_account;
						document.frm.elements['id'].disabled = true;
						document.frm.id.value = kakao_account.email;
						document.frm.email.value = kakao_account.email;
						document.frm.user_name.value = kakao_account.profile.nickname;
						document.frm.img.value = kakao_account.profile.profile_image_url;
						alert('비밀번호 입력 후 로그인해주세요.');
					}
				});			
			}
		});
	}
	
	<c:if test="${not empty noid}">
	if(!document.frm.elements['id'].disabled){
		if(confirm('등록되지 않은 아이디입니다.\n회원가입 페이지로 이동하시겠습니까?')){
			kakaoLogin();
		}
	}
</c:if>
</script>
</body>
</html>
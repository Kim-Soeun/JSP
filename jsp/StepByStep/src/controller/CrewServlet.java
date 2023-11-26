package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;
import model.crewDAO;
import model.crewDTO;
import model.crewRecruitDAO;
import model.crewRecruitDTO;

public class CrewServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String uri = req.getRequestURI();					// 절대 경로 (현재 파일 이름 포함)
		String Path = req.getContextPath();					// 절대 경로 (현재 파일 이름 미포함)
		String command = uri.substring(Path.length()+1);	// 슬래시 제외 현재 파일 이름
	
		if(command.equals("crewRecruit.crew")) {
			recruit(req, resp);
			return;
		} else if(command.equals("joinCrew.crew")) {
			join(req, resp);
			return;
		}
		
	}
		
	// 크루만들기
	public void recruit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		String crewName = req.getParameter("crewName"); 			// 크루명
		String title = req.getParameter("title"); 					// 모집제목
		String content = req.getParameter("content");				// 조건(내용)
		String location = req.getParameter("location");				// 장소
		int memberNum = Integer.parseInt(req.getParameter("memberNum"));// 모집인원
		String gatherDate = req.getParameter("gatherDate");			// 모임날짜
		String adminId = req.getParameter("adminId");				// 방장(크루장)
		
		// 크루 생성날짜
		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd");
		String created = formatter.format(now);
		
		crewRecruitDTO dto = new crewRecruitDTO();
		dto.setCrewName(crewName);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setLocation(location);
		dto.setMemberNum(memberNum);
		dto.setGatherDate(gatherDate);
		dto.setAdminId(adminId);
		dto.setCreated(created);
		
		// 방장은 자동으로 크루에 가입됨
		crewDTO crew = new crewDTO();
		crew.setCrewName(crewName);
		crew.setMemberNum(memberNum);
		crew.setMemId(adminId);
		crew.setMemAdmin(true);
		new crewDAO().joinCrew(crew);
		
		// 크루 만들기 dao
		crewRecruitDAO dao = new crewRecruitDAO();
		dao.makeCrew(dto);
		dao.close();
		resp.sendRedirect("crewRecruitList.jsp");
	}
	
	// 크루 참여하기
	public void join(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		String crewName = req.getParameter("crewName");
		int memberNum = Integer.parseInt(req.getParameter("memberNum"));
		String adminId = req.getParameter("adminId");
		String userId = req.getParameter("userId");
		boolean memAdmin = false;
		
		
		crewDTO dto = new crewDTO();
		dto.setCrewName(crewName);
		dto.setMemberNum(memberNum);
		dto.setMemId(userId);
		dto.setMemAdmin(false);
		
		crewDAO dao = new crewDAO();
		dao.joinCrew(dto);
		dao.close();
		String encodedCrewName = URLEncoder.encode(crewName, "UTF-8");
		JSFunction.alertLocation(resp, "참여신청이 완료되었습니다", "crewRecruitDetail.jsp?crewName=" + crewName);
	}
	
}

package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.JSFunction;
import model.CourseDAO;
import model.CourseDTO;

public class CourseServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		int no = Integer.parseInt(req.getParameter("no"));
		String userId = (String)req.getSession().getAttribute("userId");
		String courseId = req.getParameter("courseId");
	
		CourseDTO dto = new CourseDTO();
		dto.setMemId(userId);
		dto.setCourseId(courseId);
		dto.setNo(no);
		
		CourseDAO dao = new CourseDAO();
		int result = dao.insertCourseId(dto);
		dao.close();
		
		if(result == 1) {
			JSFunction.alertBack(resp, "참여완료 처리되었습니다");
		} else {
			JSFunction.alertBack(resp, "참여완료 처리 실패했습니다");
		}
	}
	
	
}

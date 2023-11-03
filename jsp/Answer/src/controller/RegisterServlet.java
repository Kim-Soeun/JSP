package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sun.net.httpserver.HttpContext;

import model.member;
import model.memberDAO;

public class RegisterServlet extends HttpServlet {

	private memberDAO cymemberDAO;
	
	
	public void init() {
		cymemberDAO = new memberDAO();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ServletContext application = req.getServletContext();
		String saveDirectory = application.getRealPath("./resources/img");
		int maxPostSize = 5 * 1024 * 1024;
		String encoding = "UTF-8";
		
		MultipartRequest mr = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		
		String id = mr.getParameter("id");
		String pw = mr.getParameter("pw");
		String email = mr.getParameter("email") + "@" + mr.getParameterValues("com")[0];
		String phone = mr.getParameterValues("phone-1")[0] 
				+ "-" + mr.getParameter("phone-2") + "-" + mr.getParameter("phone-3");
		String isAdmin = mr.getParameter("grant");
		String profileImg = mr.getFilesystemName("profileImg");
		
		File photoFile = new File(saveDirectory + File.separator + profileImg);
		
		
		member cyMember = new member();
		cyMember.setId(id);
		cyMember.setPassword(pw);
		cyMember.setEmail(email);
		cyMember.setPhone(phone);
		cyMember.setIsAdmin(isAdmin);
		cyMember.setImgName(profileImg);
		
		HttpSession session = req.getSession();
		session.setAttribute("id", id);
		
		try {
			cymemberDAO.CreateMember(cyMember);
			resp.sendRedirect("./registersuccess.jsp");
		} catch(Exception e) {
			
		}
	}
	
}

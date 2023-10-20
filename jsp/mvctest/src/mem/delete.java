package mem;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MembershipDAO;
import dto.MembershipDTO;

public class delete extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		
		String pw = request.getParameter("pw");
		MembershipDTO dto =  (MembershipDTO)session.getAttribute("dto");
		MembershipDAO dao = new MembershipDAO();
		int result = 0;
		
		if(pw.equals(dto.getPw())) {
			result = dao.delete(dto.getId(), pw);
			if(result == 1) {
				session.removeAttribute("dto");
				session.removeAttribute("UserId");
				response.sendRedirect("../member/success2.jsp");
			}
			
		} else {
			response.sendRedirect("delete.jsp");
		}
	
	}

}

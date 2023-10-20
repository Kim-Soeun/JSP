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

public class login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MembershipDAO dao = new MembershipDAO();
		MembershipDTO dto = dao.loginCheck(id, pw);

		HttpSession session = request.getSession();
		if (dto.getId() != null) {
				session.setAttribute("dto", dto);
				session.setAttribute("UserId", id);
				request.getRequestDispatcher("../member/success.jsp").forward(request, response);
			
		} else {
			request.getRequestDispatcher("../member/login.jsp?error=1").forward(request, response);
		}

	}

}

package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member;
import model.memberDAO;

public class AuthFilter implements javax.servlet.Filter{

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	
	}
	
	@Override
	public void destroy() {
	
	
	}
	
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		HttpSession session = req.getSession(false);
		
		memberDAO dao = new memberDAO();
		
		if(session == null || session.getAttribute("user_id") == null) {
			resp.sendRedirect("login.jsp");
		} else {
			member dto = dao.GetMember(req.getParameter("id"));
			session.setAttribute("dto", dto);
			chain.doFilter(request, response);
		}
		
	}

}

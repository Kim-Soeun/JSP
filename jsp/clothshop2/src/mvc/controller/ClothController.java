package mvc.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import dao.ClothDAO;
import dto.ClothDTO;


public class ClothController extends HttpServlet {
	
    public ClothController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println(command);
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		if(command.equals("/ClothAddAction.do")) { // 상품 추가
			requestAddCloth(request);
			request.getRequestDispatcher("/clothmain.jsp").forward(request, response);
		}
	}
	
	// 상품 추가
	public void requestAddCloth(HttpServletRequest request) {
		ServletContext application = getServletContext();
		
		String saveDirectory = application.getRealPath("/Uploads");
		int maxPostSize = 1024 * 1000;
		String encoding = "utf-8";
		
		try {
			MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
			String fileName = mr.getFilesystemName("clothImage");
			
			File clothFile = new File(saveDirectory + File.separator + fileName);
			
			String clothId = mr.getParameter("clothId");
			String clothType = mr.getParameter("clothType");
			String clothSize = mr.getParameter("clothSize");
			int clothPrice = Integer.parseInt(mr.getParameter("clothPrice"));
			
			
			ClothDTO dto = new ClothDTO();
			dto.setClothId(clothId);
			dto.setClothType(clothType);
			dto.setClothSize(clothSize);
			dto.setClothPrice(clothPrice);
			dto.setClothFile(fileName);
		
			ClothDAO dao = new ClothDAO();
			
			dao.addCloth(dto);
			dao.close();

			System.out.println("파일 업로드 성공");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("파일 업로드 실패");
		
		}
		
	}

}

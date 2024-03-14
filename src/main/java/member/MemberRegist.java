package member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.text.SimpleDateFormat;

@WebServlet("/regist.do")
@MultipartConfig(
	maxFileSize = 1024 * 1024 * 1,
	maxRequestSize = 1024 * 1024 * 10
)
public class MemberRegist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("regist.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		//Part part = req.getPart("user_picture");		
		
		MemberDTO dto = new MemberDTO();

		String user_id = req.getParameter("user_id");
		String username = req.getParameter("user_name");
		String password = req.getParameter("passwd");
		
		dto.setId(user_id);
		dto.setName(username);
		dto.setPass(password);
		
		MemberDAO dao = new MemberDAO();
		dao.regMemberDTO(user_id, username, password);
		dao.close();
		
		//resp.sendRedirect("result.jsp");
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("result.jsp").forward(req, resp);
	}
}

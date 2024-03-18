package member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

@WebServlet("/user_edit.do")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 1,
		maxRequestSize = 1024 * 1024 * 10
	)
public class MemberEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		String user_id = (String) session.getAttribute("UserId");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberDTO(user_id);
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("userinfo_modify.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		System.out.println(dto.getId());

		String user_id = req.getParameter("user_id");
		String username = req.getParameter("user_name");
		String password = req.getParameter("passwd");
		
		dto.setId(user_id);
		dto.setName(username);
		dto.setPass(password);
		
		MemberDAO dao = new MemberDAO();
		dao.editMemberDTO(user_id, username, password);
		dao.close();
		
		req.setAttribute("dto", dto);
		req.setAttribute("authMessage", "<p>회원정보 수정이 완료되었습니다.</p>");
		req.setAttribute("resultBtnType", "regist");
		req.getRequestDispatcher("result.jsp").forward(req, resp);
	}
}

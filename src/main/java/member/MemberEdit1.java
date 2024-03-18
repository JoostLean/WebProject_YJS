package member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MemberEdit1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		
		HttpSession session = req.getSession();
		String uid = session.getAttribute("UserId").toString();
		
		MemberDTO dto = dao.getMemberDTO(uid);
		
		dao.close();
		req.setAttribute("dto", dto);
		
		
		req.getRequestDispatcher("userinfo_modify.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		String uid = session.getAttribute("UserId").toString();
		String uname = req.getParameter("user_name");
		String upass = req.getParameter("UserPwd");
		MemberDTO dto = new MemberDTO();
		dto.setId(uid);
		dto.setPass(upass);
	}
}

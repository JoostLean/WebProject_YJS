package member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user_edit.do")
public class MemberEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		MemberDAO dao = new MemberDAO();
		
		HttpSession session = req.getSession();
		String uid = session.getAttribute("userId").toString();
		MemberDTO dto = dao.getMemberDTO(uid);
		
		dao.close();
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("regist.jsp").forward(req, resp);
	}
}

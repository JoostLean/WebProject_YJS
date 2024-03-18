package member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user_exist_check.do")
public class MemberCheckExist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		
		MemberDTO dto = dao.getMemberDTO(req.getParameter("user_id"));
		
		if (dto != null && dto.getId() != null && !dto.getId().isEmpty()) {
			resp.getWriter().write("id_exist");
		} else if (dto.getId() == null || dto.getId().isEmpty()) {
			resp.getWriter().write("id_no_exist");
		} else {
			resp.getWriter().write("id_load_error");
		}
	}
}

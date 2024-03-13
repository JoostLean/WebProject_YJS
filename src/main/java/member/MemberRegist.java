package member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;

@WebServlet("/regist.do")
public class MemberRegist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		String password = request.getParameter("passwd");
		
		MemberDTO dto = new MemberDTO(user_id, user_name, password);
		
		request.setAttribute("dto", dto);
		request.getRequestDispatcher("result.jsp").forward(request, response);
		System.out.println(user_id+", "+user_name+", "+password);
		System.out.println(dto.getId()+", "+dto.getName()+", "+dto.getPass());
	}
}

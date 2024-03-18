package member;

import java.io.IOException;

import board.BoardDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("login_form.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//로그인 폼에서 입력한 값을 받는다.
		String userId = req.getParameter("user_id");
		String userPwd = req.getParameter("user_password");
		
		//web.xml에 입력된 초기화 파라미터를 ServletContext 객체를 통해 얻어온다.
		ServletContext application = getServletContext();
		
		//web.xml에 입력한 컨텍스트 초기화 파라미터를 읽어온다.
		String oracleDriver = application.getInitParameter("OracleDriver");
		String oracleURL = application.getInitParameter("OracleURL");
		String oracleId = application.getInitParameter("OracleId");
		String oraclePwd = application.getInitParameter("OraclePwd");
		
		MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
		MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
		dao.close();
		
		HttpSession session = req.getSession();
		
		if(memberDTO.getId() != null) {
			session.setAttribute("UserId", userId);
			session.setAttribute("UserPwd", userPwd);
			System.out.println("로그인 작업에 성공하였습니다.");
			
			MemberDTO dto = new MemberDTO();
			dto.setName(memberDTO.getName());
			
//			System.out.println(dto.getName());
			
			req.setAttribute("dto", dto);
//			session.setAttribute("authMessage", "<p>아이디 '" + userId + "'로 로그인 완료되었습니다.</p>");
			session.setAttribute("authMessage", "<p>"+ dto.getName() +" 님. 아이디 '" + userId + "'로 로그인 완료되었습니다.</p>");
			session.setAttribute("UserName", dto.getName());
			session.setAttribute("resultBtnType", "login");
			
			resp.sendRedirect("result.jsp");
		} else {
			session.setAttribute("authMessage", "<p>아이디 혹은 패스워드가 잘못되었습니다.</p>");
			session.setAttribute("resultBtnType", "loginError");
			resp.sendRedirect("result.jsp");
		}
	}
}

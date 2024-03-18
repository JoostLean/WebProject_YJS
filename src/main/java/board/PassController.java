package board;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

//패스워드 검증하기
/*
비회원제 게시판에서 게시물을 수정 및 삭제하기 위해서는 패스워드 검증이 먼저
선행되어야 한다. 따라서 해당 페이지로 진입한 후 패스워드가 일치하는지
확인한 후 처리한다.
*/
@WebServlet("/validate.do")
public class PassController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//패스워드 검증 페이지로 진입시에는 get방식 사용
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		/*
		페이지로 전달되는 파라미터가 컨트롤러에서 필요한 경우 request
		내장객체로 받은 후 사용한다.(방법1)
		*/
		req.setAttribute("mode", req.getParameter("mode"));
		req.getRequestDispatcher("/validate.jsp").forward(req, resp);
	}
	
	//사용자가 입력한 form값으로 레코드 검증 후 삭제 처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//파라미터 저장
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		//비밀번호 검증
		MVCBoardDAO dao = new MVCBoardDAO();
		//일치하는 게시물이 있다면 true 반환됨
		boolean confirmed = dao.confirmPassword(pass, idx);
		dao.close();
		
		if (confirmed) {
			//패스워드 검증이 완료되었다면 수정/삭제를 진행한다.
			
			if (mode.equals("edit")) {
				//mode=edit인 경우 수정페이지로 진입
				
				//서블릿에서 session 내장객체를 얻어온다.
				HttpSession session = req.getSession();
				//검증에 사용된 패스워드를 세션영역에 저장한다.
				session.setAttribute("pass", pass);
				/*
				수정페이지로 이동한다. 앞에서 세션영역에 저장된 패스워드는
				페이지를 이동하더라도 공유된다.
				*/
				resp.sendRedirect("edit.do?idx=" + idx);
			}
			else if (mode.equals("delete")) {
				//mode=delete인 경우 게시물 삭제 및 파일 삭제
				dao = new MVCBoardDAO();
				//기존 게시물의 내용을 가져온다.(뒷부분의 파일삭제 때문)
				MVCBoardDTO dto = dao.selectView(idx);
				//게시물 삭제
				int result = dao.deletePost(idx);
				dao.close();
				//게시물 삭제 성공 시 첨부파일도 삭제
				if (result == 1) {
					//서버에 실제 저장된 파일명으로 삭제한다.
					String saveFileName = dto.getSfile();
					FileUtil.deleteFile(req, "/Uploads", saveFileName);
				}
				//게시물 삭제가 완료되면 목록으로 이동한다.
				JSFunction.alertLocation(resp, "삭제되었습니다.",
						"list.do");
			}
		}
		else {
			// 비밀번호 불일치인 경우 경고창을 띄우고 뒤로 이동한다.
			JSFunction.alertBack(resp, "비밀번호 검증에 실패했습니다.");
		}
	}
}

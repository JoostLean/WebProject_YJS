package board;

import java.io.IOException;

import fileupload.FileUtil;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.MultipartConfig;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

//매핑 및 첨부파일의 용량 제한
@WebServlet("/edit.do")
@MultipartConfig(
	maxFileSize = 1024 * 1024 * 1,
	maxRequestSize = 1024 * 1024 * 10
)
public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//수정페이지 진입
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//일련번호에 해당하는 레코드를 읽어와서 DTO에 저장한다.
		String idx = req.getParameter("idx");
		MVCBoardDAO dao = new MVCBoardDAO();
		MVCBoardDTO dto = dao.selectView(idx);
		//DTO를 리퀘스트 영역에 저장한 후 포워드한다.
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("edit.jsp").forward(req, resp);
	}
	
	//수정처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//업로드 디렉토리의 물리적 경로 얻어오기
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		// 파일 업로드
		String originalFileName = "";
		try {
			//첨부된 파일이 있다면 원본파일명을 저장
			originalFileName = FileUtil.uploadFile(req, saveDirectory);
		}
		catch (Exception e) {
			JSFunction.alertBack(resp, "파일 업로드 오류입니다.");
			e.printStackTrace();
			return;
		}
		//form값 정리 : hidden상자에 저장된 내용
		String idx = req.getParameter("idx");
		String prevOfile = req.getParameter("prevOfile");
		String prevSfile = req.getParameter("prevSfile");
		//사용자가 입력한 값
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		//패스워드 검증에 사용된 값은 세션에서 가져온다.
		HttpSession session = req.getSession();
		String pass = (String)session.getAttribute("pass");
		
		//위 모든 값을 DTO에 저장한다.
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setIdx(idx);
		dto.setName(name);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPass(pass);
		
		req.setAttribute("prevOfile", prevOfile);
		req.setAttribute("prevSfile", prevSfile);
				
		if (originalFileName != "") {
			//만약 첨부된 파일이 있다면 파일명을 변경한다.
			String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
			//DTO에 내용을 추가한다.
			dto.setOfile(originalFileName); // 원래 파일 이름
			dto.setSfile(savedFileName); // 서버에 저장된 파일 이름
			//기존에 저장된 파일을 삭제한다.
			FileUtil.deleteFile(req, "/Uploads", prevSfile);
		}
		else {
			//첨부된 파일이 없다면 기존의 파일명을 그대로 유지한다.
			dto.setOfile(prevOfile);
			dto.setSfile(prevSfile);
		}
		
		//DAO 인스턴스 생성
		MVCBoardDAO dao = new MVCBoardDAO();
		//게시물 수정을 위한 update 쿼리문 실행
		int result = dao.updatePost(dto);
		dao.close();
		
		if (result == 1) {
			//수정이 완료되었다면 검증에 사용한 패스워드는 삭제한다.
			session.removeAttribute("pass");
			resp.sendRedirect("view.do?idx=" + idx);
		}
		else { // 수정 실패
			JSFunction.alertLocation(resp, "비밀번호 검증을 다시 진행해주세요.",
					"view.do?idx=" + idx);
		}
	}
}

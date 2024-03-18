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

/*
글쓰기의 경우 <a>태그의 링크를 통해 진입할때는 get방식, 작성처리를 위해서는
post방식의 전송을 해야하므로 doGet, doPost 모두 필요하다.
*/
@MultipartConfig(
	maxFileSize = 1024 * 1024 * 1,
	maxRequestSize = 1024 * 1024 * 10
)
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//글쓰기 페이지 진입
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("/write.jsp").forward(req, resp);
	}
	
	//글쓰기 처리
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// 1. 파일 업로드 처리 ==============================
		// 업로드 디렉터리의 물리적 경로 확인
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		// 파일 업로드
		String originalFileName = "";
		try {
			//업로드가 정상적으로 완료되면 원본 파일명을 반환한다.
			originalFileName = FileUtil.uploadFile(req, saveDirectory);
		}
		catch (Exception e) {
			/* 파일업로드 시 오류가 발생되면 경고창을 띄운후 작성페이지로
			이동한다. 예외 발생의 이유를 확인하기 위해 printStackTrace()
			메서드를 사용하는 것이 좋다. */
			e.printStackTrace();
			//업로드 오류시 경고창을 띄우고 쓰기페이지로 이동한다.
			JSFunction.alertLocation(resp, "파일 업로드 오류입니다.", "write.do");
			return;
		}
		
		// 2. 파일 업로드 외 처리 ==============================
		// 첨부파일 이외의 폼값을 DTO에 저장
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setName(req.getParameter("user_name"));
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setPass(req.getParameter("passwd"));
		
		// 첨부파일이 정상적으로 등록되어 원본파일명이 반환되었다면
		if (originalFileName != "") {
			//파일명을 "날짜_시간.확장자" 형식으로 변경한다.
			String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
			
			//원본과 변경된 파일명을 DTO에 저장한다.
			dto.setOfile(originalFileName); //원래 파일 이름
			dto.setSfile(savedFileName); //서버에 저장된 파일 이름
		}
		
		// DAO를 통해 DB에 게시 내용 저장
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.insertWrite(dto);
		dao.close();
		
		// 성공 or 실패?
		if (result == 1) {
			//글쓰기 성공시 목록 페이지로 이동
			resp.sendRedirect("list3.do");
		}
		else {
			// 글쓰기 실패
			JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.", "write.do");
		}
	}
}

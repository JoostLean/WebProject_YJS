package fileupload;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
어노테이션으로 요청명에 대한 매핑을 한다. 파일업로드 폼에서 submit하면
요청을 받아 처리한다. 
*/
@WebServlet("/13FileUpload/UploadProcess.do")
/*
첨부파일의 최대용량을 지정
maxFileSize : 개별 파일의 최대용량으로 1Mb로 설정
maxRequestSize : 첨부할 전체 파일의 용량으로 10Mb로 설정
*/
@MultipartConfig(
	maxFileSize = 1024 * 1024 * 1,
	maxRequestSize = 1024 * 1024 * 10
)
public class UploadProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//파일업로드는 post방식만 가능하므로 doPost를 오버라이딩 해야한다.
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			//파일이 저장된 디렉토리의 물리적경로를 얻어온다.
			String saveDirectory = getServletContext()
					.getRealPath("/Uploads");
			//파일을 업로드한다.
			String originalFileName = FileUtil
					.uploadFile(req, saveDirectory);
			//파일을 변경한다.
			String savedFileName = FileUtil
					.renameFile(saveDirectory, originalFileName);
			//업로드 완료 후 리스트로 이동한다.
			resp.sendRedirect("FileList.jsp");
		}
		catch (Exception e) {
			//만약 업로드에 실패하면 작성페이지로 포워드된다.
			e.printStackTrace();
			req.setAttribute("errorMessage", "파일 업로드 오류");
			req.getRequestDispatcher("FileUploadMain.jsp")
			.forward(req, resp);
		}
	}
}

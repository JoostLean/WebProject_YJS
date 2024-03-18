package board;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//어노테이션으로 매핑 처리
@WebServlet("/view.do")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	서블릿의 수명주기 메서드 중 get/post 모두 처리할 수 있는 메서드. 
	*/
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		MVCBoardDAO dao = new MVCBoardDAO();
		String idx = req.getParameter("idx");
		//게시물의 조회수 증가
		dao.updateVisitCount(idx);
		//내용을 출력할 게시물 인출
		MVCBoardDTO dto = dao.selectView(idx);
		dao.close();
		
		//웹브라우저 출력시 엔터키는 <br>태그로 변경해야 줄바꿈 처리된다.
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));
		
		//첨부파일이 있는 경우 이미지 출력하기
		String fileName = dto.getSfile();
		req.setAttribute("fileName", fileName);
		
		//request영역에 DTO를 저장한 후 포워드
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("view.jsp").forward(req, resp);
	}
}

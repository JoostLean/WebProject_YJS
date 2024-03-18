package board;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import utils.BoardPage;
/*
게시판 목록을 위한 컨트롤러 클래스(서블릿). 매핑은 web.xml에서 설정. 
*/
public class ListController extends HttpServlet {
	
	//목록 진입은 get방식이므로 doGet()메서드 오버라이딩
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//커넥션풀을 통해 DB연결
		MVCBoardDAO dao = new MVCBoardDAO();
		
		//Map컬렉션(파라미터 저장 및 그외정보 저장)
		Map<String, Object> map = new HashMap<String, Object>();
		
		//검색어 파라미터
		String searchField = req.getParameter("search_field");
		String searchWord = req.getParameter("search_text");
		if (searchWord != null) {
			//검색어가 있는경우 Map에 추가
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		//게시물의 갯수 카운트
		int totalCount = dao.selectCount(map);
		
		/* 페이지 처리 start */
		/*
		서블릿 클래스에서는 내장객체를 사용하기 위해 별도의 메서드를 통해
		얻어와야 한다. 아래에서는 application 내장객체를 얻어온다. 
		*/
		ServletContext application = getServletContext();
		//한 페이지에 출력할 게시물의 갯수
		int pageSize =
				Integer.parseInt(
						application.getInitParameter("POSTS_PER_PAGE"));
		//한 블럭당 출력할 페이지번호의 갯수
		int blockPage =
				Integer.parseInt(
						application.getInitParameter("PAGES_PER_BLOCK"));
		
		// 현재 페이지 확인
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		if (pageTemp != null && !pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);
		//목록에 출력할 게시물 범위 계산 후 Map에 추가
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		map.put("start", start);
		map.put("end", end);
		/* 페이지 처리 end */
		
		//해당 페이지에 출력할 게시물을 List컬렉션으로 얻어온다.
		List<MVCBoardDTO> boardLists = dao.selectListPage(map);
		
		//커넥션풀에 자원 반납
		dao.close();
		
		/*
		모델1 방식에서는 JSP상단에서 요청을 처리한 후 하단에서 출력하는 방식
		이므로 즉시 사용할 수 있다.
		하지만 모델2 방식은 Servlet 에서 요청을 처리하고 출력을 위해 JSP로
		데이터를 전달해야 하므로 아래와 같이 request영역에 데이터를 저장후
		JSP포워드해서 출력한다. 
		*/
		String pagingImg = BoardPage.pagingImg(totalCount, pageSize,
				blockPage, pageNum, "list3.do");
		map.put("pagingImg", pagingImg);//출력할 페이지 번호
		map.put("totalCount", totalCount);//게시물의 전체갯수
		map.put("pageSize", pageSize);//페이지당 출력갯수
		map.put("pageNum", pageNum);//현재 페이지 번호
		
		//서블릿의 request 속성에 boardLists를 추가한다.
		req.setAttribute("boardLists", boardLists);
//		req.setAttribute("map", map);
		req.setAttribute("board3", map);
		//dispatcher를 통해 객체를 포워딩하여 전달
		req.getRequestDispatcher("list.jsp").forward(req, resp);
	}
}

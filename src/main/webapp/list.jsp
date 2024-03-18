<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/fonts.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/list/style.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/list/custom.css" />
<style type="text/css">
.ht-body-head-wrapper {	background-color: #fdfdfd; }
.mb-board { max-width: 1200px !important; padding: 25px 10px 15px 10px !important; margin: 0 auto; }
.mb-board div select {
	width: auto;
	padding: 1px 15px 0 7px !important;
	min-width: 64px;
	*padding: 2px 0px;
	border: 1px solid #ccc;
	background-color: #FFF;
	appearance: none !important;
	-moz-appearance: none !important;
	-webkit-appearance: none !important;
	background-image:
		url("https://demo.mangboard.com/wp-content/themes/hometory/assets/images/icon_select_arrow.png")
		!important;
	background-repeat: no-repeat;
	background-position: center right;
}
</style>
<body>
	<div id="s_qanda_board" class="mb-board">
		<div class="mb-level-0 mb-name-s-qanda mb-mode-list mb-skin-bbs-qanda-m1">
			<!-- <div style="padding: 10px 3px 20px; font-size: 15px; line-height: 1.6em">
				<span class="mb-product-title-style1" style="font-weight: 600;">
					<a href="https://www.mangboard.com/store/?vid=25" target="_blank">질문&답변
						스킨 M1 <span class="mb-link-order">구매하기</span>
					</a>
				</span>
				<span>(질문 및 답변을 관리 할 수 있는 기능, 폰트크기 13px)</span>
			</div> -->
			<div class="mb-style1 board-list">
				<form name="s_qanda_form_board_search" id="s_qanda_form_board_search" method="post">
					<input type="hidden" name="board_name" value="s_qanda" />
					<div class="list-head">
						<!-- <div class="mb-category">
							<button onclick="" title="전체"
								class="tab-menu-on" type="button">
								<span>전체</span>
							</button>
							<button onclick="" title="카테고리1"
								class="tab-menu-off" type="button">
								<span>카테고리1</span>
							</button>
							<button onclick="" title="카테고리2" type="button"
								class="tab-menu-off">
								<span>카테고리2</span>
							</button>
							<input type="hidden" name="category1" value="" />
							<input type="hidden" name="category2" value="" />
							<input type="hidden" name="category3" value="" />
						</div> -->
						<div class="list-search">
							<select id="search_field" name="search_field"
								class="search-field margin-right-5" title="Search Field">
								<option value="fn_pid">번호</option>
								<option value="fn_title" selected>제목</option>
								<option value="fn_user_name">작성자</option>
								<option value="fn_content">내용</option>
								<option value="fn_reg_date">날짜</option>
								<option value="fn_tag">태그</option>
							</select>
							<input type="text"
								id="search_text" class="search-text" name="search_text"
								accesskey="s" title="Search Text" value=""
								onkeypress="checkEnterKey(sendSearchData);" />
							<input style="display: none !important;" type="text" />
							<button onclick="sendSearchData();return false;" title="검색"
								class="btn btn-default btn-search margin-left-5" type="button">
								<span>검색</span>
							</button>
						</div>
						<div class="clear"></div>
					</div>
				</form>
				<form name="s_qanda_form_board_list" id="s_qanda_form_board_list"
					method="post">
					<!-- <input type="hidden" name="board_name" id="board_name" value="s_qanda" />
					<input type="hidden" name="page_id" id="page_id" value="" />
					<input type="hidden" name="list_type" id="list_type" value="list" />
					<input type="hidden" name="page" id="page" value="1" />
					<input type="hidden" name="mode" id="mode" value="list" />
					<input type="hidden" name="board_action" id="board_action" value="" />
					<input type="hidden" name="board_pid" id="board_pid" value="" />
					<input type="hidden"
						name="mb_nonce_value" value="043047771b69b22691600208bf03fb8f" />
					<input type="hidden" name="mb_nonce_time" value="1710246375" />
					<input type="hidden" id="wp_nonce_value" name="wp_nonce_value"
						value="4883e0cdaf" />
					<input type="hidden" name="_wp_http_referer" value="/s_qanda_m1/" />
					<input type="hidden" name="lang" value="ko_KR" /> -->
					<div class="main-style1" id="s_qanda_board_box">
						<table cellspacing="0" cellpadding="0" border="0" id="tbl_board_list" class="table table-list">
							<!-- 각 행의 너비 지정 -->
							<colgroup>
								<col style="width: 50px" class="mb-col-pid mb-hide-mobile mb-hide-tablet" />
								<col class="mb-col-title" />
								<col style="width: 115px" class="mb-col-user-name" />
								<col style="width: 90px" class="mb-col-reg-date mb-hide-mobile" />
								<col style="width: 60px" class="mb-col-hit mb-hide-mobile mb-hide-tablet" />
								<col style="width: 74px" class="mb-col-ext9 mb-hide-mobile" />
							</colgroup>
							<!-- 상단의 열 제목 -->
							<thead>
								<tr>
									<th scope="col" class="mb-th-pid mb-hide-mobile mb-hide-tablet order-asc" class="order-asc">
										<a
										href="https://demo.mangboard.com/s_qanda_m1/?mode=list&#038;order_by=fn_pid&#038;order_type=asc"
										title="번호"><span>번호</span></a>
									</th>
									<th scope="col" class="mb-th-title">
										<a
										href="https://demo.mangboard.com/s_qanda_m1/?mode=list&#038;order_by=fn_title&#038;order_type=asc"
										title="제목"><span>제목</span></a>
									</th>
									<th scope="col" class="mb-th-user-name">
										<a
										href="https://demo.mangboard.com/s_qanda_m1/?mode=list&#038;order_by=fn_user_name&#038;order_type=asc"
										title="작성자"><span>작성자</span></a>
									</th>
									<th scope="col" class="mb-th-reg-date mb-hide-mobile">
										<a
										href="https://demo.mangboard.com/s_qanda_m1/?mode=list&#038;order_by=fn_reg_date&#038;order_type=asc"
										title="날짜"><span>날짜</span></a>
									</th>
									<th scope="col" class="mb-th-hit mb-hide-mobile mb-hide-tablet">
										<a
										href="https://demo.mangboard.com/s_qanda_m1/?mode=list&#038;order_by=fn_hit&#038;order_type=asc"
										title="조회"><span>조회</span></a>
									</th>
									<th scope="col" class="mb-th-ext9 mb-hide-mobile">
										<a
										href="https://demo.mangboard.com/s_qanda_m1/?mode=list&#038;order_by=fn_ext9&#038;order_type=asc"
										title="상태"><span>상태</span></a>
									</th>
								</tr>
							</thead>
							
							
<tbody id="s_qanda_board_body">
<c:choose>
	<c:when test="${ empty boardLists }">
		<!-- 게시물이 없을 때 -->
		<tr>
			<td colspan="6" align="center">
				등록된 게시물이 없습니다.
			</td>
		</tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${ boardLists }" var="row" varStatus="loop">
		<tr id="mb_s_qanda_tr_${ row.idx }">
			<td>
			<%-- ${ map.totalCount - (((map.page-1) * map.pageMax) + loop.index) } --%>
			${ board3.totalCount - (((board3.pageNum-1) * board3.pageSize) + loop.index) }
			</td>
			<%-- <td class="mb-hide-mobile mb-hide-tablet">
				<span>${ row.idx }</span>
			</td> --%>
			<td class="text-left">
				<a href="view.do?idx=${ row.idx }" title="${ row.title }">
				<span>
					<span class="category1-text category1-item2"></span>${ row.title }
						<c:if test="${ not empty row.ofile }">
							<img decoding="async" class="list-i-file" alt="file"
							src="<%=request.getContextPath() %>/images/icon_file.gif" />
						</c:if>
					</span>
				</a>
			</td>
			<td>
				<span>
					<!-- <a href="javascript:;" onclick=""
					class="btn-user-picture" role="button">
					<img decoding="async" class="mb-user-small-picture radius-3" alt="user icon"
						style="vertical-align: middle; max-width: 20px; max-height: 20px;"
						src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
					</a> -->
					<!-- <a href="javascript:;"
					onclick="getUserMenu('108','170','sunnypark');return false;"
					title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a> -->
					<span>${ row.name }</span>
					<!-- <img decoding="async" class="user-i-level mb-level-5"
					alt="Level 5"
					src="images/icon_level5.gif" /> -->
				</span>
			</td>
			<td class="mb-hide-mobile"><span>${ row.postdate }</span></td>
			<td class="mb-hide-mobile mb-hide-tablet"><span>${ row.visitcount }</span></td>
			<td class="mb-hide-mobile">
				<c:if test="${ not empty row.ofile }">
					<div class='mb-reply-status mb-reply-select'>다운가능</div>
				</c:if>
				<c:if test="${ empty row.ofile }">
					<div class='mb-reply-status mb-reply-empty'>파일없음</div>
				</c:if>
			</td>
		</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>
</tbody>
						</table>
					</div>


					<div class="list-btn">
						<div class="btn-box-right" id="s_qanda_btn_box">
							<div class="btn-box-left" style="float: left;"></div>
							<button
								onclick="location.href='write.do';" title="글쓰기" class="btn btn-default btn-write" type="button">
								<span>글쓰기</span>
							</button>
							<div class="clear"></div>
						</div>
					</div>


				</form>

				<div id="s_qanda_pagination_box" class="pagination-box">
					<div class="pagination-large">
						<table cellspacing="0" cellpadding="0" border="0"
							class="table table-page" align="center">
							<tbody>
								<tr>
									<%-- ${ map.pagingImg } --%>
									${ board3.pagingImg }
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- <div id="s_qanda_pagination_box" class="pagination-box">
					<div class="pagination-large">
						<table cellspacing="0" cellpadding="0" border="0"
							class="table table-page" align="center">
							<tbody>
								<tr>
									<td class="page_arrow mb-disabled mb-mobile-hide"><a
										title="처음" class="btn-start" role="button"><span><img
												decoding="async"
												src="images/btn_paging_pprev.gif"
												alt="처음" style="width: 15px;" /></span></a></td>
									<td class="page_arrow mb-disabled"><a title="이전"
										class="btn-prev" role="button"><span><img
												decoding="async"
												src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/btn_paging_prev.gif"
												alt="이전" style="width: 15px;" /></span></a></td>
									<td class="btn-page active"><a class="btn-page-num first"
										title="Page 1 - Selected">1</a></td>
									<td class="btn-page"><a class="btn-page-num"
										href="https://demo.mangboard.com/s_qanda_m1/?mode=list&board_page=2"
										title="Page 2">2</a></td>
									<td class="btn-page"><a class="btn-page-num"
										href="https://demo.mangboard.com/s_qanda_m1/?mode=list&board_page=3"
										title="Page 3">3</a></td>
									<td class="page_arrow mb-disabled"><a title="다음"
										class="btn-next" role="button"><span><img
												decoding="async"
												src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/btn_paging_next.gif"
												alt="다음" style="width: 15px;" /></span></a></td>
									<td class="page_arrow mb-mobile-hide"><a
										href="https://demo.mangboard.com/s_qanda_m1/?mode=list&#038;board_page=3"
										title="맨끝" class="btn-end" role="button"><span><img
												decoding="async"
												src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/btn_paging_nnext.gif"
												alt="맨끝" style="width: 15px;" /></span></a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div> -->
			</div>
		</div>
	</div>
</body>
</html>
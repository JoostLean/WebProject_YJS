<%@page import="java.util.Set"%>
<%@ page import="board.MVCBoardDTO"%>
<%@ page import="board.MVCBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
MVCBoardDTO dto = new MVCBoardDTO();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="./css/fonts.css" />
<link rel="stylesheet" href="./css/style.css" />
<link rel="stylesheet" href="./css/write/editor.css" />
<link rel="stylesheet" href="./css/view/style.css" />
<link rel="stylesheet" href="./css/view/custom.css" />
<body>
	<div id="s_qanda_board" class="mb-board">
		<div class="mb-level-0 mb-name-s-qanda mb-mode-view mb-skin-bbs-qanda-m1">
			<div class="mb-style1 board-view">
				<div class="mb-qanda-content-box mb-qanda-view-content">
					<div class="main-style1" id="s_qanda_board_box">
						<table cellspacing="0" cellpadding="0" border="0" class="table table-view">
							<caption>글보기</caption>
							<colgroup>
								<col class="mb-col-item1" style="width: 20%" />
								<col class="mb-col-item2" />
							</colgroup>
							<tbody>
								<tr id="mb_s_qanda_tr_title">
									<td style="padding: 8px 8px 10px 8px !important" colspan="2">
										<div class="view-td-titlebox">
											<div class="view-td-titlebox">
												<div class="view-td-title">
													<span>${ dto.title }</span>
												</div>
												<div>
													<span class="view-td-user">
														<a href="javascript:;" onclick="getUserMenu('108','190');return false;"
														class="btn-user-picture" role="button">
															<!-- <img decoding="async" class="mb-user-small-picture radius-3"
															alt="user icon" src="" style="vertical-align: middle;
															max-width: 20px; max-height: 20px;" /> -->
														</a>
														<a href="javascript:;" onclick="" title="" class="btn-user-info"
														role="button"><span>${ dto.name }</span></a>
														<!-- <img decoding="async" class="user-i-level mb-level-5"
														alt="Level 5" src="images/icon_level5.gif" /> -->
													</span> <span class="view-line">&nbsp;&nbsp;&nbsp;</span>
													<div class="pull-right">
														<span class="view-td-date">${ dto.postdate }</span>
													</div>
												</div>
												<div class="clear"></div>
											</div>
										</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_content">
									<td class="content-box text-left" colspan="2">
										<p style="line-height: 1.8;">
											<span style="font-size: 13px; font-family: '나눔고딕', 'Nanum Gothic', sans-serif;">
											${ dto.content }
												<p>
													<c:if test="${ not empty fileName }">
													<img decoding="async" 
													src="<%=request.getContextPath() %>/Uploads/${ fileName }" 
													alt="${ fileName }" title="${ fileName }" />
													</c:if>												
												</p>
											</span>
										</p>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_file_download">
									<th scope="row"><span>첨부파일</span></th>
									<td><a href="<%=request.getContextPath() %>/download.do?ofile=${ dto.ofile }
										&sfile=${ dto.sfile }&idx=${ dto.idx }" class="file-download"
										title="Download : ${ dto.downcount }"
										onclick=""> <span>${ dto.ofile }
												<!-- <span class="file-size">(8.7KB)</span> -->
										</span>
									</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="view-btn">
						<div class="btn-box-right" id="s_qanda_btn_box">
							<div class="btn-box-left pull-left" style="">
								<span class="cmt-count-box cursor_pointer"
									style="padding: 0 10px;" onclick="cmtClick(2);return false;">댓글
									<span class="cmt-count"> <span class="cmt-count-num"
										id="mb_comment_totalcount_190">0</span>
								</span>
								</span> <span class="view-td-hit view-td-hit">｜&nbsp; 조회수 ${ dto.visitcount }</span>
							</div>
								<button
								onclick="location.href='list3.do';" title="목록" class="btn btn-default btn-list" type="button">
									<span>목록</span>
								</button>
								<c:if test="${ UserName == writer }">
									<button
										onclick="location.href='<%= request.getContextPath() %>/validate.do?mode=edit&idx=${ param.idx }';" title="수정" class="btn btn-default btn-modify" type="button">
										<span>수정</span>
									</button>
									<button
										onclick="" title="삭제" class="btn btn-default btn-delete" type="button">
										<span>삭제</span>
									</button>
								</c:if>
								<c:if test="${ UserName != writer }">
									<button
									onclick="location.href='write.do';" title="글쓰기" class="btn btn-default btn-write" type="button">
										<span>글쓰기</span>
									</button>
								</c:if>
							<div class="clear"></div>
						</div>
					</div>
					<div class="cmt-style1 cmt-style1-2" style="padding-top: 3px;">
						<fieldset>
							<div id="mb_comment_write_box_190"
								class="cmt-input-box cmt-input-box-2" style="display: none;">
								<ul id='comment_list_box_190' class='cmt-list-box list-unstyled'
									style="display: none;"></ul>
								<div class="cmt-input-head">
									<form name="s_qanda_form_comment_write"
										id="s_qanda_form_comment_write_190" method="post" action="">
										<table cellspacing="0" cellpadding="0" border="0"
											class="table table-comment">
											<caption>댓글</caption>
											<colgroup>
												<col class="mb-col-item1" style="width: 20%" />
												<col class="mb-col-item2" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row"><label for="mb_s_qanda_user_name_c9">작성자(*)</label></th>
													<td><input class="mb-user-name" style="width: 100px;"
														name="user_name" id="mb_s_qanda_user_name_c9" title=""
														value="" type="text" /></td>
												</tr>
												<tr>
													<th scope="row"><label for="mb_s_qanda_passwd_c10">비밀번호(*)</label></th>
													<td><input class="mb-passwd" style="width: 100px;"
														name="passwd" id="mb_s_qanda_passwd_c10" title="" value=""
														autocomplete="off" type="password" /></td>
												</tr>
												<tr>
													<th scope="row"><label for="mb_s_qanda_kcaptcha_img_c11">자동등록방지</label></th>
													<td><img decoding="async"
														style="width: 80px; height: 32px; vertical-align: top;"
														onclick="mb_reloadImage()"
														class="mb_kcaptcha cursor_pointer"
														src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/kcaptcha/kcaptcha_image.php?mode=comment&#038;board_action=write"
														id="mb_kcaptcha" class="border-ccc-1" alt="자동등록방지" /> <input
														class="kcaptcha"
														style="width: 70px; height: 30px !important;"
														name="kcaptcha_img" maxlength="6" value=""
														id=&quot;mb_s_qanda_kcaptcha_img_c11&quot; type="text"
														title="자동등록방지" /> <span class="mb-description"><br>(자동등록방지
															숫자를 입력해 주세요)</span></td>
												</tr>
												<tr>
													<th scope="row"><label for="mb_s_qanda_content_c12">내용(*)</label></th>
													<td><textarea class="mb-comment-content" name="content"
															id="mb_s_qanda_content_c12"></textarea></td>
												</tr>
											</tbody>
										</table>
									</form>
								</div>
								<div class="comment-btn">
									<div class="btn-box-right">
										<button onclick="sendCommentData('write',190);return false;"
											title="댓글 등록" class="btn btn-default" type="button">
											<span>댓글 등록</span>
										</button>
									</div>
								</div>
							</div>
						</fieldset>
					</div>
					<div id="comment_add_list_190" class="cmt-add-list"
						style="display: none;">
						<button onclick="sendCommentList(190);return false;" title="더보기"
							class="btn btn-default btn-more" type="button">
							<span>더보기</span>
						</button>
					</div>
				</div>
				<div class="mb-qanda-reply-text-box">
					<span class="mb-qanda-reply-text">답변</span>
				</div>
				<div class="mb-qanda-reply-box">
					<div class="mb-qanda-reply-item-box mb-qanda-view-reply-content mb-qanda-reply-select">
						<div class="mb-qanda-reply-lables"></div>
						<div class="mb-style1 board-view">
							<div class="main-style1">
								<table cellspacing="0" cellpadding="0" border="0"
									class="table table-view" style="border-top: none !important;">
									<caption>글보기</caption>
									<colgroup>
										<col class="mb-col-item1" style="width: 20%" />
										<col class="mb-col-item2" />
									</colgroup>
									<tbody>
										<tr id="mb_s_qanda_tr_user_name">
											<td colspan="2">
												<div>
													<span class="view-td-user"> <a href="javascript:;"
														onclick="getUserMenu('108','191');return false;"
														class="btn-user-picture" role="button"> <img
															decoding="async" class="mb-user-small-picture radius-3"
															alt="user icon"
															style="vertical-align: middle; max-width: 20px; max-height: 20px;"
															src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
													</a> <a href="javascript:;"
														onclick="getUserMenu('108','191','sunnypark');return false;"
														title="sunnypark **2.146.20*.1**" class="btn-user-info"
														role="button"> <span>sunnypark</span>
													</a> <img decoding="async" class="user-i-level mb-level-5"
														alt="Level 5"
														src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" />
													</span> <span class="view-line">&nbsp;&nbsp;&nbsp;</span>
													<div class="pull-right">
														<span class="view-td-date">2023-12-20 23:01</span>
													</div>
												</div>
											</td>
										</tr>
										<tr id="mb_s_qanda_tr_content">
											<td class="content-box text-left" colspan="2">
												<p style="line-height: 1.8;">
													<span
														style="font-size: 13px; font-family: '나눔고딕', 'Nanum Gothic', sans-serif;">답변합니다
														<img decoding="async"
														src="https://demo.mangboard.com/wp-content/uploads/mangboard/2023/12/20/F5622_PNG.png"
														alt="PNG.png" title="PNG.png" />
													</span>
												</p>
											</td>
										</tr>
										<tr id="mb_s_qanda_tr_file_download">
											<th scope="row"><span>첨부파일</span></th>
											<td><a href="javascript:;" class="file-download"
												title="Download : 0"
												onclick="sendBoardFileData(5623,'PNG.png');return false;">
													<span>PNG.png <span class="file-size">(453.6KB)</span>
												</span>
											</a> <a href="javascript:;" class="file-download"
												title="Download : 0"
												onclick="sendBoardFileData(5624,'45.jpg');return false;">
													<span>45.jpg <span class="file-size">(19.3KB)</span>
												</span>
											</a></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="view-btn">
								<div class="btn-box-right" id="s_qanda_btn_box">
									<div class="btn-box-left pull-left" style="">
										<span class="cmt-count-box cursor_pointer"
											style="padding: 0 10px;" onclick="cmtClick(3);return false;">댓글
											<span class="cmt-count"> <span class="cmt-count-num"
												id="mb_comment_totalcount_191">0</span>
										</span>
										</span>
									</div>
									<div class="clear"></div>
								</div>
							</div>
							<div class="cmt-style1 cmt-style1-3" style="padding-top: 3px;">
								<fieldset>
									<div id="mb_comment_write_box_191"
										class="cmt-input-box cmt-input-box-3" style="display: none;">
										<ul id='comment_list_box_191' class='cmt-list-box list-unstyled' style="display: none;">
										</ul>
										<div class="cmt-input-head">
											<form name="s_qanda_form_comment_write"
												id="s_qanda_form_comment_write_191" method="post" action="">
												<table cellspacing="0" cellpadding="0" border="0" class="table table-comment">
													<caption>댓글</caption>
													<colgroup>
														<col class="mb-col-item1" style="width: 20%" />
														<col class="mb-col-item2" />
													</colgroup>
													<tbody>
														<tr>
															<th scope="row">
																<label for="mb_s_qanda_user_name_c21">작성자(*)</label>
															</th>
															<td><input class="mb-user-name" style="width: 100px;"
																name="user_name" id="mb_s_qanda_user_name_c21" title=""
																value="" type="text" /></td>
														</tr>
														<tr>
															<th scope="row">
																<label for="mb_s_qanda_passwd_c22">비밀번호(*)</label>
															</th>
															<td><input class="mb-passwd" style="width: 100px;"
																name="passwd" id="mb_s_qanda_passwd_c22" title="" value=""
																autocomplete="off" type="password" /></td>
														</tr>
														<tr>
															<th scope="row">
																<label for="mb_s_qanda_kcaptcha_img_c23">자동등록방지</label>
															</th>
															<td><img decoding="async"
																style="width: 80px; height: 32px; vertical-align: top;"
																onclick="mb_reloadImage_class()"
																class="mb_kcaptcha cursor_pointer"
																src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/kcaptcha/kcaptcha_image.php?mode=comment&#038;board_action=write"
																id="mb_kcaptcha2" class="border-ccc-1" alt="자동등록방지" />
																<input class="kcaptcha" style="width: 70px; height: 30px !important;"
																name="kcaptcha_img" maxlength="6" value=""
																id=&quot;mb_s_qanda_kcaptcha_img_c23&quot; type="text"
																title="자동등록방지" />
																<span class="mb-description"><br>(자동등록방지 숫자를 입력해 주세요)</span>
															</td>
														</tr>
														<tr>
															<th scope="row">
																<label for="mb_s_qanda_content_c24">내용(*)</label>
															</th>
															<td>
																<textarea class="mb-comment-content" name="content" id="mb_s_qanda_content_c24"></textarea>
															</td>
														</tr>
													</tbody>
												</table>
											</form>
										</div>
										<div class="comment-btn">
											<div class="btn-box-right">
												<button onclick="sendCommentData('write',191);return false;"
													title="댓글 등록" class="btn btn-default" type="button">
													<span>댓글 등록</span>
												</button>
											</div>
										</div>
									</div>
								</fieldset>
							</div>
							<div id="comment_add_list_191" class="cmt-add-list" style="display: none;">
								<button onclick="sendCommentList(191);return false;" title="더보기"
									class="btn btn-default btn-more" type="button">
									<span>더보기</span>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="mb-qanda-reply-text-box">
					<span class="mb-qanda-reply-text">답변 작성</span>
				</div>
				<div class="mb-qanda-write-box mb-qanda-view-reply-write">
					<form name="s_qanda_form_board_write" id="s_qanda_form_board_write"
						method="post" enctype="multipart/form-data" autocomplete="off">
						<input type="hidden" name="mb_nonce_value"
							value="281b04ef7e637830f4e18f3577a349d8">
						<input type="hidden" name="mb_nonce_time" value="1710267371">
						<input type="hidden" id="wp_nonce_value" name="wp_nonce_value" value="4883e0cdaf">
						<input type="hidden" name="_wp_http_referer" value="/s_qanda_m1/?vid=185">
						<input type="hidden" name="lang" value="ko_KR">
						<input type="hidden" name="board_name" id="board_name" value="s_qanda">
						<input type="hidden" name="mode" id="mode" value="write">
						<input type="hidden" name="upload_size" id="upload_size" value="">
						<input type="hidden" name="search_field" id="search_field" value="fn_title">
						<input type="hidden" name="search_text" id="search_text" value="">
						<input type="hidden" name="board_page" id="board_page" value="1">
						<input type="hidden" name="board_action" id="board_action" value="reply">
						<input type="hidden" name="editor_type" id="editor_type" value="S">

						<input type="hidden" name="parent_pid" id="parent_pid" value="0">
						<input type="hidden" name="parent_user_pid" id="parent_user_pid"
							value="0">
						<input type="hidden" name="board_gid" id="board_gid" value="185">
						<input type="hidden" name="board_reply" id="board_reply" value="0">
						<input type="hidden" name="reply_depth" id="reply_depth" value="0">
						<input type="hidden" name="board_pid" id="board_pid" value="185">
						<input type="hidden" name="calendar_date" id="calendar_date"
							value="2023-12-20 22:50:20">
						<input type="password" autocomplete="off" style="display: none !important;">
						<div class="mb-style1">
							<div class="main-style1" id="s_qanda_board_box">
								<table cellspacing="0" cellpadding="0" border="0"
									class="table table-write">
									<caption>글쓰기</caption>
									<colgroup>
										<col class="mb-col-item1" style="width: 20%">
										<col class="mb-col-item2">
									</colgroup>
									<tbody>
										<tr id="mb_s_qanda_tr_passwd" style="display: none;">
											<th scope="row">
												<label for="mb_s_qanda_passwd_w26">비밀번호(*)</label>
											</th>
											<td><input class="mb-passwd" style="width: 150px;"
												name="passwd" id="mb_s_qanda_passwd_w26" title=""
												maxlength="16" value="" autocomplete="off" type="password"></td>
										</tr>
										<tr id="mb_s_qanda_tr_title" style="display: none;">
											<th scope="row"><label for="mb_s_qanda_title_w27">제목(*)</label></th>
											<td><input class="text-left" style="width: 99%;"
												name="title" id="mb_s_qanda_title_w27" title=""
												value="[re]GIF" type="text"></td>
										</tr>
										<tr id="mb_s_qanda_tr_content">
											<td class="content-box" colspan="2"
												style="overflow: visible;">
												<input type="hidden" name="data_type" id="data_type" value="html">
												<textarea class="mb-content"
													style="width: 100%; height: 360px; /* visibility: hidden; display: none; */ resize:none;"
													name="content" id="se_content" title="내용"></textarea>
												<div class="mb-editor-composer mb-editor-composer-se_content"
													style="border: 1px solid rgb(181, 181, 181); margin-top: -7px !important;">
													<input type="hidden" name="mb-editor-composer-id" value="se_content">
													<div class="mb-editor-attr-box" style="display: none;">
														<div class="mb-editor-composer-tabs">
															<div class="mp-editor-tabs-item mp-editor-tabs-selected"
																onclick="mb_setEditorTabs('se_content','mb-editor-composer-tabs',1,'mb-editor-composer-tab1')">
																<div class="mp-editor-tabs-item-box">
																	<span class="mb-style3-tabbg-left"></span>
																	<span class="mb-style3-tabbg-center">Text Box</span>
																	<span class="mb-style3-tabbg-right mp-tab-arrow-right"></span>
																	<span class="clear"></span>
																</div>
															</div>
															<div class="mp-editor-tabs-item"
																onclick="mb_setEditorTabs('se_content','mb-editor-composer-tabs',2,'mb-editor-composer-tab1')">
																<div class="mp-editor-tabs-item-box">
																	<span class="mb-style3-tabbg-left"></span>
																	<span class="mb-style3-tabbg-center">Responsive Box</span>
																	<span class="mb-style3-tabbg-right mp-tab-arrow-right"></span>
																	<span class="clear"></span>
																</div>
															</div>
															<div class="mp-editor-tabs-item"
																onclick="mb_setEditorTabs('se_content','mb-editor-composer-tabs',3,'mb-editor-composer-tab1')">
																<div class="mp-editor-tabs-item-box">
																	<span class="mb-style3-tabbg-left"></span>
																	<span class="mb-style3-tabbg-center">Wrap Box</span>
																	<span class="mb-style3-tabbg-right mp-tab-arrow-right"></span>
																	<span class="clear"></span>
																</div>
															</div>
														</div>
														<div class="mb-editor-composer-tab1 mb-editor-composer-tab11">
															<div class="col-sm-4">
																<div class="mb-inner-box mb-editor-style-box">
																	<div class="mb-editor-board-style5" style="background-color: #ffffff">
																		<div class="mb-editor-border mb-editor-board-style4"
																			style="background-color: #ffffff">
																			<div class="mb-editor-label1">Border</div>
																			<input type="text" name="mb-editor-border-top-width"
																				data-name="mb-editor-border-top-width"
																				class="mb-editor-border-top-width"
																				data-attribute="border" value="0">
																			<input type="text" name="mb-editor-border-right-width"
																				data-name="mb-editor-border-right-width"
																				class="mb-editor-border-right-width"
																				data-attribute="border" value="0">
																			<input type="text" name="mb-editor-border-bottom-width"
																				data-name="mb-editor-border-bottom-width"
																				class="mb-editor-border-bottom-width"
																				data-attribute="border" value="0">
																			<input type="text" name="mb-editor-border-left-width"
																				data-name="mb-editor-border-left-width"
																				class="mb-editor-border-left-width"
																				data-attribute="border" value="0">
																			<div class="mb-editor-padding mb-editor-board-style3"
																				style="border: 1px Solid #dddddd; border-radius: 0px; background-color: #ffffff">
																				<div class="mb-editor-label2">Padding</div>
																				<input type="text" name="mb-editor-padding-top"
																					data-name="mb-editor-padding-top"
																					class="mb-editor-padding-top"
																					data-attribute="padding" value="0">
																				<input type="text" name="mb-editor-padding-right"
																					data-name="mb-editor-padding-right"
																					class="mb-editor-padding-right"
																					data-attribute="padding" value="0">
																				<input type="text" name="mb-editor-padding-bottom"
																					data-name="mb-editor-padding-bottom"
																					class="mb-editor-padding-bottom"
																					data-attribute="padding" value="0">
																				<input type="text" name="mb-editor-padding-left"
																					data-name="mb-editor-padding-left"
																					class="mb-editor-padding-left"
																					data-attribute="padding" value="0">
																				<div class="mb-editor-board-style2">
																					<div class="mb-editor-board-style1">Text</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-sm-8">
																<div class="mb-editor-composer-tab-title">텍스트 박스</div>
																<div class="mb-editor-composer-tab-desc">점선으로 표시되는 안내선은 글작성 페이지에서만 표시됩니다</div>
																<div>
																	<div class="col-sm-6 mb-box-attr-border">
																		<div class="mb-box-attr-label">Border</div>
																		<div class="mb-box-attr-option">
																			<select class="mbc_inner_border_width"
																				style="min-width: 50px !important; width: 50px !important; vertical-align: top;"
																				title="Border Width">
																				<option value="0" selected="">0px</option>
																				<option value="1">1px</option>
																				<option value="2">2px</option>
																				<option value="3">3px</option>
																				<option value="4">4px</option>
																				<option value="5">5px</option>
																				<option value="6">6px</option>
																				<option value="7">7px</option>
																				<option value="8">8px</option>
																				<option value="9">9px</option>
																				<option value="10">10px</option>
																				<option value="11">11px</option>
																				<option value="12">12px</option>
																				<option value="13">13px</option>
																				<option value="14">14px</option>
																				<option value="15">15px</option>
																				<option value="16">16px</option>
																				<option value="17">17px</option>
																				<option value="18">18px</option>
																				<option value="19">19px</option>
																				<option value="20">20px</option>
																				<option value="30">30px</option>
																				<option value="40">40px</option>
																				<option value="50">50px</option>
																			</select>
																			<select class="mbc_inner_border_style"
																				style="min-width: 70px !important; width: 70px !important; margin-left: -5px;"
																				title="Border Style">
																				<option value="Solid">Solid</option>
																				<option value="Dotted">Dotted</option>
																				<option value="Dashed">Dashed</option>
																				<option value="Double">Double</option>
																				<option value="Groove">Groove</option>
																				<option value="Ridge">Ridge</option>
																				<option value="Inset">Inset</option>
																				<option value="Outset">Outset</option>
																			</select>
																			<div class="mbc-colorpicker input-group colorpicker-component"
																				style="display: inline-block; margin-left: -5px; vertical-align: top;">
																				<div style="width: 62px;" class="evo-cp-wrap">
																					<input type="text" value=""
																						class="mbc_inner_border_color colorPicker evo-cp0"
																						style="width: 70px !important; min-width: 70px !important; padding: 5px 3px;"
																						title="Border Color">
																					<div class="evo-colorind evo-hidden-button"
																						style="background-color: #dddddd"></div>
																				</div>
																				<span class="input-group-addon radius-0">
																					<i style="width: 28px; height: 28px;"></i>
																				</span>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="mb-box-attr-label">Border Radius</div>
																		<div class="mb-box-attr-option">
																			<select class="mbc_inner_border_radius" style=""
																				title="Border Radius">
																				<option value="0" selected="">0px</option>
																				<option value="1">1px</option>
																				<option value="2">2px</option>
																				<option value="3">3px</option>
																				<option value="4">4px</option>
																				<option value="5">5px</option>
																				<option value="10">10px</option>
																				<option value="15">15px</option>
																				<option value="20">20px</option>
																				<option value="25">25px</option>
																				<option value="30">30px</option>
																				<option value="35">35px</option>
																			</select>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="mb-box-attr-label">Padding</div>
																		<div class="mb-box-attr-option">
																			<select class="mbc_inner_padding" style="" title="Padding">
																				<option value="0" selected="">0px</option>
																				<option value="1">1px</option>
																				<option value="2">2px</option>
																				<option value="3">3px</option>
																				<option value="4">4px</option>
																				<option value="5">5px</option>
																				<option value="6">6px</option>
																				<option value="7">7px</option>
																				<option value="8">8px</option>
																				<option value="9">9px</option>
																				<option value="10">10px</option>
																				<option value="11">11px</option>
																				<option value="12">12px</option>
																				<option value="13">13px</option>
																				<option value="14">14px</option>
																				<option value="15">15px</option>
																				<option value="16">16px</option>
																				<option value="17">17px</option>
																				<option value="18">18px</option>
																				<option value="19">19px</option>
																				<option value="20">20px</option>
																				<option value="30">30px</option>
																				<option value="40">40px</option>
																				<option value="50">50px</option>
																			</select>
																		</div>
																	</div>
																	<div class="col-sm-6 mb-box-attr-bgcolor">
																		<div class="mb-box-attr-label">BG Color</div>
																		<div class="mb-box-attr-option">
																			<div class="mbc-colorpicker2 input-group colorpicker-component"
																				style="">
																				<div style="width: -8px;" class="evo-cp-wrap">
																					<input type="text" value=""
																						class="mbc_inner_background_color colorPicker evo-cp3"
																						style="padding: 5px 3px;" title="Background Color">
																					<div class="evo-colorind evo-hidden-button"
																						style="background-color: #ffffff"></div>
																				</div>
																				<span class="input-group-addon radius-0">
																					<i style="width: 28px; height: 28px;"></i>
																				</span>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="mb-box-attr-label">Style</div>
																		<div class="mb-box-attr-option">
																			<input style="" class="mbc_inner_style" value=""
																				type="text" title="CSS Style">
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="mb-box-attr-label">Class</div>
																		<div class="mb-box-attr-option">
																			<input style="" class="mbc_inner_class" value=""
																				type="text" title="CSS Class">
																		</div>
																	</div>
																	<div class="clear"></div>
																</div>
															</div>
															<div class="clear"></div>
														</div>
														<div style="display: none;"
															class="mb-editor-composer-tab1 mb-editor-composer-tab12">
															<div class="col-sm-4">
																<div class="mb-outer-box mb-editor-style-box">
																	<div class="mb-editor-board-style5">
																		<div class="mb-editor-border mb-editor-board-style4"
																			style="background-color: #ffffff">
																			<div class="mb-editor-label1">Border</div>
																			<input type="text" name="mb-editor-border-top-width"
																				data-name="mb-editor-border-top-width"
																				class="mb-editor-border-top-width"
																				data-attribute="border" value="0">
																			<input type="text" name="mb-editor-border-right-width"
																				data-name="mb-editor-border-right-width"
																				class="mb-editor-border-right-width"
																				data-attribute="border" value="0">
																			<input type="text" name="mb-editor-border-bottom-width"
																				data-name="mb-editor-border-bottom-width"
																				class="mb-editor-border-bottom-width"
																				data-attribute="border" value="0">
																			<input type="text" name="mb-editor-border-left-width"
																				data-name="mb-editor-border-left-width"
																				class="mb-editor-border-left-width"
																				data-attribute="border" value="0">
																			<div class="mb-editor-padding mb-editor-board-style3"
																				style="background-color: #ffffff">
																				<div class="mb-editor-label2">Padding</div>
																				<input type="text" name="mb-editor-padding-top"
																					data-name="mb-editor-padding-top"
																					class="mb-editor-padding-top"
																					data-attribute="padding" value="0">
																				<input type="text" name="mb-editor-padding-right"
																					data-name="mb-editor-padding-right"
																					class="mb-editor-padding-right"
																					data-attribute="padding" value="0">
																				<input type="text" name="mb-editor-padding-bottom"
																					data-name="mb-editor-padding-bottom"
																					class="mb-editor-padding-bottom"
																					data-attribute="padding" value="0">
																				<input type="text" name="mb-editor-padding-left"
																					data-name="mb-editor-padding-left"
																					class="mb-editor-padding-left"
																					data-attribute="padding" value="0">
																				<div class="mb-editor-board-style2"
																					style="border: 1px Solid #dddddd; border-radius: 0px; background-color: #ffffff">
																					<div class="mb-editor-board-style1">Text</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-sm-8">
																<div class="mb-editor-composer-tab-title">텍스트 박스를 감싸는 반응형 박스</div>
																<div class="mb-editor-composer-tab-desc">점선으로 표시되는 안내선은 글작성 페이지에서만 표시됩니다</div>
																<div>
																	<div class="col-sm-6 mb-box-attr-border">
																		<div class="mb-box-attr-label">Border</div>
																		<div class="mb-box-attr-option">
																			<select class="mbc_outer_border_width"
																				style="min-width: 50px !important; width: 50px !important; vertical-align: top;"
																				title="Border Width">
																				<option value="0" selected="">0px</option>
																				<option value="1">1px</option>
																				<option value="2">2px</option>
																				<option value="3">3px</option>
																				<option value="4">4px</option>
																				<option value="5">5px</option>
																				<option value="6">6px</option>
																				<option value="7">7px</option>
																				<option value="8">8px</option>
																				<option value="9">9px</option>
																				<option value="10">10px</option>
																				<option value="11">11px</option>
																				<option value="12">12px</option>
																				<option value="13">13px</option>
																				<option value="14">14px</option>
																				<option value="15">15px</option>
																				<option value="16">16px</option>
																				<option value="17">17px</option>
																				<option value="18">18px</option>
																				<option value="19">19px</option>
																				<option value="20">20px</option>
																				<option value="30">30px</option>
																				<option value="40">40px</option>
																				<option value="50">50px</option>
																			</select>
																			<select class="mbc_outer_border_style"
																				style="min-width: 70px !important; width: 70px !important; margin-left: -5px;"
																				title="Border Style">
																				<option value="Solid">Solid</option>
																				<option value="Dotted">Dotted</option>
																				<option value="Dashed">Dashed</option>
																				<option value="Double">Double</option>
																				<option value="Groove">Groove</option>
																				<option value="Ridge">Ridge</option>
																				<option value="Inset">Inset</option>
																				<option value="Outset">Outset</option></select>
																			<div class="mbc-colorpicker input-group colorpicker-component"
																				style="display: inline-block; margin-left: -5px; vertical-align: top;">
																				<div style="width: 62px;" class="evo-cp-wrap">
																					<input type="text" value=""
																						class="mbc_outer_border_color colorPicker evo-cp1"
																						style="width: 70px !important; min-width: 70px !important; padding: 5px 3px;"
																						title="Border Color">
																					<div class="evo-colorind evo-hidden-button"
																						style="background-color: #dddddd"></div>
																				</div>
																				<span class="input-group-addon radius-0">
																					<i style="width: 28px; height: 28px;"></i>
																				</span>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="mb-box-attr-label">Border Radius</div>
																		<div class="mb-box-attr-option">
																			<select class="mbc_outer_border_radius" style=""
																				title="Border Radius">
																				<option value="0" selected="">0px</option>
																				<option value="1">1px</option>
																				<option value="2">2px</option>
																				<option value="3">3px</option>
																				<option value="4">4px</option>
																				<option value="5">5px</option>
																				<option value="10">10px</option>
																				<option value="15">15px</option>
																				<option value="20">20px</option>
																				<option value="25">25px</option>
																				<option value="30">30px</option>
																				<option value="35">35px</option></select>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="mb-box-attr-label">Padding</div>
																		<div class="mb-box-attr-option">
																			<select class="mbc_outer_padding" style=""
																				title="Padding">
																				<option value="0" selected="">0px</option>
																				<option value="1">1px</option>
																				<option value="2">2px</option>
																				<option value="3">3px</option>
																				<option value="4">4px</option>
																				<option value="5">5px</option>
																				<option value="6">6px</option>
																				<option value="7">7px</option>
																				<option value="8">8px</option>
																				<option value="9">9px</option>
																				<option value="10">10px</option>
																				<option value="11">11px</option>
																				<option value="12">12px</option>
																				<option value="13">13px</option>
																				<option value="14">14px</option>
																				<option value="15">15px</option>
																				<option value="16">16px</option>
																				<option value="17">17px</option>
																				<option value="18">18px</option>
																				<option value="19">19px</option>
																				<option value="20">20px</option>
																				<option value="30">30px</option>
																				<option value="40">40px</option>
																				<option value="50">50px</option>
																			</select>
																		</div>
																	</div>
																	<div class="col-sm-6 mb-box-attr-bgcolor">
																		<div class="mb-box-attr-label">BG Color</div>
																		<div class="mb-box-attr-option">
																			<div class="mbc-colorpicker2 input-group colorpicker-component"
																				style="">
																				<div style="width: -8px;" class="evo-cp-wrap">
																					<input type="text" value=""
																						class="mbc_outer_background_color colorPicker evo-cp4"
																						style="padding: 5px 3px;" title="Background Color">
																					<div class="evo-colorind evo-hidden-button"
																						style="background-color: #ffffff"></div>
																				</div>
																				<span class="input-group-addon radius-0">
																					<i style="width: 28px; height: 28px;"></i>
																				</span>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="mb-box-attr-label">Style</div>
																		<div class="mb-box-attr-option">
																			<input style="" class="mbc_outer_style" value=""
																				type="text" title="CSS Style">
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="mb-box-attr-label">Class</div>
																		<div class="mb-box-attr-option">
																			<input style="" class="mbc_outer_class" value=""
																				type="text" title="CSS Class">
																		</div>
																	</div>
																	<div class="clear"></div>
																</div>
															</div>
															<div class="clear"></div>
														</div>
														<div style="display: none;"
															class="mb-editor-composer-tab1 mb-editor-composer-tab13">
															<div class="col-sm-4">
																<div class="mb-wrap-box mb-editor-style-box">
																	<div class="mb-editor-board-style5">
																		<div class="mb-editor-border mb-editor-board-style4">
																			<div class="mb-editor-label1">Border</div>
																			<input type="text" name="mb-editor-border-top-width"
																				data-name="mb-editor-border-top-width"
																				class="mb-editor-border-top-width"
																				data-attribute="border" value="0">
																			<input type="text" name="mb-editor-border-right-width"
																				data-name="mb-editor-border-right-width"
																				class="mb-editor-border-right-width"
																				data-attribute="border" value="0">
																			<input type="text" name="mb-editor-border-bottom-width"
																				data-name="mb-editor-border-bottom-width"
																				class="mb-editor-border-bottom-width"
																				data-attribute="border" value="0">
																			<input type="text" name="mb-editor-border-left-width"
																				data-name="mb-editor-border-left-width"
																				class="mb-editor-border-left-width"
																				data-attribute="border" value="0">
																			<div class="mb-editor-padding mb-editor-board-style3"
																				style="background-color: #ffffff">
																				<div class="mb-editor-label2">Padding</div>
																				<input type="text" name="mb-editor-padding-top"
																					data-name="mb-editor-padding-top"
																					class="mb-editor-padding-top"
																					data-attribute="padding" value="0">
																				<input type="text" name="mb-editor-padding-right"
																					data-name="mb-editor-padding-right"
																					class="mb-editor-padding-right"
																					data-attribute="padding" value="0">
																				<input type="text" name="mb-editor-padding-bottom"
																					data-name="mb-editor-padding-bottom"
																					class="mb-editor-padding-bottom"
																					data-attribute="padding" value="0">
																				<input type="text" name="mb-editor-padding-left"
																					data-name="mb-editor-padding-left"
																					class="mb-editor-padding-left"
																					data-attribute="padding" value="0">
																				<div class="mb-editor-board-style2"
																					style="background-color: #ffffff">
																					<div class="mb-editor-board-style1"
																						style="border: 1px Solid #dddddd; border-radius: 0px; background-color: #ffffff">Text</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-sm-8">
																<div class="mb-editor-composer-tab-title">반응형 박스를 감싸는 테두리 박스</div>
																<div class="mb-editor-composer-tab-desc">점선으로 표시되는 안내선은 글작성 페이지에서만 표시됩니다</div>
																<div>
																	<div class="col-sm-6 mb-box-attr-border">
																		<div class="mb-box-attr-label">Border</div>
																		<div class="mb-box-attr-option">
																			<select class="mbc_wrap_border_width"
																				style="min-width: 50px !important; width: 50px !important; vertical-align: top;"
																				title="Border Width">
																				<option value="0" selected="">0px</option>
																				<option value="1">1px</option>
																				<option value="2">2px</option>
																				<option value="3">3px</option>
																				<option value="4">4px</option>
																				<option value="5">5px</option>
																				<option value="6">6px</option>
																				<option value="7">7px</option>
																				<option value="8">8px</option>
																				<option value="9">9px</option>
																				<option value="10">10px</option>
																				<option value="11">11px</option>
																				<option value="12">12px</option>
																				<option value="13">13px</option>
																				<option value="14">14px</option>
																				<option value="15">15px</option>
																				<option value="16">16px</option>
																				<option value="17">17px</option>
																				<option value="18">18px</option>
																				<option value="19">19px</option>
																				<option value="20">20px</option>
																				<option value="30">30px</option>
																				<option value="40">40px</option>
																				<option value="50">50px</option>
																			</select>
																			<select class="mbc_wrap_border_style"
																				style="min-width: 70px !important; width: 70px !important; margin-left: -5px;"
																				title="Border Style">
																				<option value="Solid">Solid</option>
																				<option value="Dotted">Dotted</option>
																				<option value="Dashed">Dashed</option>
																				<option value="Double">Double</option>
																				<option value="Groove">Groove</option>
																				<option value="Ridge">Ridge</option>
																				<option value="Inset">Inset</option>
																				<option value="Outset">Outset</option>
																			</select>
																			<div class="mbc-colorpicker input-group colorpicker-component"
																				style="display: inline-block; margin-left: -5px; vertical-align: top;">
																				<div style="width: 62px;" class="evo-cp-wrap">
																					<input type="text" value=""
																						class="mbc_wrap_border_color colorPicker evo-cp2"
																						style="width: 70px !important; min-width: 70px !important; padding: 5px 3px;"
																						title="Border Color">
																					<div class="evo-colorind evo-hidden-button"
																						style="background-color: #dddddd"></div>
																				</div>
																				<span class="input-group-addon radius-0">
																					<i style="width: 28px; height: 28px;"></i>
																				</span>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="mb-box-attr-label">Border Radius</div>
																		<div class="mb-box-attr-option">
																			<select class="mbc_wrap_border_radius" style=""
																				title="Border Radius">
																				<option value="0" selected="">0px</option>
																				<option value="1">1px</option>
																				<option value="2">2px</option>
																				<option value="3">3px</option>
																				<option value="4">4px</option>
																				<option value="5">5px</option>
																				<option value="10">10px</option>
																				<option value="15">15px</option>
																				<option value="20">20px</option>
																				<option value="25">25px</option>
																				<option value="30">30px</option>
																				<option value="35">35px</option>
																			</select>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="mb-box-attr-label">Padding</div>
																		<div class="mb-box-attr-option">
																			<select class="mbc_wrap_padding" style=""
																				title="Padding">
																				<option value="0" selected="">0px</option>
																				<option value="1">1px</option>
																				<option value="2">2px</option>
																				<option value="3">3px</option>
																				<option value="4">4px</option>
																				<option value="5">5px</option>
																				<option value="6">6px</option>
																				<option value="7">7px</option>
																				<option value="8">8px</option>
																				<option value="9">9px</option>
																				<option value="10">10px</option>
																				<option value="11">11px</option>
																				<option value="12">12px</option>
																				<option value="13">13px</option>
																				<option value="14">14px</option>
																				<option value="15">15px</option>
																				<option value="16">16px</option>
																				<option value="17">17px</option>
																				<option value="18">18px</option>
																				<option value="19">19px</option>
																				<option value="20">20px</option>
																				<option value="30">30px</option>
																				<option value="40">40px</option>
																				<option value="50">50px</option>
																			</select>
																		</div>
																	</div>
																	<div class="col-sm-6 mb-box-attr-bgcolor">
																		<div class="mb-box-attr-label">BG Color</div>
																		<div class="mb-box-attr-option">
																			<div class="mbc-colorpicker2 input-group colorpicker-component"
																				style="">
																				<div style="width: -8px;" class="evo-cp-wrap">
																					<input type="text" value=""
																						class="mbc_wrap_background_color colorPicker evo-cp5"
																						style="padding: 5px 3px;" title="Background Color">
																					<div class="evo-colorind evo-hidden-button"
																						style="background-color: #ffffff"></div>
																				</div>
																				<span class="input-group-addon radius-0">
																					<i style="width: 28px; height: 28px;"></i>
																				</span>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="mb-box-attr-label">Style</div>
																		<div class="mb-box-attr-option">
																			<input style="" class="mbc_wrap_style" value=""
																				type="text" title="CSS Style">
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="mb-box-attr-label">Class</div>
																		<div class="mb-box-attr-option">
																			<input style="" class="mbc_wrap_class" value=""
																				type="text" title="CSS Class">
																		</div>
																	</div>
																	<div class="clear"></div>
																</div>
															</div>
															<div class="clear"></div>
														</div>
													</div>
													<div class="mb-layout-btn-box">
														<div
															class="mb-editor-video-box mb-editor-video-se_content">
															<input type="hidden" name="video_input_error1"
																value="동영상 URL 주소 또는 iframe 소스를 입력해주세요">
															<div class="mb-editor-video-header">동영상 추가</div>
															<div class="mb-editor-video-body">
																<div class="mb-editor-video-input-label">
																	<span>동영상 URL</span>
																</div>
																<textarea name="mb_editor_video_url"
																	class="mb_editor_video_url"
																	placeholder="동영상 URL 주소 또는 iframe 소스를 입력해주세요"></textarea>
																<div class="btn-box-center">
																	<button
																		onclick="mb_insertEditorVideo('se_content');return false;"
																		type="button" class="btn btn-default margin-right-10">
																		<span>확인</span>
																	</button>
																	<button
																		onclick="mb_hideEditorVideoBox('se_content');return false;"
																		type="button" class="btn btn-default">
																		<span>취소</span>
																	</button>
																</div>
															</div>
														</div>
														<div class="mb-layout-option-box">
															<div
																onclick="checkCSSDisplay('.mb-editor-video-se_content');return false;"
																class="mbc_editor_video cursor_pointer" title="동영상 추가">
																<img decoding="async"
																	src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/icon_editor_video.png"
																	style="width: 13px; margin: 3px 0 3px !important; vertical-align: top !important;">
																동영상
															</div>
															<span class="mb-editor-composer-vertical-bar1"></span>
															<select
															title="레이아웃 최대넓이를 선택합니다" class="mbc_editor_max_width"
															style="min-width: 70px;">
																<option value="100%" selected="">최대넓이</option>
																<option value="100%">100%</option>
																<option value="90%">90%</option>
																<option value="80%">80%</option>
																<option value="70%">70%</option>
																<option value="900px">900px</option>
																<option value="800px">800px</option>
																<option value="700px">700px</option>
																<option value="600px">600px</option>
																<option value="500px">500px</option>
																<option value="400px">400px</option>
																<option value="300px">300px</option>
																<option value="200px">200px</option>
																<option value="100px">100px</option>
															</select>
															<select title="레이아웃 행의 개수를 선택합니다" class="mbc_editor_line_count"
															style="min-width: 60px;">
																<option value="1" selected="">행개수</option>
																<option value="1">1</option>
																<option value="2">2</option>
																<option value="3">3</option>
																<option value="4">4</option>
																<option value="5">5</option>
																<option value="6">6</option>
																<option value="7">7</option>
																<option value="8">8</option>
																<option value="9">9</option>
																<option value="10">10</option>
																<option value="11">11</option>
																<option value="12">12</option>
																<option value="13">13</option>
																<option value="14">14</option>
																<option value="15">15</option>
																<option value="16">16</option>
																<option value="17">17</option>
																<option value="18">18</option>
																<option value="19">19</option>
																<option value="20">20</option>
																<option value="30">30</option>
																<option value="40">40</option>
																<option value="50">50</option>
																<option value="60">60</option>
																<option value="70">70</option>
																<option value="80">80</option>
																<option value="90">90</option>
																<option value="100">100</option>
																<option value="150">150</option>
																<option value="200">200</option>
																<option value="300">300</option>
																<option value="500">500</option>
															</select>
															<select title="텍스트 정렬을 선택합니다" class="mbc_editor_text_align"
																style="min-width: 62px;">
																<option value="" selected="">정렬</option>
																<option value="left">Left</option>
																<option value="center">Center</option>
																<option value="right">Right</option>
															</select>
															<span class="mb-editor-composer-vertical-bar2"></span>
														</div>
														<div onclick="mb_insertEditorLayout('se_content','L25-75');return false;"
															class="mb-layout-icon"
															title="Desktop(25%,75%), Tablet(25%,75%), Mobile(100%) 반응형 레이아웃을 에디터에 추가합니다">
															<img decoding="async"
																src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/25-75.png">
														</div>
														<div onclick="mb_insertEditorLayout('se_content','L30-70');return false;"
															class="mb-layout-icon"
															title="Desktop(30%,70%), Tablet(30%,70%), Mobile(100%) 반응형 레이아웃을 에디터에 추가합니다">
															<img decoding="async"
																src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/30-70.png">
														</div>
														<div onclick="mb_insertEditorLayout('se_content','L33-67');return false;"
															class="mb-layout-icon"
															title="Desktop(33%,67%), Tablet(33%,67%), Mobile(100%) 반응형 레이아웃을 에디터에 추가합니다">
															<img decoding="async"
																src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/33-67.png">
														</div>
														<div onclick="mb_insertEditorLayout('se_content','L67-33');return false;"
															class="mb-layout-icon"
															title="Desktop(67%,33%), Tablet(67%,33%), Mobile(100%) 반응형 레이아웃을 에디터에 추가합니다">
															<img decoding="async"
																src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/67-33.png">
														</div>
														<div onclick="mb_insertEditorLayout('se_content','L70-30');return false;"
															class="mb-layout-icon"
															title="Desktop(70%,30%), Tablet(70%,30%), Mobile(100%) 반응형 레이아웃을 에디터에 추가합니다">
															<img decoding="async"
																src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/70-30.png">
														</div>
														<div onclick="mb_insertEditorLayout('se_content','L75-25');return false;"
															class="mb-layout-icon"
															title="Desktop(75%,25%), Tablet(75%,25%), Mobile(100%) 반응형 레이아웃을 에디터에 추가합니다">
															<img decoding="async"
																src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/75-25.png">
														</div>
														<div onclick="mb_insertEditorLayout('se_content','col-221');return false;"
															class="mb-layout-icon"
															title="Desktop(50%,50%), Tablet(50%,50%), Mobile(100%) 반응형 레이아웃을 에디터에 추가합니다">
															<img decoding="async"
																src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/221.png">
														</div>
														<div onclick="mb_insertEditorLayout('se_content','col-321');return false;"
															class="mb-layout-icon"
															title="Desktop(33%,33%,33%), Tablet(50%,50%), Mobile(100%) 반응형 레이아웃을 에디터에 추가합니다">
															<img decoding="async"
																src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/321.png">
														</div>
														<div onclick="mb_insertEditorLayout('se_content','M331');return false;"
															class="mb-layout-icon"
															title="Desktop(30%,30%,30%), Tablet(30%,30%,30%), Mobile(100%) 반응형 레이아웃을 에디터에 추가합니다">
															<img decoding="async"
																src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/m331.png">
														</div>
														<div onclick="mb_insertEditorLayout('se_content','col-421');return false;"
															class="mb-layout-icon"
															title="Desktop(25%,25%,25%,25%), Tablet(50%,50%), Mobile(100%) 반응형 레이아웃을 에디터에 추가합니다">
															<img decoding="async"
																src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/421.png">
														</div>
														<div onclick="mb_insertEditorLayout('se_content','col-432');return false;"
															class="mb-layout-icon"
															title="Desktop(25%,25%,25%,25%), Tablet(33%,33%,33%), Mobile(50%,50%) 반응형 레이아웃을 에디터에 추가합니다">
															<img decoding="async"
																src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/432.png">
														</div>
														<div onclick="mb_insertEditorLayout('se_content','col-532');return false;"
															class="mb-layout-icon"
															title="Desktop(20%,20%,20%,20%,20%), Tablet(33%,33%,33%), Mobile(50%,50%) 반응형 레이아웃을 에디터에 추가합니다">
															<img decoding="async"
																src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/532.png">
														</div>
														<div onclick="mb_insertEditorLayout('se_content','col-543');return false;"
															class="mb-layout-icon"
															title="Desktop(20%,20%,20%,20%,20%), Tablet(25%,25%,25%,25%), Mobile(33%,33%,33%) 반응형 레이아웃을 에디터에 추가합니다">
															<img decoding="async"
																src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/543.png">
														</div>
														<div class="mb-editor-btn-box">
															<a class="mb-editor-hide-btn cursor_pointer"
																href="javascript:;"
																onclick="mb_showEditorAttrBox('se_content');return false;"
																title="확장패널 열기">
																<img decoding="async"
																src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/icon_arrow_down.png"
																style="width: 20px; height: 20px;">
															</a>
															<a class="mb-editor-show-btn cursor_pointer"
																style="display: none;" href="javascript:;"
																onclick="mb_hideEditorAttrBox('se_content');return false;"
																title="확장패널 닫기">
																<img decoding="async"
																src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/icon_arrow_up.png"
																style="width: 20px; height: 20px;">
															</a>
														</div>
													</div>
												</div>
											</td>
										</tr>
										<tr id="mb_s_qanda_tr_file1">
											<th scope="row"><label for="mb_s_qanda_file1_w29">파일1</label></th>
											<td><input class="mb-file-upload" style="width: 300px;"
												name="file1" id="mb_s_qanda_file1_w29" title="" value=""
												type="file"></td>
										</tr>
										<tr id="mb_s_qanda_tr_file2">
											<th scope="row"><label for="mb_s_qanda_file2_w30">파일2</label></th>
											<td><input class="mb-file-upload" style="width: 300px;"
												name="file2" id="mb_s_qanda_file2_w30" title="" value=""
												type="file"></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="write-btn">
								<div class="btn-box-right" id="s_qanda_btn_box">
									<div class="btn-box-left pull-left" style="">
										<button
											onclick="movePage('https://demo.mangboard.com/s_qanda_m1/?mode=list');return false;"
											title="목록" class="btn btn-default btn-list" type="button">
											<span>목록</span>
										</button>
									</div>
									<button onclick="checkWriteData();return false;" title="확인"
										class="btn btn-default btn-send-write" type="button">
										<span>확인</span>
									</button>
									<div class="clear"></div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="prev_next_style">
					<table cellspacing="0" cellpadding="0" border="0" class="table table-prev-next">
						<colgroup>
							<col style="width: 8%" />
							<col />
							<col style="width: 18%" />
							<col style="width: 14%" />
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><span>이전</span></th>
								<td class="pn_title">
									<a href="https://demo.mangboard.com/s_qanda_m1/?vid=193" title="ㄹㄹ">
										<span>ㄹㄹ</span>
									</a>
								</td>
								<td class="pn_user_name">
									<span>
										<a href="javascript:;" onclick="getUserMenu('1009','193');return false;"
											class="btn-user-picture" role="button">
											<img decoding="async" class="mb-user-small-picture radius-3" alt="user icon"
											style="vertical-align: middle; max-width: 20px; max-height: 20px;"
											src="https://phinf.pstatic.net/contact/20190701_173/15619717147898XnFx_PNG/avatar_profile.png" />
										</a>
										<a href="javascript:;" onclick="getUserMenu('1009','193','삶의무게를느끼며');return false;"
											title="삶의무게를느끼며 **0.127.2*0.**" class="btn-user-info"
											role="button">
											<span>삶의무게를느끼며</span>
										</a>
										<img decoding="async" class="user-i-level mb-level-1" alt="Level 1"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level1.gif" />
									</span>
								</td>
								<td class="pn_reg_date"><span>2024-02-29</span></td>
							</tr>
							<tr>
								<th scope="row"><span>다음</span></th>
								<td class="pn_title">
									<a href="https://demo.mangboard.com/s_qanda_m1/?vid=188" title="GIF"><span>GIF</span></a>
								</td>
								<td class="pn_user_name">
									<span>
										<a href="javascript:;" onclick="getUserMenu('108','188');return false;"
											class="btn-user-picture" role="button">
											<img decoding="async" class="mb-user-small-picture radius-3" alt="user icon"
											style="vertical-align: middle; max-width: 20px; max-height: 20px;"
											src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a>
										<a href="javascript:;" onclick="getUserMenu('108','188','sunnypark');return false;"
											title="sunnypark **2.146.20*.1**" class="btn-user-info"
											role="button">
											<span>sunnypark</span>
										</a>
										<img decoding="async" class="user-i-level mb-level-5" alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" />
									</span>
								</td>
								<td class="pn_reg_date"><span>2023-12-20</span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
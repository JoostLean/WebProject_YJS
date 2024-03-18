<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="./css/fonts.css" />
<link rel="stylesheet" href="./css/style.css" />
<link rel="stylesheet" href="./css/list/style.css" />
<link rel="stylesheet" href="./css/list/custom.css" />
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
			<div style="padding: 10px 3px 20px; font-size: 15px; line-height: 1.6em">
				<span class="mb-product-title-style1" style="font-weight: 600;">
					<a href="https://www.mangboard.com/store/?vid=25" target="_blank">질문&답변
						스킨 M1 <span class="mb-link-order">구매하기</span>
					</a>
				</span>
				<span>(질문 및 답변을 관리 할 수 있는 기능, 폰트크기 13px)</span>
			</div>
			<div class="mb-style1 board-list">
				<form name="s_qanda_form_board_search" id="s_qanda_form_board_search" method="post">
					<input type="hidden" name="board_name" value="s_qanda" />
					<div class="list-head">
						<div class="mb-category">
							<button onclick="sendTabReload('');return false;" title="전체"
								class="tab-menu-on" type="button">
								<span>전체</span>
							</button>
							<button
								onclick="sendTabReload('%EC%B9%B4%ED%85%8C%EA%B3%A0%EB%A6%AC1');return false;"
								title="카테고리1" class="tab-menu-off" type="button">
								<span>카테고리1</span>
							</button>
							<button
								onclick="sendTabReload('%EC%B9%B4%ED%85%8C%EA%B3%A0%EB%A6%AC2');return false;"
								title="카테고리2" class="tab-menu-off" type="button">
								<span>카테고리2</span>
							</button>
							<button
								onclick="sendTabReload('%EC%B9%B4%ED%85%8C%EA%B3%A0%EB%A6%AC3');return false;"
								title="카테고리3" class="tab-menu-off" type="button">
								<span>카테고리3</span>
							</button>
							<input type="hidden" name="category1" value="" />
							<input type="hidden" name="category2" value="" />
							<input type="hidden" name="category3" value="" />
						</div>
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
					<input type="hidden" name="board_name" id="board_name" value="s_qanda" />
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
					<input type="hidden" name="lang" value="ko_KR" />
					<div class="main-style1" id="s_qanda_board_box">
						<table cellspacing="0" cellpadding="0" border="0" id="tbl_board_list" class="table table-list">
							<colgroup>
								<col style="width: 50px" class="mb-col-pid mb-hide-mobile mb-hide-tablet" />
								<col class="mb-col-title" />
								<col style="width: 115px" class="mb-col-user-name" />
								<col style="width: 90px" class="mb-col-reg-date mb-hide-mobile" />
								<col style="width: 60px" class="mb-col-hit mb-hide-mobile mb-hide-tablet" />
								<col style="width: 74px" class="mb-col-ext9 mb-hide-mobile" />
							</colgroup>
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
								<tr id="mb_s_qanda_tr_1">
									<td class="mb-hide-mobile mb-hide-tablet"><span>193</span></td>
									<td class="text-left">
										<a href="https://demo.mangboard.com/s_qanda_m1/?vid=193" title="ㄹㄹ">
											<span>ㄹㄹ</span>
										</a>
									</td>
									<td>
										<span>
											<a href="javascript:;" onclick="getUserMenu('1009','193');return false;" class="btn-user-picture" role="button">
												<img decoding="async" class="mb-user-small-picture radius-3" alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://phinf.pstatic.net/contact/20190701_173/15619717147898XnFx_PNG/avatar_profile.png" />
											</a>
											<a href="javascript:;" onclick="getUserMenu('1009','193','삶의무게를느끼며');return false;"
											title="삶의무게를느끼며" class="btn-user-info" role="button">
												<span>삶의무게를느끼며</span>
											</a>
											<img decoding="async" class="user-i-level mb-level-1" alt="Level 1"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level1.gif" />
										</span>
									</td>
									<td class="mb-hide-mobile"><span>2024-02-29</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>4</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_2">
									<td class="mb-hide-mobile mb-hide-tablet"><span>190</span></td>
									<td class="text-left">
										<a href="https://demo.mangboard.com/s_qanda_m1/?vid=190" title="물품 주문합니다">
											<span>물품 주문합니다
												<img decoding="async" class="list-i-file" alt="file"
													src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_file.gif" />
											</span>
										</a>
									</td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','190');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','190','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2023-12-20</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>27</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_3">
									<td class="mb-hide-mobile mb-hide-tablet"><span>188</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=188"
										title="GIF"><span>GIF 
												<img decoding="async" class="list-i-file" alt="file"
												src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_file.gif" /></span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','188');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','188','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2023-12-20</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>6</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_4">
									<td class="mb-hide-mobile mb-hide-tablet"><span>185</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=185"
										title="GIF"><span>GIF
												<img decoding="async" class="list-i-file" alt="file"
												src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_file.gif" /></span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','185');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','185','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2023-12-20</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>5</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_5">
									<td class="mb-hide-mobile mb-hide-tablet"><span>184</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=184"
										title="JPG"><span>JPG
												<img decoding="async" class="list-i-file" alt="file"
												src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_file.gif" /></span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','184');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','184','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2023-12-20</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>7</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_6">
									<td class="mb-hide-mobile mb-hide-tablet"><span>183</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=183"
										title="PNG"><span>PNG
												<img decoding="async" class="list-i-file" alt="file"
												src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_file.gif" /></span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','183');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','183','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2023-12-20</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>6</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_7">
									<td class="mb-hide-mobile mb-hide-tablet"><span>182</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=182"
										title="ㄴㄹㅇㅇㄹ"><span>ㄴㄹㅇㅇㄹ
												<img decoding="async" class="list-i-file" alt="file"
												src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_file.gif" /></span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','182');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','182','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2023-12-20</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>3</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_8">
									<td class="mb-hide-mobile mb-hide-tablet"><span>179</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=179"
										title="파일첨부"><span>파일첨부
												<img decoding="async" class="list-i-file" alt="file"
												src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_file.gif" /></span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','179');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','179','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2023-12-20</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>2</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_9">
									<td class="mb-hide-mobile mb-hide-tablet"><span>178</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=178"
										title="테스트"><span> <img decoding="async"
												class="list-i-secret" alt="secret"
												src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_secret.gif" />
												테스트
												<img decoding="async" class="list-i-file" alt="file"
												src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_file.gif" /></span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','178');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','178','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2023-12-20</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>1</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-empty'>답변대기</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_10">
									<td class="mb-hide-mobile mb-hide-tablet"><span>175</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=175"
										title="테스트"><span>테스트</span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','175');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','175','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2023-07-13</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>31</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_11">
									<td class="mb-hide-mobile mb-hide-tablet"><span>174</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=174"
										title="[카테고리3] 테스트임다"><span><span
												class="category1-text category1-item3">[카테고리3]</span> 테스트임다
												</span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','174');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','174','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2023-06-21</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>15</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_12">
									<td class="mb-hide-mobile mb-hide-tablet"><span>172</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=172"
										title="test"><span>test</span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','172');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','172','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2023-05-29</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>12</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_13">
									<td class="mb-hide-mobile mb-hide-tablet"><span>170</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=170"
										title="[카테고리2] im testing u"><span><span
												class="category1-text category1-item2">[카테고리2]</span> im
												testing u
												<img decoding="async" class="list-i-file" alt="file"
												src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_file.gif" /></span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','170');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','170','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2023-03-15</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>31</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_14">
									<td class="mb-hide-mobile mb-hide-tablet"><span>167</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=167"
										title="[카테고리2] 와우"><span><span
												class="category1-text category1-item2">[카테고리2]</span> 와우</span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('933','167');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://ssl.pstatic.net/static/pwe/address/img_profile.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('933','167','-');return false;"
											title="-" class="btn-user-info" role="button"><span>-</span></a>
											<img decoding="async" class="user-i-level mb-level-1"
											alt="Level 1"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level1.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2023-02-14</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>23</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_15">
									<td class="mb-hide-mobile mb-hide-tablet"><span>157</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=157"
										title="[카테고리1] [Layout]INDONESIAJAKARTA_Ritz Carton Hotel_GDR"><span><span
												class="category1-text category1-item1">[카테고리1]</span>
												[Layout]INDONESIAJAKARTA_Ritz Carton Hotel_GDR
												<img decoding="async" class="list-i-file" alt="file"
												src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_file.gif" /></span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','157');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','157','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2022-11-21</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>52</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_16">
									<td class="mb-hide-mobile mb-hide-tablet"><span>150</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=150"
										title="[카테고리1] 테스트 질문 해 봅니당"><span><span
												class="category1-text category1-item1">[카테고리1]</span> 테스트 질문
												해 봅니당
												<img decoding="async" class="list-i-file" alt="file"
												src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_file.gif" /></span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('891','150');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="http://k.kakaocdn.net/dn/blk0Px/btq0iXpPqiR/50OeFfnTDZekqPXrqWju5k/img_110x110.jpg" />
										</a><a href="javascript:;"
											onclick="getUserMenu('891','150','Eungul Mark Cho');return false;"
											title="Eungul Mark Cho" class="btn-user-info" role="button"><span>Eungul
													Mark Cho</span></a> <img decoding="async"
											class="user-i-level mb-level-1" alt="Level 1"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level1.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2022-06-10</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>75</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_17">
									<td class="mb-hide-mobile mb-hide-tablet"><span>144</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=144"
										title="[카테고리1] 000 Prioject "><span><span
												class="category1-text category1-item1">[카테고리1]</span> 000
												Prioject <span class='cmt-count'> [<span
													class='cmt-count-num'>1</span>]
											</span>
												<img decoding="async" class="list-i-file" alt="file"
												src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_file.gif" /></span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','144');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','144','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2022-04-14</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>98</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_18">
									<td class="mb-hide-mobile mb-hide-tablet"><span>142</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=142"
										title="[카테고리1] dsf"><span><span
												class="category1-text category1-item1">[카테고리1]</span> dsf</span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','142');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','142','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2022-04-09</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>31</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_19">
									<td class="mb-hide-mobile mb-hide-tablet"><span>137</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=137"
										title="[카테고리3] 테스트 질문입니다."><span><span
												class="category1-text category1-item3">[카테고리3]</span> 테스트
												질문입니다.</span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','137');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','137','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2022-02-21</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>50</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_20">
									<td class="mb-hide-mobile mb-hide-tablet"><span>136</span></td>
									<td class="text-left"><a
										href="https://demo.mangboard.com/s_qanda_m1/?vid=136"
										title="[카테고리2] tewtstetse"><span><span
												class="category1-text category1-item2">[카테고리2]</span>
												tewtstetse</span></a></td>
									<td><span><a href="javascript:;"
											onclick="getUserMenu('108','136');return false;"
											class="btn-user-picture" role="button"><img
												decoding="async" class="mb-user-small-picture radius-3"
												alt="user icon"
												style="vertical-align: middle; max-width: 20px; max-height: 20px;"
												src="https://demo.mangboard.com/wp-content/uploads/mangboard/2022/03/27/F4821_80e35f7f1612247345303.png" />
										</a><a href="javascript:;"
											onclick="getUserMenu('108','136','sunnypark');return false;"
											title="sunnypark" class="btn-user-info" role="button"><span>sunnypark</span></a>
											<img decoding="async" class="user-i-level mb-level-5"
											alt="Level 5"
											src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/icon_level5.gif" /></span></td>
									<td class="mb-hide-mobile"><span>2022-01-10</span></td>
									<td class="mb-hide-mobile mb-hide-tablet"><span>35</span></td>
									<td class="mb-hide-mobile">
										<div class='mb-reply-status mb-reply-select'>답변완료</div>
									</td>
								</tr>
							</tbody>

						</table>
					</div>


					<div class="list-btn">
						<div class="btn-box-right" id="s_qanda_btn_box">
							<div class="btn-box-left" style="float: left;"></div>
							<button
								onclick="movePage('https://demo.mangboard.com/s_qanda_m1/?mode=write&#038;board_action=write');return false;"
								title="글쓰기" class="btn btn-default btn-write" type="button">
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
									<td class="page_arrow mb-disabled mb-mobile-hide"><a
										title="처음" class="btn-start" role="button"><span><img
												decoding="async"
												src="https://demo.mangboard.com/wp-content/plugins/mangboard/skins/bbs_qanda_m1/images/btn_paging_pprev.gif"
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>
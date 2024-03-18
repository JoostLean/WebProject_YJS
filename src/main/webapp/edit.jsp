<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
String sfile = (String) request.getAttribute("prevSfile");
String ofile = (String) request.getAttribute("prevOfile");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function validateForm(form) {
		if (form.user_name.value == "") {
			alert("작성자를 입력하세요.");
			form.user_name.focus();
			return false;
		}
		if (form.title.value == "") {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if (form.passwd.value == "") {
			alert("비밀번호를 입력하세요.");
			form.passwd.focus();
			return false;
		}
		if (form.content.value == "") {
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
	}
</script>
</head>
<link rel="stylesheet" href="./css/fonts.css" />
<link rel="stylesheet" href="./css/style.css" />
<link rel="stylesheet" href="./css/write/style.css" />
<link rel="stylesheet" href="./css/write/editor.css" />
<body>
	<div id="s_qanda_board" class="mb-board">
		<div class="mb-level-1 mb-name-s-qanda mb-mode-write mb-skin-bbs-qanda-m1">
			<form action="edit.do" onsubmit="return validateForm(this);"
				name="s_qanda_form_board_write" id="s_qanda_form_board_write"
				method="post" enctype="multipart/form-data" autocomplete="off">
				<!-- <input type="hidden" name="mb_nonce_value" value="2f5cf95d9ad6044fd961360392e720b2">
				<input type="hidden" name="mb_nonce_time" value="1710264501">
				<input type="hidden" id="wp_nonce_value" name="wp_nonce_value"
					value="4883e0cdaf">
				<input type="hidden" name="_wp_http_referer"
					value="/s_qanda_m1/?mode=write&amp;board_action=write">
				<input type="hidden" name="lang" value="ko_KR">
				<input type="hidden" name="board_name" id="board_name" value="s_qanda">
				<input type="hidden" name="mode" id="mode" value="write">
				<input type="hidden" name="upload_size" id="upload_size" value="">
				<input type="hidden" name="search_field" id="search_field" value="fn_title">
				<input type="hidden" name="search_text" id="search_text" value="">
				<input type="hidden" name="board_page" id="board_page" value="1">
				<input type="hidden" name="board_action" id="board_action" value="write">
				<input type="hidden" name="editor_type" id="editor_type" value="S">

				<input type="hidden" name="parent_pid" id="parent_pid" value="0">
				<input type="hidden" name="parent_user_pid" id="parent_user_pid" value="0">
				<input type="hidden" name="calendar_date" id="calendar_date" value="">
				<input type="password" autocomplete="off" style="display: none !important;"> -->
				<!-- 수정할 게시물의 일련번호 -->
				<input type="hidden" name="idx" value=${ dto.idx } />
				<!-- 기존에 등록된 파일명으로 만약 수정페이지에서 첨부파일을 변경하지
				않는다면 여기에 등록된 파일명을 update 처리한다. -->
				<input type="hidden" name="prevOfile" value="${ dto.ofile }" />
				<input type="hidden" name="prevSfile" value="${ dto.sfile }" />
				<div class="mb-style1">
					<div class="main-style1" id="s_qanda_board_box">
						<div>
							<div class="pull-right">
								<label><!-- <input name="is_secret" type="checkbox" value="1"
									onclick="checkBoxDisplayID(this,'mb_s_qanda_tr_passwd');">비밀글 --></label>
							</div>
							<div class="clear"></div>
						</div>

						<table cellspacing="0" cellpadding="0" border="0" class="table table-write">
							<caption>글쓰기</caption>
							<colgroup>
								<col class="mb-col-item1" style="width: 20%">
								<col class="mb-col-item2">
							</colgroup>
							<tbody>
								<!-- <tr id="mb_s_qanda_tr_category1">
									<th scope="row"><label for="mb_s_qanda_category1_w2">카테고리</label></th>
									<td>
										<select title="Category1" onchange="" name="category1"
										id="s_qanda_category1"><option value="" selected="">전체</option>
											<option value="카테고리1">카테고리1</option>
											<option value="카테고리2">카테고리2</option>
											<option value="카테고리3">카테고리3</option>
										</select>
										<input type="hidden" name="category2" value="">
										<input type="hidden" name="category3" value="">
									</td>
								</tr> -->
								<tr id="mb_s_basic21_tr_user_name">
									<th scope="row"><label for="mb_s_basic21_user_name_w3">작성자(*)</label></th>
									<td>
										<%-- <input class="mb-user-name" style="width:150px;"
										name="user_name" id="mb_s_basic21_user_name_w3" title=""
										value="${ UserName }" type="text" maxlength="20"> --%>
										<span>${ dto.name }</span>
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_title">
									<th scope="row"><label for="mb_s_qanda_title_w5">제목(*)</label></th>
									<td>
										<input class="text-left" style="width: 99%;"
										name="title" id="mb_s_qanda_title_w5" title="" value="${ dto.title }"
										type="text" />
									</td>
								</tr>
								<tr id="mb_s_qanda_tr_passwd">
									<th scope="row"><label for="mb_s_qanda_passwd_w4">비밀번호(*)</label></th>
									<td><input class="mb-passwd" style="width: 150px;"
										name="passwd" id="mb_s_qanda_passwd_w4" title=""
										maxlength="16" value="passwd-encrypted" autocomplete="off" type="password" readonly></td>
								</tr>
								<tr id="mb_s_qanda_tr_content">
									<td class="content-box" colspan="2" style="overflow: visible;">
										<input type="hidden" name="data_type" id="data_type" value="html">
										<textarea class="mb-content"
											style="width: 100%; height: 360px; /* visibility: hidden; display: none; */ resize: none;"
											name="content" id="se_content" title="내용">${ dto.content }</textarea>
										<!-- <div class="mb-editor-composer mb-editor-composer-se_content"
											style="border: 1px solid rgb(181, 181, 181); /* margin-top: -7px !important; */">
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
																	<select class="mbc_inner_border_radius" style="" title="Border Radius">
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
																		<span class="input-group-addon radius-0"><i
																			style="width: 28px; height: 28px;"></i></span>
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
																	<input
																		type="text" name="mb-editor-border-right-width"
																		data-name="mb-editor-border-right-width"
																		class="mb-editor-border-right-width"
																		data-attribute="border" value="0">
																	<input
																		type="text" name="mb-editor-border-bottom-width"
																		data-name="mb-editor-border-bottom-width"
																		class="mb-editor-border-bottom-width"
																		data-attribute="border" value="0">
																	<input
																		type="text" name="mb-editor-border-left-width"
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
																		<option value="Outset">Outset</option>
																	</select>
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
																		<option value="35">35px</option>
																	</select>
																</div>
															</div>
															<div class="col-sm-6">
																<div class="mb-box-attr-label">Padding</div>
																<div class="mb-box-attr-option">
																	<select class="mbc_outer_padding" style="" title="Padding">
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
																				style="border: 1px Solid #dddddd;
																				border-radius: 0px; background-color: #ffffff">Text</div>
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
																		style="min-width: 70px !important;
																		width: 70px !important; margin-left: -5px;"
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
																	<select class="mbc_wrap_padding" style="" title="Padding">
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
																		<span class="input-group-addon radius-0"><i
																			style="width: 28px; height: 28px;"></i></span>
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
												<div class="mb-editor-video-box mb-editor-video-se_content">
													<input type="hidden" name="video_input_error1"
														value="동영상 URL 주소 또는 iframe 소스를 입력해주세요">
													<div class="mb-editor-video-header">동영상 추가</div>
													<div class="mb-editor-video-body">
														<div class="mb-editor-video-input-label">
															<span>동영상 URL</span>
														</div>
														<textarea name="mb_editor_video_url" class="mb_editor_video_url"
															placeholder="동영상 URL 주소 또는 iframe 소스를 입력해주세요"></textarea>
														<div class="btn-box-center">
															<button onclick="mb_insertEditorVideo('se_content');return false;"
																type="button" class="btn btn-default margin-right-10">
																<span>확인</span>
															</button>
															<button onclick="mb_hideEditorVideoBox('se_content');return false;"
																type="button" class="btn btn-default">
																<span>취소</span>
															</button>
														</div>
													</div>
												</div>
												<div class="mb-layout-option-box">
													<div onclick="checkCSSDisplay('.mb-editor-video-se_content');return false;"
														class="mbc_editor_video cursor_pointer" title="동영상 추가">
														<img decoding="async"
															src="https://demo.mangboard.com/wp-content/plugins/mangboard/plugins/editor_composer/img/icon_editor_video.png"
															style="width: 13px; margin: 3px 0 3px !important; vertical-align: top !important;">
														동영상
													</div>
													<span class="mb-editor-composer-vertical-bar1"></span>
													<select title="레이아웃 최대넓이를 선택합니다" class="mbc_editor_max_width"
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
													<a class="mb-editor-hide-btn cursor_pointer" href="javascript:;"
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
										</div> -->
									</td>
								</tr>
								<!-- <tr id="mb_s_qanda_tr_tag">
									<th scope="row">
										<label for="mb_s_qanda_tag_w7">태그</label>
									</th>
									<td>
										<input class="tag" style="width: 99%;" name="tag"
										id="mb_s_qanda_tag_w7" title="" value="" type="text">
										<span class="mb-description">(태그는 쉼표로 구분해서 입력해 주세요)</span>
									</td>
								</tr> -->
								<tr id="mb_s_qanda_tr_file1">
									<th scope="row"><label for="mb_s_qanda_file1_w8">파일1</label></th>
									<td>
										<c:if test="${ not empty dto.ofile }">
										<label>
										<input type="file" name="ofile" style="display:none !important;" />
										<input class="mb-file-upload" name="file_delete_pid[]" id="mb_s_qanda_file1_w8"
										title="" type="checkbox">[삭제]
										<span>${ dto.ofile }</span>
										</label>
										</c:if>
										<c:if test="${ empty dto.ofile }">
										<!-- <input class="mb-file-upload" style="width: 300px;"
										name="file1" id="mb_s_qanda_file1_w8" title="" value=""
										type="file"> -->
										<input class="mb-file-upload" style="width: 300px;"
										name="ofile" id="mb_s_qanda_file1_w8" title="" value=""
										type="file">
										</c:if>
									</td>
								</tr>
								<!-- <tr id="mb_s_qanda_tr_file2">
									<th scope="row"><label for="mb_s_qanda_file2_w9">파일2</label></th>
									<td><input class="mb-file-upload" style="width: 300px;"
										name="file2" id="mb_s_qanda_file2_w9" title="" value=""
										type="file"></td>
								</tr> -->
							</tbody>
						</table>
					</div>
					<div class="write-btn">
						<div class="btn-box-right" id="s_qanda_btn_box">
							<div class="btn-box-left" style="float: left;">
								<button onclick="location.href='list3.do';"
									title="목록" class="btn btn-default btn-list" type="button">
									<span>목록</span>
								</button>
							</div>
							<button title="확인" class="btn btn-default btn-send-write" type="submit">
								<span>확인</span>
							</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
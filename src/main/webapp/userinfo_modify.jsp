<%@ page import="member.MemberDTO" %>
<%@ page import="member.MemberDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css" />
<link rel="stylesheet" href="./css/fonts.css" />
<link rel="stylesheet" href="./css/style.css" />
<link rel="stylesheet" href="./css/regist.css" />
</head>
<script>
function validateForm(form) {
	if (form.user_name.value == "") {
		alert("이름을 입력해주세요.");
		form.user_name.focus();
		return false;
	}
	if (form.passwd.value == "") {
		alert("비밀번호를 입력해주세요.");
		form.passwd.focus();
		return false;
	}
	if (form.passwd2.value == "") {
		alert("비밀번호 확인란에 비밀번호를 입력해주세요.");
		form.passwd2.focus();
		return false;
	}
}
</script>
<body>
	<div class="mb-board mb-user">
		<div class="mb-level-0 mb-name-user-register mb-mode-user mb-layout-responsive-box mb-layout-responsive-box2 mb-skin-bbs-basic">
			<div class="mb-style1">
				<div>
					<div class="main-style1 mb-max-width-700" id="users_board_box">
						<form name="mb_form_user" id="mb_form_user" onsubmit="return validateForm(this);" method="post"
							action="user_edit.do" enctype="multipart/form-data" autocomplete="off">
							<input type="password" style="display: none !important;">
							<div class="mb-user-title">
								<span>회원정보 수정</span>
							</div>
							<table cellspacing="0" cellpadding="0" border="0" class="table table-write">
								<caption>회원정보 수정</caption>
								<colgroup>
									<col class="mb-col-item1" style="width: 15%">
									<col class="mb-col-item2">
								</colgroup>
								<tbody>
									<tr id="mb_user_register_tr_user_id">
										<td colspan="2">
											<div class="mb-responsive-box">
												<div class="mb-responsive-box-item">
													<div class="mb-responsive-box-label">
														<label for="mb_user_register_user_id_w2">아이디(*)</label>
													</div>
													<div class="mb-responsive-box-content">
														<div style="display:flex;">
															<input style="width: 100%; color:#aaaaaa !important;" type="text" maxlength="50"
																name="user_id" title="" id="mb_user_register_user_id_w2"
																value="${ UserId }" readonly>
															<!-- <button onclick="checkUserIDExist();return false;"
																title="중복확인" class="btn btn-default margin-left-5"
																style="white-space: nowrap; padding: 5px 14px !important; text-align: center;"
																type="button">
																<span style="margin-left:-100%;margin-right:-100%;">중복확인</span>
															</button> -->														
														</div>
														<input type="hidden" name="user_id_check" value="">
														<!-- <span class="mb-description">(아이디는 영문으로 시작하는 4~50자 사이의 영문+숫자 조합으로 입력해 주세요)</span> -->
														<span class="mb-description">(아이디는 영문으로 시작하고, 8글자 이상 입력해야 합니다.)</span>
													</div>
												</div>
											</div>
										</td>
									</tr>   
									<tr id="mb_user_register_tr_user_name">
										<td colspan="2">
											<div class="mb-responsive-box">
												<div class="mb-responsive-box-item">
													<div class="mb-responsive-box-label">
														<label for="mb_user_register_user_name_w3">이름(*)</label>
													</div>
													<div class="mb-responsive-box-content">
														<input style="width: 100%;" type="text" maxlength="20"
															name="user_name" title=""
															id="mb_user_register_user_name_w3"
															value="${ UserName }">
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr id="mb_user_register_tr_passwd">
										<td colspan="2">
											<div class="mb-responsive-box">
												<div class="mb-responsive-box-item">
													<div class="mb-responsive-box-label">
														<label for="mb_user_register_passwd_w4">비밀번호(*)</label>
													</div>
													<div class="mb-responsive-box-content">
														<input style="width: 100%;" name="passwd"
															id="mb_user_register_passwd_w4" title="" maxlength="30"
															autocomplete="off" type="password"
															value="">
													</div>
												</div>
											</div>
										</td>
									</tr>
									<tr id="mb_user_register_tr_passwd2">
										<td colspan="2">
											<div class="mb-responsive-box">
												<div class="mb-responsive-box-item">
													<div class="mb-responsive-box-label">
														<label for="mb_user_register_passwd2_w5">비밀번호 확인(*)</label>
													</div>
													<div class="mb-responsive-box-content">
														<input style="width: 100%;" name="passwd2"
															id="mb_user_register_passwd2_w5" title="" maxlength="30"
															value="" autocomplete="off" type="password">
														<span class="mb-description">(입력한 비밀번호를 다시한번 입력해 주세요)</span>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btn-box-center padding-bottom-10" id="mb_btn_box">
								<button type="submit" title="수정하기"
									class="btn btn-default btn-send-user btn-send-form max-width-m100">
									<span>수정하기</span>
								</button>
							</div>
							<input type="hidden" name="mb_nonce_value" value="1441d5d9b5c5b305533a766a95a0344c">
							<input type="hidden" name="mb_nonce_time" value="1710257633">
							<input type="hidden" id="wp_nonce_value" name="wp_nonce_value" value="ae22764a70">
							<input type="hidden" name="_wp_http_referer" value="/user_register/?step=2">
							<input type="hidden" name="lang" value="ko_KR">
							<input type="hidden" name="board_name" id="board_name" value="user_register">
							<input type="hidden" name="mode" id="mode" value="write">
							<input type="hidden" name="board_action" id="board_action" value="write">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
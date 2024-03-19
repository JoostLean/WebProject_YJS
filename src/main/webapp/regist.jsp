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
function checkUserIDExist() {
	if (document.getElementById("mb_user_register_user_id_w2").value) {
		//XHR 객체를 생성한다.
		var xhr = new XMLHttpRequest();
		/* XHR을 post방식으로 요청하고 MemberCheckExist.java(서블릿)으로
		폼에서 받아온 아이디값을 전송한다. */
        xhr.open("POST", "user_exist_check.do", true);
		//post방식인 경우 Content-Type을 지정해야 한다고 한다.
        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        
		//콜백함수
        xhr.onreadystatechange = function() {
			//xhr.readyState==4 : 데이터를 전부 받은 상태, xhr.status==200 : 요청성공
        	if (xhr.readyState == 4 && xhr.status == 200) {
        		//뒤에 trim() 안 붙이면 응답값의 좌우에 무조건 공백이 있는걸로 인식되서 처리 안됨
        		if (xhr.responseText.trim() == "id_exist") {
        			alert("이미 존재하는 아이디입니다.");
        		} else if (xhr.responseText.trim() == "id_no_exist") {
        			alert("사용 가능한 아이디입니다.");
        		} else {
        			alert("아이디 검사 중 오류 발생. 다시 시도해주세요.");
        		}
        	}
        };
        //POST방식으로 "user_id"값 전송. 서블릿에도 해당 파라미터를 받아오는 구문이 있다.
        xhr.send("user_id=" + document.getElementById("mb_user_register_user_id_w2").value);
	} else {
		alert("아이디를 입력해주세요.");
	}
	return false;
}
function validateForm(form) {
	if (document.getElementById("mb_user_register_user_id_w2").value) {
		//콜백함수
        xhr.onreadystatechange = function() {
			//xhr.readyState==4 : 데이터를 전부 받은 상태, xhr.status==200 : 요청성공
        	if (xhr.readyState == 4 && xhr.status == 200) {
        		//뒤에 trim() 안 붙이면 응답값의 좌우에 무조건 공백이 있는걸로 인식되서 처리 안됨
        		if (xhr.responseText.trim() == "id_exist") {
        			alert("이미 존재하는 아이디입니다.");
        		}
        	}
        };
	}
	if (form.user_id.value.length < 8) {
		alert("8글자 이상의 아이디를 입력해주세요.");
		form.user_id.focus();
		return false;
	}
	if ((form.user_id.value[0] < 'a' || form.user_id.value[0] > 'z') &&
		(form.user_id.value[0] < 'A' || form.user_id.value[0] > 'Z')) {
		alert("아이디는 영문으로 시작하여야 합니다.");
		form.user_name.focus();
		return false;
	}
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
							action="regist.do" enctype="multipart/form-data" autocomplete="off">
							<input type="password" style="display: none !important;">
							<div class="mb-user-title">
								<span>회원가입</span>
							</div>
							<table cellspacing="0" cellpadding="0" border="0" class="table table-write">
								<caption>회원 가입</caption>
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
															<input style="width: 100%;" type="text" maxlength="50"
																name="user_id" title="" id="mb_user_register_user_id_w2"
																value="">
															<button onclick="checkUserIDExist();return false;"
																title="중복확인" class="btn btn-default margin-left-5"
																style="white-space: nowrap; padding: 5px 14px !important; text-align: center;"
																type="button">
																<span style="margin-left:-100%;margin-right:-100%;">중복확인</span>
															</button>														
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
															value="">
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
														<!-- <span class="mb-description">(비밀번호는 8자리 이상 입력해 주세요)</span> -->
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
									<!-- <tr id="mb_user_register_tr_user_email">
										<td colspan="2">
											<div class="mb-responsive-box">
												<div class="mb-responsive-box-item">
													<div class="mb-responsive-box-label">
														<label for="mb_user_register_user_email_w6">이메일</label>
													</div>
													<div class="mb-responsive-box-content">
														<input style="width: 100%;" name="user_email"
															id="mb_user_register_user_email_w6" title="" value=""
															type="text">
													</div>
												</div>
											</div>
										</td>
									</tr> -->
									<!-- <tr id="mb_user_register_tr_user_phone">
										<td colspan="2">
											<div class="mb-responsive-box">
												<div class="mb-responsive-box-item">
													<div class="mb-responsive-box-label">
														<label for="mb_user_register_user_phone_w7">핸드폰</label>
													</div>
													<div class="mb-responsive-box-content">
														<select style="width: 28% !important; min-width: 57px !important; max-width: 80px;"
															name="user_phone1" id="mb_user_register_user_phone_w71"
															title="">
															<option value="010">010</option>
															<option value="011">011</option>
															<option value="016">016</option>
															<option value="017">017</option>
															<option value="018">018</option>
															<option value="019">019</option>
														</select> - 
														<input type="text"
															class="mbi-next-focus-num" name="user_phone2"
															id="mb_user_register_user_phone_w72" value=""
															style="width: 28%; max-width: 80px; padding-left: 0 !important;
															padding-right: 0 !important; text-align: center;"
															maxlength="4" title="핸드폰"> - 
														<input type="text" class="mbi-next-focus-num" name="user_phone3"
															id="mb_user_register_user_phone_w73" value=""
															style="width: 28%; max-width: 80px; padding-left: 0 !important;
															padding-right: 0 !important; text-align: center;"
															maxlength="4" title="핸드폰">
														<input type="hidden" name="user_phone" id="mb_user_register_user_phone_w7" value="">
													</div>
												</div>
											</div>
										</td>
									</tr> -->
									<!-- <tr id="mb_user_register_tr_user_picture">
										<td colspan="2">
											<div class="mb-responsive-box">
												<div class="mb-responsive-box-item">
													<div class="mb-responsive-box-label">
														<label for="mb_user_register_user_picture_w8">썸네일</label>
													</div>
													<div class="mb-responsive-box-content">
														<input style="width: calc(100% - 68px);"
															name="user_picture" id="mb_user_register_user_picture_w8"
															accept="image/*" type="file">
													</div>
												</div>
											</div>
										</td>
									</tr> -->
									<!-- <tr id="mb_user_register_tr_home_address1">
										<td colspan="2">
											<div class="mb-responsive-box">
												<div class="mb-responsive-box-item">
													<div class="mb-responsive-box-label">
														<label for="mb_user_register_home_address1_w9">주소</label>
													</div>
													<div class="mb-responsive-box-content">
														<p style="margin: 0 !important;">
															<input type="text" name="home_postcode"
																id="home_postcode" readonly="" placeholder="우편번호"
																title="우편번호" value="" style="width: 80px;"
																onclick="getPostcodeIframe('home','mb_kakao_postcode1');return false;">
															<button
																onclick="getPostcodeIframe('home','mb_kakao_postcode1');return false;"
																title="주소찾기" class="btn btn-default margin-left-5"
																type="button">
																<span>주소찾기</span>
															</button>
														</p>
														<p style="margin: 5px 0 !important;">
															<input type="text" name="home_address1"
																id="home_address1" readonly="" placeholder="주소"
																title="주소" value="" style="width: 100%;"
																onclick="getPostcodeIframe('home','mb_kakao_postcode1');return false;">
														</p>
														<div id="mb_kakao_postcode1"
															style="display: none; border: 1px solid; width: 100%; height: 300px;
															overflow-x: auto; margin: 5px 0; position: relative">
															<img decoding="async"
																src="//t1.daumcdn.net/postcode/resource/images/close.png"
																style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
																onclick="document.getElementById('mb_kakao_postcode1').style.display='none';"
																alt="접기 버튼">
														</div>
														<p style="margin: 0 !important;">
															<input type="text" name="home_address2"
																id="home_address2" placeholder="상세주소" title="상세주소"
																value="" style="width: 100%;">
														</p>
													</div>
												</div>
											</div>
										</td>
									</tr> -->
									<!-- <tr id="mb_user_register_tr_allow_mailing">
										<td colspan="2">
											<div class="mb-responsive-box">
												<div class="mb-responsive-box-item">
													<div class="mb-responsive-box-label">
														<label for="mb_user_register_allow_mailing_w10">
															E-Mail 수신동의</label>
													</div>
													<div class="mb-responsive-box-content">
														<label for="mb_user_register_allow_mailing_w101">
															<input type="radio" name="allow_mailing"
															id="mb_user_register_allow_mailing_w101" value="1"
															checked="">
															<span> 수신</span>
														</label>
														<label for="mb_user_register_allow_mailing_w102">
															<input type="radio" name="allow_mailing"
															id="mb_user_register_allow_mailing_w102" value="0">
															<span>수신안함</span>
														</label>
													</div>
												</div>
											</div>
										</td>
									</tr> -->
								</tbody>
							</table>
							<div class="btn-box-center padding-bottom-10" id="mb_btn_box">
								<!-- <button onclick="sendUserRegisterData();return false;"
									title="가입하기"
									class="btn btn-default btn-send-user btn-send-form max-width-m100"
									type="button">
									<span>가입하기</span>
								</button> -->
								<button type="submit" title="가입하기"
									class="btn btn-default btn-send-user btn-send-form max-width-m100">
									<span>가입하기</span>
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
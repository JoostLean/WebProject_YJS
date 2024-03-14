<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/fonts.css" />
<link rel="stylesheet" href="./css/style.css" />
<link rel="stylesheet" href="./css/login.css" />
</head>
<body>
	<jsp:include page="./link.jsp" />
	<%-- <strong>${ authMessage }</strong> --%>
	<div class="mb-board mb-user">
		<div class="mb-level-0 mb-name-users mb-mode-user mb-skin-bbs-basic">
			<div class="mb-style1">
				<div>
					<div class="mb-login-template">
						<div class="mb-login-template1">
							<div class="mb-login-item-box">
								<script>
								function validateForm(form) {
									if (!form.user_id.value) {
										alert("아이디를 입력해주세요.");
										form.user_id.focus();
										return false;
									}
									if (form.user_password.value == "") {
										alert("패스워드를 입력해주세요.");
										form.user_password.focus();
										return false;
									}
								}
								</script>
								<!-- <form action="" id="mb_form_login" method="POST" onsubmit="return false"> -->
								<form action="login_acc.jsp" id="mb_form_login" method="POST" onsubmit="return validateForm(this);">
									<input type="hidden" name="mode" id="mode" value="user">
									<input type="hidden" name="board_action" id="board_action" value="login">
									<input type="hidden" name="board_name" value="users">
									<input type="hidden" name="mb_nonce_value" value="e8e3e19213a65d266524dac77e3e8870">
									<input type="hidden" name="mb_nonce_time" value="1710255942">
									<input type="hidden" id="wp_nonce_value" name="wp_nonce_value" value="ae22764a70">
									<input type="hidden" name="_wp_http_referer" value="/user_login/">
									<input type="hidden" name="lang" value="ko_KR">
									<div class="user-login-item user-auto-login ">
										<label class="user-auto-login-label cursor_pointer">
											<input name="rememberme" id="rememberme" type="checkbox" value="1"
												class="user-login-checkbox">로그인 상태유지
										</label>
									</div>
									<div class="user-login-input-wrap">
										<div class="mb-login-id-wrap">
											<label for="user_id">
												<div class="mb-login-label">아이디</div>
												<input name="user_id" id="user_id" class="user-login-input"
													type="text" placeholder="ID" value="">
											</label>
										</div>
										<div class="mb-login-passwd-wrap">
											<label for="user_password">
<!-- 											<div class="mb-login-label">비밀번호</div>
												<input name="user_password" id="user_password"
												onkeypress="checkEnterKey(sendLoginData,{'board_action':'login','form_id':'mb_form_login','redirect_to':''});"
												class="user-login-input" placeholder="Password"
												type="password" maxlength="30" value="test"> -->
												<div class="mb-login-label">비밀번호</div>
												<input name="user_password" id="user_password"
												class="user-login-input" placeholder="Password"
												type="password" maxlength="30" value="">
											</label>
										</div>
									</div>
									<div class="btn-login-wrap">
<!-- 									<button
											onclick="sendLoginData({'board_action':'login','form_id':'mb_form_login','redirect_to':''});return false;"
											title="로그인" class="btn btn-default btn-login"
											style="padding: 5px 10px !important;" type="button"> -->
										<button title="로그인" class="btn btn-default btn-login"
											style="padding: 5px 10px !important;" type="submit">
											<span>로그인</span>
										</button>
									</div>
									<!-- <div class="user-login-item">
										<div class="clear"></div>
										<div class="mb-social mb-social-login">
											<div class="mb-social-title">Social Login</div>
											<div class="mb-social-btn-box">
												<a style="margin-right: 10px;"
													onclick="requestSocialLoginData('kakao')">
													<img decoding="async" src="images/icon_kakao.png"
													style="max-width: 33px; max-height: 33px;"
													title="Login with Kakao" alt="Login with Kakao"
													class="radius-4"></a><a class="margin-right-10"
													onclick="requestSocialLoginData('naver')">
													<img decoding="async" src="images/icon_naver.png"
													style="max-width: 33px; max-height: 33px;"
													title="Login with Naver" alt="Login with Naver"
													class="radius-4"></a><a class="margin-right-10"
													onclick="requestSocialLoginData('google')">
													<img decoding="async" src="images/icon_google.png"
													style="max-width: 33px; max-height: 33px;"
													title="Login with Google Plus" alt="Login with Google Plus"
													class="radius-4"></a><a class="margin-right-10"
													onclick="requestSocialLoginData('facebook')">
													<img decoding="async" src="images/icon_facebook.png"
													style="max-width: 33px; max-height: 33px;"
													title="Login with Facebook" alt="Login with Facebook"
													class="radius-4"></a><a class="margin-right-10"
													onclick="requestSocialLoginData('instagram')">
													<img decoding="async" src="images/icon_instagram.png"
													style="max-width: 33px; max-height: 33px;"
													title="Login with Twitter" alt="Login with instagram"
													class="radius-4"></a><a
													onclick="requestSocialLoginData('twitter')">
													<img decoding="async" src="images/icon_twitter.png"
													style="max-width: 33px; max-height: 33px;"
													title="Login with Twitter" alt="Login with Twitter"
													class="radius-4"></a>
											</div>
										</div>
									</div> -->
								</form>
							</div>
							<div class="mb-login-btn-box">
								<div class="btn-box-right btn-login-box-wrap">
									<button onclick="location.href='regist.jsp'"
										title="회원 가입" class="btn btn-default btn-write" type="button">
										<span>회원 가입</span>
									</button>
<!-- 									<button onclick="movePage('https://demo.mangboard.com/user_register/');return false;"
										title="회원 가입" class="btn btn-default btn-write" type="button">
										<span>회원 가입</span>
									</button> -->
									<!-- <button onclick="movePage('https://demo.mangboard.com/lost_password/');return false;"
										title="아이디/비밀번호 찾기" class="btn btn-default btn-write"
										type="button">
										<span>아이디/비밀번호 찾기</span>
									</button> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
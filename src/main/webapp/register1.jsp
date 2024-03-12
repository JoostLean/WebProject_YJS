<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="pop-bg" id="mb_pop_bg" onclick="hidePopupAlert()"
		style="height: 1561px; display: block;"></div>
	<div class="pop-main mb-desktop-large">
		<div class="pop-html" id="mb_pop_html"
			style="position: absolute; top: 356.5px; left: 951.5px; display: none;">
			<div id="mb_pop_html_head"></div>
			<div id="mb_pop_html_body"></div>
		</div>
		<div class="mb-pop pop-info" id="mb_pop_info"
			style="left: 950.5px; top: 475.5px; display: none;">
			<div id="mb_pop_info_head"></div>
			<div id="mb_pop_info_body"></div>
		</div>
		<div class="mb-pop pop-confirm" id="mb_pop_confirm"
			style="left: 795.5px; top: 346.5px; display: none;">
			<div class="pop-confirm-head" id="mb_pop_confirm_head"></div>
			<div class="pop-confirm-body" id="mb_pop_confirm_body"></div>
		</div>
		<div class="mb-pop pop-alert mb-ani-pop-open" id="mb_pop_alert"
			style="left: 795.5px; top: 264.305px; display: block;">
			<div class="pop-alert-head" id="mb_pop_alert_head">
				<div class="pop-title" id="mb_pop_alert_text">
					<div class="pop-title-head">Message</div>
					<div class="pop-title-message">
						정상적으로 회원가입 되었습니다<br>(로그인 페이지로 이동합니다)
						<!-- 회원탈퇴 신청이 완료되었습니다.<br />이용하셨던 계정정보는 신청후 3~7일이 지나면 삭제되며 다시 복구할 수 없는 점 참고해 주시기 바랍니다. -->
					</div>
				</div>
			</div>
			<div class="pop-alert-body" id="mb_pop_alert_body">
				<div class="btn-box-center">
					<a href="javascript:;" id="mb_pop_alert_ok"
						onclick="showAlertCallback('','','','');"
						class="btn btn-default btn-ok"><span>확인</span></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
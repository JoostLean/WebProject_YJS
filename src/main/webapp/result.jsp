<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemberDTO"%>
<%
request.setCharacterEncoding("UTF-8");
MemberDTO dto = (MemberDTO) request.getAttribute("dto");
%>
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
	<strong>${ authMessage }</strong>
	<div class="mb-board mb-user">
		<div class="mb-level-0 mb-name-users mb-mode-user mb-skin-bbs-basic">
			<div class="mb-style1">
				<div>
					<div class="mb-login-template">
						<div class="mb-login-template1">
							<div class="mb-login-item-box">
								<!-- <form action="" id="mb_form_login" method="POST" onsubmit="return false"> -->
								<p><%=dto.getName() %> 님. 아이디 <%=dto.getId() %>로 가입되셨습니다.</p>
								<p>가입을 환영합니다.</p>
							</div>
							<div class="mb-login-btn-box">
								<div class="btn-box-right btn-login-box-wrap">
									<button onclick=""
										title="로그인" class="btn btn-default"
										type="button">
										<span>로그인</span>
									</button>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="member.MemberDTO"%>
<%
request.setCharacterEncoding("UTF-8");
MemberDTO dto = (MemberDTO) request.getAttribute("dto");
String resultBtnType = (String) request.getAttribute("resultBtnType");
String resultBtnTypeJsp = (String) session.getAttribute("resultBtnType");
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
	<%-- <strong>${ authMessage }</strong> --%>
	<div class="mb-board mb-user">
		<div class="mb-level-0 mb-name-users mb-mode-user mb-skin-bbs-basic">
			<div class="mb-style1">
				<div>
					<div class="mb-login-template">
						<div class="mb-login-template1">
							<div class="mb-login-item-box">
								${ authMessage }
								<!-- <form action="" id="mb_form_login" method="POST" onsubmit="return false"> -->
								
								<%-- <%
								if (dto.getId() != null) {
								%>
								<p><%=dto.getName() %> 님. 아이디 <%=dto.getId() %>로 가입되셨습니다.</p>
								<p>가입을 환영합니다.</p>
								<%
								} else {
								%>
								<p>회원가입이 정상적으로 이루어지지 않았습니다.</p>
								<p>다시 시도해주세요.</p>
								<%
								}
								%> --%>
							</div>
							<div class="mb-login-btn-box">
								<div class="btn-box-right btn-login-box-wrap">
									<%
									if(resultBtnType == "regist") {
									%>
									<button onclick="location.href='login_form.jsp'"
										title="로그인" class="btn btn-default"
										type="button">
										<span>로그인</span>
									</button>
									<%
									} else if (resultBtnTypeJsp == "login") {
									%>
									<button onclick="location.href='list.jsp'"
										title="게시판 바로가기" class="btn btn-default"
										type="button">
										<span>게시판 바로가기</span>
									</button>
									<%
									} else if (resultBtnTypeJsp == "loginError") {
									%>
									<button onclick="location.href='login_form.jsp'"
										title="로그인" class="btn btn-default"
										type="button">
										<span>로그인</span>
									</button>
									<%
									} else if (resultBtnTypeJsp == "logged") {
									%>
									<button onclick="location.href='regist.jsp'"
										title="게시판 바로가기" class="btn btn-default"
										type="button">
										<span>회원정보수정</span>
									</button>
									<button onclick="location.href='list.jsp'"
										title="게시판 바로가기" class="btn btn-default"
										type="button">
										<span>게시판 바로가기</span>
									</button>
									<%
									} else if (resultBtnTypeJsp == "logout") {
									%>
									<button onclick="location.href='login_form.jsp'"
										title="로그인 페이지로 이동" class="btn btn-default"
										type="button">
										<span>로그인 페이지로 이동</span>
									</button>
									<%
									}
									%>
<%-- 								<%
									if (dto.getId() != null) {
									%>
									<button onclick="location.href='login_form.jsp'"
										title="로그인" class="btn btn-default"
										type="button">
										<span>로그인</span>
									</button>
									<%
									} else {
									%>
									<button onclick="location.href='regist.jsp'"
										title="회원가입" class="btn btn-default"
										type="button">
										<span>회원가입</span>
									</button>
									<%
									}
									%> --%>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<script type="text/javascript">
	//글쓰기 페이지에서 사용한 부분에서 패스워드 검증만 남긴다.
	function validateForm(form) {
		if (form.pass.value == "") {
			alert("비밀번호를 입력하세요.");
			form.pass.focus();
			return false;
		}
	}
</script>
</head>
<body>
<h2>파일 첨부형 게시판 - 비밀번호 검증(Pass)</h2>
<!--
패스워드만 전송하면 되므로 enctype은 삭제한다.
-->
<form name="writeFrm" method="post" action="validate.do"
	onsubmit="return validateForm(this);">

	<!--
	패스워드 검증을 위해 게시물의 일련번호와 mode를 전송해야 하므로 hidden박스에
	값을 저장한다.
	파라미터 중 idx는 EL의 param 내장객체로 받아오고(방법2), mode는 서블릿에서
	request 영역에 저장된 값을 가져온다.
	-->
	<input type="hidden" name="idx" value="${ param.idx }" />
	<input type="hidden" name="mode" value="${ mode }" /><!-- requestScope.mode -->
	<table border="1" width="90%">
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="pass" style="width:100px;" />
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">검증하기</button>
				<button type="reset">RESET</button>
				<button type="button" onclick="location.href='list.do';">
					목록 바로가기
				</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>
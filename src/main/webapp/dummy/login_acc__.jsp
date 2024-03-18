<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그인 폼에서 입력한 값을 받는다.
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_password");
/* System.out.println(userId+"="+userPwd);
out.println(userId+"="+userPwd); */

//web.xml에 입력한 컨텍스트 초기화 파라미터를 읽어온다.
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

//위 정보를 통해 DAO 인스턴스를 생성하고 오라클에 연결한다.
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
//메서드 호출을 통해 아이디, 패스워드와 일치하는 회원정보가 있는지 확인한다.
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
//자원반납
dao.close();

if(memberDTO.getId() != null) {
	//로그인에 성공한 경우 세션영역에 회원정보를 저장한다.
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName());
	
	session.setAttribute("authMessage", "<p>아이디 '" + userId + "'로 로그인 완료되었습니다.</p>");
	session.setAttribute("resultBtnType", "login");
	
	//그리고 로그인 페이지로 '이동'한다.
	response.sendRedirect("result.jsp");
	/*
	세션 영역에 저장된 속성값은 웹브라우저를 닫을때까지 유지되므로 이동
	후에도 그 정보를 확인할 수 있다.
	*/
}
else {
	session.setAttribute("authMessage", "<p>아이디 혹은 패스워드가 잘못되었습니다.</p>");
	session.setAttribute("resultBtnType", "loginError");
	response.sendRedirect("result.jsp");
}
%>
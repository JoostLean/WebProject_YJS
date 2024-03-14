<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%@ page import="member.MemberDTO"%>
<%
request.setCharacterEncoding("UTF-8");
MemberDTO dto = (MemberDTO) request.getAttribute("dto");
%>
<% if (session.getAttribute("UserId") == null) {
   response.sendRedirect("login_form.jsp");
} else {
    session.setAttribute("authMessage", "<p>아이디 : "+ session.getAttribute("UserId") +"</p><p>환영합니다.</p>");
	session.setAttribute("resultBtnType", "logged");
%>
<jsp:include page="/result.jsp" />
<%
}
%>
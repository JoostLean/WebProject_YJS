<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<% if (session.getAttribute("UserId") == null) {
   response.sendRedirect("login_form.jsp");
} else {
    session.setAttribute("authMessage", "<p>"+ session.getAttribute("UserName") +" 님 환영합니다.</p>");
	session.setAttribute("resultBtnType", "logged");
%>
<jsp:include page="/result.jsp" />
<%
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그아웃 처리
//session영역에 저장된 속성명을 지정해서 삭제한다.
session.removeAttribute("UserId");
session.removeAttribute("UserName");

session.setAttribute("authMessage", "<p>로그아웃이 완료되었습니다.</p>");
session.setAttribute("resultBtnType", "logout");
response.sendRedirect("result.jsp");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- 링크경로(Head포함) -->
<%@include file="../../module/link.jsp" %>


<body>

<div class="container-fluid">
<!-- meta_Header -->
<%@include file="../../module/meta_header.jsp" %>
<!-- header -->
<%@include file="../../module/header.jsp" %>
<!-- nav -->
<%@include file="../../module/nav.jsp" %>
</div>

<h1>정보 조회 페이지</h1>
<%@page import="vo.*" %>
<%
	MemberVO vo = (MemberVO)request.getAttribute("vo");
	out.println("EMAIL : "+vo.getEmail()+"<br>");
	out.println("PW : "+vo.getPwd()+"<br>");
	out.println("ADDR1 : "+vo.getAddr1()+"<br>");
	out.println("ADDR2 : "+vo.getAddr2()+"<br>");
	out.println("ROLE : "+vo.getRole()+"<br>");
%>
</body>
</html>
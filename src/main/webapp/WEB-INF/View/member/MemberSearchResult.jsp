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

<h1>회원 정보</h1>
<%@page import="vo.*" %>
<table>
	<tr>
		<td  style="border:1px solid black;">
			<%
				MemberVO vo = (MemberVO)request.getAttribute("vo");
				out.println("EMAIL : "+vo.getEmail()+"<br>");
				out.println("PW : "+vo.getPwd()+"<br>");
				out.println("ADDR1 : "+vo.getAddr1()+"<br>");
				out.println("ADDR2 : "+vo.getAddr2()+"<br>");
				out.println("ROLE : "+vo.getRole()+"<br>");
			%>
		</td>
	</tr>
</table>

</body>
</html>
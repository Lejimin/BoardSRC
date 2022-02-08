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
    <%@include file="../../module/header.jsp" %></%@include>
<!-- nav -->
<%@include file="../../module/nav.jsp" %>


<div class="page-contents p-3">
<!--페이지 위치정보(브레드크럼 사용~) -->
<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="/Home.do">Home</a></li>
    <li class="breadcrumb-item"><a href="/Board/list.do">Board</a></li>
    <li class="breadcrumb-item"><a href="/Board/list.do">List</a></li>
    <li class="breadcrumb-item active" aria-current="page">Read</li>
  </ol>
</nav>

<%@page import="vo.*" %>
<%
	BoardVO vo = (BoardVO)session.getAttribute("BoardVO");
	String nowPage = (String)request.getAttribute("nowPage");
%>

<h2 class="mb-4">글내용</h2>
<table class="table w-75">
	<tr>
		<th>이메일</th>
		<td><%=vo.getEmail() %></td>
		<th>등록날짜</th>
		<td><%=vo.getRegdate() %></td>
	</tr>
	<tr>
		<th>제 목</th>
		<td colspan="3"><%=vo.getSubject() %></td>
	</tr>
	<tr>
		<th>첨부파일</th>
		<td colspan="3"><%=vo.getFilename() %> (<%=vo.getFilesize() %> byte)</td>
	</tr>
	<tr>
		<td colspan="4" style="height:250px;"><textarea rows=10 cols=50 class="form-control"><%=vo.getContent() %></textarea></td>
	</tr>
	<tr>
		<td colspan="4" align="right">IP : <%=vo.getIp() %> / 조회수 : <%=vo.getCount() %> </td>
	</tr>
	<tr>
		<td colspan="4">
		<a href="javascript:history.go(-1)" class="btn btn-primary">LIST</a>&nbsp;
		<a href="#" class="btn btn-primary">UPDATE</a>&nbsp;
		<a href="#" class="btn btn-primary">DELETE</a>&nbsp;
		</td>
	</tr>
</table>
<!-- page content 끝 -->
</div>
<!-- container-fluid 끝 -->
</div>

</body>
</html>
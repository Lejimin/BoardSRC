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

<%
	int totalRecode=0;  //전체게시물 수
	int numPerPage=10; //페이지당 게시물 수
	
	int totalPage=0;  //전체페이지 수
	int nowPage=0;     //현재 읽고있는 페이지
	
	int start=0;     //읽을 시작게시물 위치(DB로 전달)
	int end=0; 		//start로부터 총 읽을 게시물 수 (DB로 전달)
	
	totalRecode = (int)request.getAttribute("tcnt");
	totalPage = (int)Math.ceil((double)totalRecode / numPerPage);  //게시물수를 나눴을때 소수점이 생길시 올림처리를 해서 페이지 수를 하나 증가해준다
	//Math.ceil은 올림 처리
%>


<div class="page-contents p-3">
<!--페이지 위치정보(브레드크럼 사용~) -->
<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="#">Home</a></li>
    <li class="breadcrumb-item"><a href="#">Board</a></li>
    <li class="breadcrumb-item active" aria-current="page">List</li>
  </ol>
</nav>
<h2 class="mb-4">자유 게시판</h2>


<!--게시판 상단헤더(현재페이지/전체페이지)  -->
<table class="w-75">
	<tr>
		<td>
			Page : <span style="color:red">1</span> / <%=totalPage %> Page
		</td>
	</tr>
</table>


<!--게시물 리스트   -->
<table class="table w-75">
<!-- 게시물 열이름 -->
	<tr>
		<td>번 호</td>
		<td>제 목</td>
		<td>이 름</td>
		<td>날 짜</td>
		<td>조회수</td>
	</tr>
	
	<!-- 본문 -->
	<%@page import="java.util.*,vo.*" %>
	<%
		Vector<BoardVO>	 list = (Vector<BoardVO>)request.getAttribute("list");
		for(int i=0;i<list.size();i++){
		%>
			<tr>
				<td><%=list.get(i).getNum() %></td>
				<td><%=list.get(i).getSubject() %></td>
				<td><%=list.get(i).getEmail() %></td>
				<td><%=list.get(i).getRegdate() %></td>
				<td><%=list.get(i).getCount() %></td>
			</tr>
		<%
		}
	%>
	
</table>

<!--페이징처리/글쓰기&처음으로 버튼  -->
<table class="table w-75">
	<tr>
		<!-- 페이징처리 -->
		<td colspan=3>
		<nav aria-label="Page navigation example">
  			<ul class="pagination">
    		<li class="page-item">
      			<a class="page-link" href="#" aria-label="Previous">
        			<span aria-hidden="true">&laquo;</span>
      			</a>
    		</li>
   			<li class="page-item"><a class="page-link" href="#">1</a></li>
   			<li class="page-item"><a class="page-link" href="#">2</a></li>
    		<li class="page-item"><a class="page-link" href="#">3</a></li>
   			<li class="page-item">
      			<a class="page-link" href="#" aria-label="Next">
       		 		<span aria-hidden="true">&raquo;</span>
     			 </a>
    		</li>
  			</ul>
		</nav>
		</td>
		
		<!-- 글쓰기/처음으로 버튼 -->
		<td align="right">
			<a href="#" class="btn btn-primary">글쓰기</a>
			<a href="#" class="btn btn-primary">처음으로</a>
		</td>
	</tr>
</table>




</div>



</body>
</html>



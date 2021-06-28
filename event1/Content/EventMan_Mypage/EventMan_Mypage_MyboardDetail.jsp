<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "domain.*" %>

 <%
	String member_id = (String)session.getAttribute("S_memberId");
 
	 int midx = 0;
	 
	 if (session.getAttribute("midx") != null) {
	 	midx = (int)session.getAttribute("midx");
	 }
	out.println("세션에 담긴 아이디는?");
	out.println(member_id);
	out.println(midx);
	
	ArrayList<EvBoardAskVo> alistboardask = (ArrayList<EvBoardAskVo>)request.getAttribute("alistboard");   
	
	%>    
    
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap에 필요한 CSS파일 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">


</script>
<title>EVENT MAN!</title>
	
<style>

</style>
</head>
<body>

<div class="fs-4 fw-bold">게시글 상세보기</div>
<div class="text-end">
	<button type="button" class="btn btn-outline-secondary btn-sm">게시글 수정하기</button>
</div>

<!-- 게시글 리스트 -->
<div class="container" id="myboardbox">
	<div>게시판 제목</div>
	<div>
		<span>등록일</span>
		<span>000000</span>
		<span>작성자</span>
		<span>ㄱㄱㄱㄱㄱ</span>
		<span>조회수</span>
		<span>98999</span>
	</div>
	<div>
		<div>게시물내여ㅛㅇ</div>
		<div>게시물내여ㅛㅇ</div>
		<div>게시물내여ㅛㅇ</div>
		<div>게시물내여ㅛㅇ</div>
	</div>







<%-- 
	<table class="table table-hover">
		<thead>
			<th>카테고리</th>
			<th colspan="2">제목</th>
			<th></th>
			<th>작성일</th>
			<th>작성자</th>
			<th>조회수</th>  
		</thead>
		<tbody>
		<% for(EvBoardAskVo bavo: alistboardask){ %>
			<tr onclick="myboarddetailFn()">
				<td><%=bavo.getBcata()%></td>
				<td colspan="2"><%=bavo.getBtitle()%></td>
				<td></td>
				<td><%=bavo.getBWrieday2()%></td>
				<td><%=bavo.getBname()%></td>
				<td><%=bavo.getBcount() %></td>
			</tr>
		<%} %>
		</tbody>
	</table>
</div>

 --%>



<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>
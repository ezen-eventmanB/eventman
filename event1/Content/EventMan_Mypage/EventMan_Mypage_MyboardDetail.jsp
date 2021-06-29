<%@page import="vo.EvBoardAskVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	String member_id = (String)session.getAttribute("S_memberId");
 
	 int midx = 0;
	 
	 if (session.getAttribute("midx") != null) {
	 	midx = (int)session.getAttribute("midx");
	 }
	
	EvBoardAskVo bavo = (EvBoardAskVo)request.getAttribute("bavo");
	
	%>    
    
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap에 필요한 CSS파일 -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>

<title>EVENT MAN!</title>
	
<style>

</style>
</head>
<body>

<div class="fs-4 fw-bold mb-5">게시글 상세보기</div>


<!-- 게시글 리스트 -->
<div class="container" id="myboardbox">
	<div><%=bavo.getBcata() %></div>
	<div class="fs-1 fw-bold mb-3"><%=bavo.getBtitle() %></div>
	<div class="mb-5">
		<span class="fw-bold me-2">등록일</span>
		<span class=" me-3"><%=bavo.getBWrieday2() %></span>
		<span class="fw-bold me-2">작성자</span>
		<span class=" me-3"><%=bavo.getBname() %></span>
		<span class="fw-bold me-2">조회수</span>
		<span class=" me-3"><%=bavo.getBcount() %></span>
	</div>
	<div>
		<div><%=bavo.getBcontents() %></div>
		<div>
			<%if(bavo.getBfile()!=null){%>
				<img></img><%=bavo.getBfile() %>
			<%} %>
		</div>
	</div>
	<div class="text-end">
		<button type="button" class="btn btn-outline-secondary btn-sm">게시글 수정하기</button>
	</div>
</div>

<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>
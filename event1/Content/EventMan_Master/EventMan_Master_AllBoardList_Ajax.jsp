<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.EvBoardAskVo" %>
 <%
	String member_id = (String)session.getAttribute("S_memberId");
 
	 int midx = 0;
	 int gidx = 0;
	 
	 if (session.getAttribute("midx") != null) {
	 	midx = (int)session.getAttribute("midx");
	 }else if(session.getAttribute("gidx") !=null ){
		 gidx= (int)session.getAttribute("gidx");
	 }

	%>    
	<%
	ArrayList<EvBoardAskVo> alist = (ArrayList<EvBoardAskVo>)request.getAttribute("alist");
	
	
	
	%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap에 필요한 CSS파일 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
	
	
<title>견적신청리스트</title>

<style>
	#fontcolor{
		color:lightgray;
	}
</style>
</head>
<body>



<!-- 견적신청 리스트 table -->
<div class="container">
	<table class="table table-hover">
		<thead>
			<tr class="text-center">
				<th>글번호</th>
				<th colspan="2">카테고리</th>
				<th></th>
				<th>제목</th>
				<th>작성아이디</th>
				<th>작성일</th>
				<th>조회수</th>
				<th></th>
			</tr>
		</thead>
		
			<tbody class="align-middle">
					<% for(EvBoardAskVo ebvo : alist){ %>
						<tr>
							<td onclick="location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Master_BoardDetail.do?bidx=<%=ebvo.getBidx()%>'" class="text-center"><%=ebvo.getBidx() %></td>
							<td onclick="location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Master_BoardDetail.do?bidx=<%=ebvo.getBidx()%>'" colspan="2"><%=ebvo.getBcata()%></td>
							<td></td>
							<td onclick="location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Master_BoardDetail.do?bidx=<%=ebvo.getBidx()%>'" class="text-center"><%=ebvo.getBtitle()%></td>
							<td onclick="location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Master_BoardDetail.do?bidx=<%=ebvo.getBidx()%>'" class="text-center"><%=ebvo.getBname()%></td>
							<td onclick="location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Master_BoardDetail.do?bidx=<%=ebvo.getBidx()%>'" class="text-center"><%=ebvo.getBWrieday2()%></td>
							<td onclick="location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Master_BoardDetail.do?bidx=<%=ebvo.getBidx()%>'" class="text-center"><%=ebvo.getBcount() %></td>
							<td class="text-center">
								<div class="btn-group " role="group" aria-label="Basic outlined example">
									<button type="button" class="btn btn-outline-secondary btn-sm">답변</button>
									<button type="button" class="btn btn-outline-secondary btn-sm" onclick="costdeletFn()">삭제</button>
								</div>
							</td>
						</tr>
					 <%}; %>
				</tbody>
	</table>
</div>



<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</body>
</html>
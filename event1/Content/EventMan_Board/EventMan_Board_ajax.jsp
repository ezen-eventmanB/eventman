<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>

 <%
	String member_id = (String)session.getAttribute("S_memberId");
 
	 int midx = 0;
	 int gidx = 0;
	 
	 if (session.getAttribute("midx") != null) {
	 	midx = (int)session.getAttribute("midx");
	 }else if(session.getAttribute("gidx") !=null ){
		 gidx= (int)session.getAttribute("gidx");
	 }

	
	 
	
	ArrayList<EvBoardAskVo> alistboard = (ArrayList<EvBoardAskVo>)request.getAttribute("alistboard1");  
	%>    

<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap에 필요한 CSS파일 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<title>EVENT MAN!</title>


</head>
<body>




	<!-- 게시글 리스트 -->
   <div class="container" id="boardtable">
		<table class="table table-hover">	   
			<thead>
				<th class="text-center">카테고리</th>
				<th class="text-center" colspan="2">제목</th>
				<th></th>
				<th class="text-center">작성일</th>
				<th class="text-center">작성자</th>
				<th class="text-center">조회수</th>  
			</thead>
			<tbody>
				<% for(EvBoardAskVo evbo: alistboard){ %>
					<input type="hidden" name="gidx" value="<%=evbo.getGidx()%>"> 
					<%if(evbo.getBcata().equals("공지사항")){ %>
					<tr onclick="location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Board_Detail.do?bidx='+<%=evbo.getBidx()%>">
						<td class="text-center"><%=evbo.getBcata()%></td>
						<td class="fw-bolder" colspan="2"><%=evbo.getBtitle()%></td>
						<td></td>
						<td class="text-center"><%=evbo.getBWrieday2()%></td>
						<td class="text-center"><%=evbo.getgName()%></td>
						<td class="text-center"><%=evbo.getBcount()%></td>
					</tr>
					<%}; %>

				<%}; %> 
				<% for(EvBoardAskVo evbo: alistboard){ %>
					<input type="hidden" name="gidx" value="<%=evbo.getGidx()%>"> 
					<%if(!evbo.getBcata().equals("공지사항")){ %>
					<tr onclick="location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Board_Detail.do?bidx='+<%=evbo.getBidx()%>">
						<td class="text-center"><%=evbo.getBcata()%></td>
						<td colspan="2"><%=evbo.getBtitle()%></td>
						<td></td>
						<td class="text-center"><%=evbo.getBWrieday2()%></td>
						<td class="text-center"><%=evbo.getgName()%></td>
						<td class="text-center"><%=evbo.getBcount()%></td>
					</tr>
					<%}; %>

				<%}; %> 
			</tbody> 
		</table>
   </div>



<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.EvCostVo" %>
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
	ArrayList<EvCostVo> alist = (ArrayList<EvCostVo>)request.getAttribute("alist");
	
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
				<th class="d-none d-lg-table-cell">글번호</th>
				<th class="d-table-cell">제목</th>
				<th class="d-none d-md-table-cell">작성일</th>
				<th class="d-none d-md-table-cell">작성아이디</th>
				<th class="d-none d-lg-table-cell">작성자</th>
				<th class="d-none d-lg-table-cell">조회수</th>
				<th class="d-table-cell"></th>
			</tr>
		</thead>
		<tbody class="align-middle">
			<% for(EvCostVo cvo : alist){ %>
				<tr <%if(cvo.getCostDelYn().equals("Y")){ %>style="color:lightgray;"  <%}; %>>
					<td onclick="location.href='<%=request.getContextPath()%>/EventMan_Cost/EventMan_Mypage_CostDetail.do?cidx=<%=cvo.getCidx()%>'" class="text-center d-none d-lg-table-cell"><%=cvo.getCidx() %></td>
					<td onclick="location.href='<%=request.getContextPath()%>/EventMan_Cost/EventMan_Mypage_CostDetail.do?cidx=<%=cvo.getCidx()%>'" class="d-table-cell"><%=cvo.getCostName()%>
		               	<%if(cvo.getCcondition().equals("견적등록완료")){ %>
		               		<span><button type="button" class="btn btn-light btn-sm" disabled><%=cvo.getCcondition()%></button></span> 
		               	<%}else if(cvo.getCcondition().equals("상담중") || cvo.getCcondition().equals("상담완료")){ %>
		               		<span><button type="button" class="btn btn-secondary btn-sm" disabled><%=cvo.getCcondition()%></button></span> 
		               	<%}; %>
					</td>
					<td onclick="location.href='<%=request.getContextPath()%>/EventMan_Cost/EventMan_Mypage_CostDetail.do?cidx=<%=cvo.getCidx()%>'" class="text-center d-none d-md-table-cell"><%=cvo.getSubWritedate()%></td>
					<td onclick="location.href='<%=request.getContextPath()%>/EventMan_Cost/EventMan_Mypage_CostDetail.do?cidx=<%=cvo.getCidx()%>'" class="text-center d-none d-md-table-cell"><%=cvo.getCName()%></td>
					<td onclick="location.href='<%=request.getContextPath()%>/EventMan_Cost/EventMan_Mypage_CostDetail.do?cidx=<%=cvo.getCidx()%>'" class="text-center d-none d-lg-table-cell"><%=cvo.getRealname()%></td>
					<td onclick="location.href='<%=request.getContextPath()%>/EventMan_Cost/EventMan_Mypage_CostDetail.do?cidx=<%=cvo.getCidx()%>'" class="text-center d-none d-lg-table-cell"><%=cvo.getCcount() %></td>
					<td class="text-center d-table-cell">
						<div class="btn-group " role="group" aria-label="Basic outlined example">
							<button type="button" class="btn btn-outline-secondary btn-sm" onclick="replyfinshFN(<%=cvo.getCidx()%>, '<%=cvo.getCostName()%>')">완료처리</button>
							<button type="button" class="btn btn-outline-secondary btn-sm" onclick="costdeletFn(<%=cvo.getCidx()%>, '<%=cvo.getCostName()%>')">삭제</button>
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
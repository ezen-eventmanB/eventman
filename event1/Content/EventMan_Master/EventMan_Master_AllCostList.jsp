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
	out.println("세션에 담긴 아이디는?");
	out.println(member_id);

	out.println("midx="+midx);
	out.println("gidx="+gidx); 
	
	%>    
	<%
	ArrayList<EvCostVo> arraycost = (ArrayList<EvCostVo>)request.getAttribute("arraycost");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap에 필요한 CSS파일 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	
	<!-- top nav CSS -->
	<link rel="stylesheet" type="text/css" href="../css/topnav.css">
	<!-- footer CSS -->
	<link rel="stylesheet" type="text/css" href="../css/footer.css">
	
<title>견적신청리스트</title>

<style>


</style>

</head>
<body>


<!-- 상단 네비 부분 -->
<div class="container">
	<nav class="navbar navbar-expand-xxl navbar-light " id="topnav">
	
		<a class="navbar-brand" href="<%=request.getContextPath()%>/EventMan_Main/EventMan_Main.do">
	     	<img src="../rogo1.png" alt="" class="d-inline-block align-text-top" id="toprogoimg">
	    </a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
	      	<span class="navbar-toggler-icon"></span>
	   	</button>
	    <div class="collapse navbar-collapse w-50" id="navbarNav">
	    
      		<ul class="navbar-nav me-auto mb-2 mb-lg-0" id="navbar-nav">
        		<li class="nav-item px-5">
          			<a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Cost/EventMan_Cost.do">견적신청</a>
       		</li>
       		<li class="nav-item px-5">
         			<a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do">행사리뷰</a>
       		</li>
      			<li class="nav-item px-5">
         			<a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Company/EventMan_Company_Main.do">회사소개</a>
      			</li>
      			<li class="nav-item px-5">
         			<a class="nav-link fw-bolder text-reset" href="<%=request.getContextPath()%>/EventMan_Board/EventMan_Board.do">게시판</a>
      			</li>
      		</ul>
      	

		<!--로그인 전 상단 화면  -->	
				<%
						if(midx == 0 && gidx ==0){
						%>
						
		       		<ul class="navbar-nav" id="Memberbox" >	
		       			<li class="nav-item">
		          			<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Join.do">회원가입</a>
		       			</li>
		       			<li class="nav-item"> 
		          			<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_Login.do">로그인</a>
		       			</li>																	
		      		</ul>
		      		
		      	<!--로그인 후 상단 화면  -->
						<%
				      	}else if(midx > 0){
						%>	
			       	<ul class="navbar-nav" id="Memberbox" >	
			       		<li class="nav-item">
			          		<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Main.do?midx=<%=midx%>">My page</a>
			       		</li>
			       		<li class="nav-item"> 
			          		<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Mypage/EventMan_Mypage_Modify.do">계정 설정</a>
			       		</li>
			       		<li class="nav-item"> 
			          		<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_LogoutAction.do">로그아웃</a>
			       		</li>																			
			      	</ul>
				   		<%
				   		}else if(gidx > 0){
				   		%>
				   		<ul class="navbar-nav" id="Memberbox" >	
			       		<li class="nav-item">
			          		<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Master/EventMan_Master_Mainpage.do?midx=<%=gidx%>">Master page</a>
			       		</li>
			       		<li class="nav-item"> 
			          		<a class="nav-link fw-bold" href="<%=request.getContextPath()%>/EventMan_Member/EventMan_Member_LogoutAction.do">로그아웃</a>
			       		</li>																			
			      	</ul>
				   		<%
				   		}
				   		%>
	    	</div>	
		</nav>
</div>


<!-- 중간 네비 부분 -->
<div class="container">
	<p class="fs-2 fw-bold mt-5 mb-5">견적 신청함</p>
	
	<div class="row float-end mt-5">
		<div class="col-md-auto mt-1">
			<div class="input-group input-group-sm ">	
				<div class="btn-group"  id="orderbybtn" role="group" aria-label="Basic radio toggle button group">
					<input type="radio" class="btn-check" name="btnradio" autocomplete="off" >
					<label class="btn btn-outline-secondary btn-sm" for="btnradio1">과거</label>
					
					<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" checked>
					<label class="btn btn-outline-secondary btn-sm" for="btnradio2">최신</label>
				</div>
			</div>
		</div>
		<div class="col-md-auto mt-1">	
			<select class="form-select form-select-sm" aria-label=".form-select-sm example">
				<option selected>검색타입</option>
				<option value="1">제목</option>
				<option value="2">아이디</option>
				<option value="3">이름</option>
			</select>
		</div>
		<div class="col-md-auto mt-1">
			<div class="input-group input-group-sm mb-3">
				<input type="text" class="form-control" id="searchbox2" placeholder="검색어입력" aria-label="Recipient's username" aria-describedby="button-addon2">
				<button class="btn btn-outline-secondary " type="button" id="button-addon2">검색</button>
			</div>
		</div>
	</div>
	
</div>


<!-- 견적신청 -->
<div class="container">
	<table class="table table-hover">
		<thead>
			<tr class="text-center">
				<th>글번호</th>
				<th colspan="2">제목</th>
				<th></th>
				<th>작성일</th>
				<th>작성아이디</th>
				<th>작성자</th>
				<th>조회수</th>
				<th></th>
			</tr>
		</thead>
	<tbody class="align-middle">
		<% for(EvCostVo cvo : arraycost){ %>
			<tr onclick="location.href='<%=request.getContextPath()%>/EventMan_Board/EventMan_Mypage_CostDetail.do?bidx=<%=cvo.getCidx()%>'">
				<td class="text-center"><%=cvo.getCidx() %></td>
				<td colspan="2"><%=cvo.getCostName()%></td>
				<td></td>
				<td class="text-center"><%=cvo.getSubWritedate()%></td>
				<td class="text-center"><%=cvo.getCName()%></td>
				<td class="text-center"><%=cvo.getRealname()%></td>
				<td class="text-center"><%=cvo.getCcount() %></td>
				<td>
					<div class="btn-group" role="group" aria-label="Basic outlined example">
						<button type="button" class="btn btn-outline-secondary btn-sm">답변</button>
						<button type="button" class="btn btn-outline-secondary btn-sm">삭제</button>
					</div>
				</td>
			</tr>
		<%}; %>
		</tbody>
	</table>
</div>


<%-- 
<!-- 행사리뷰 페이징 처리 -->
	<div class="container mt-5 text-center">
		<div class="row justify-content-md-center">
			<div class="col-md-auto">	
				<nav aria-label="Page navigation example">
					<ul class="pagination">
					<%if(pm.isPrev() == true) {%>
						<li class="page-item">
							<a class="page-link" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do?page=<%=pm.getStartPage()-1 %>">
								<span aria-hidden="false">&laquo;</span>
							</a>
						</li>
					<%} %>
					<% for(int i = pm.getStartPage(); i<=pm.getEndPage(); i++) {%>
						<li class="page-item">
							<a class="page-link" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do?page=<%=i %>"><%=i %></a>
						</li>
					<% } %>
				
					<% if(pm.isNext() == true){ %>
						<li class="page-item">
							<a class="page-link" href="<%=request.getContextPath()%>/EventMan_Review/EventMan_Review_Main.do?page=<%=pm.getEndPage()+1 %>" >
								<span aria-hidden="false">&raquo;</span>
							</a>
						</li>
					<%} %>
					</ul>
				</nav>
			</div>
		</div>
	</div> --%>






<!-- 메인 푸터 -->
<div class="footer">
</div>
	<div class="container">
		 <div class="row justify-content-md-center">
			<div class="col-md-auto">
				<img src="../rogo1.png" alt="" width="200" class="d-inline-block align-text-center">
			</div>
			<div class="col-md-auto">
				<small class="text-muted">
					전화번호 063-222-2222<br>
					EVENTMAN | 전주시 덕진구 효자동 | 대표. 000<br>
					ACC. 계좌번호 (예금주 :홍길동) | 사업자 번호. 000-000-0000<br>
				</small>
			</div>
		</div>
	</div>
</div>


<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</body>
</html>
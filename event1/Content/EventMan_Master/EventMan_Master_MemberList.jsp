<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>

<%
	String member_id = (String)session.getAttribute("S_memberId");
 
	 int midx = 0;
	 
	 if (session.getAttribute("midx") != null) {
	 	midx = (int)session.getAttribute("midx");
	 }
	out.println("세션에 담긴 아이디는?");
	out.println(member_id);
	out.println(midx);

%>  

<% ArrayList<EvMemberVo> alist = (ArrayList<EvMemberVo>)request.getAttribute("alist"); %>
	

    
    
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap에 필요한 CSS파일 -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<title>EVENT MAN!</title>

	<!-- top nav CSS -->
	<link rel="stylesheet" type="text/css" href="../css/topnav.css">
	<!-- footer CSS -->
	<link rel="stylesheet" type="text/css" href="../css/footer.css">
	<!-- subnav CSS -->
	<link rel="stylesheet" type="text/css" href="../css/subnav.css">
	  
<style>
	table {
    margin:auto;
	}

	table, td, th {
    border-collapse : collapse;
    border : 1px solid black;
	}
	
	.tr1 {
		font-weight: 500;
		background-color:#D5D5D5;
	
	}
	
	.tr2 {
		background-color:#F6F6F6;
		
	}
</style>
</head>
<body>

<div class="container ajax">

<!-- 상단 네비 부분 -->
	<div class="container">
		<nav class="navbar navbar-expand-xxl navbar-light " id="topnav">
		
			<a class="navbar-brand" href="../EventMan_Main/EventMan_Main.jsp">
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
						if(member_id == null){
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
				      	}else{
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
				   		}
				    	%>
	    	</div>	
		</nav>
</div>
		
		

<!-- 페이지 위치 안내 -->
<div class="container"  id="containermargin">	
		<!-- 집 아이콘 -->
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
			<path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
			<path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
		</svg>
		
		<!-- 화살표 아이콘 -->
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
			<path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
		</svg>
		
		<!-- 현제 페이지 이름 -->
		게시판
</div>


<!-- 게시물 검색창 -->
<nav style="max-width:1300px; margin:0px auto; margin-top: 30px;">
	<div class="input-group input-group-sm mb-3">
		 <div class="input-group input-group-sm mb-3">
			<span class="input-group-text" id="inputGroup-sizing-sm">검색</span>
			<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
		</div>
	</div>
</nav>
   

<center><h1>회원관리</h1></center>
<table border=1 style= "text-align:center; width:600px; height:100px">
<tr class="tr1">
<td>번호</td>
<td>아이디</td>
<td>이름</td>
<td>이메일</td>
<td>핸드폰 번호</td>
<td>가입일</td>
<td>회원 종류</td>
<td>회원 상태</td>
</tr>

<%for(EvMemberVo mv : alist) { %>
<tr class="tr2">
<td><%=mv.getMidx()%></td>  
<td><%=mv.getmId() %></td>
<td><%=mv.getmName() %></td>
<td><%=mv.getmEmail() %></td>
<td><%=mv.getmPhn() %></td>
<td><%=mv.getmType()%></td>
<td><%=mv.getWdate()%></td>
<td><%=mv.getmDelYn()%></td>

</tr>
<% } %>



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



<!-- Bootstrap에 필요한 JS파일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous"></body>
</html>